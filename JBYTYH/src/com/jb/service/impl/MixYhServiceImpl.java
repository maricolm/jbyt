package com.jb.service.impl;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.jb.mapper.YhMapper;
import com.jb.pojo.ResultData;
import com.jb.pojo.ViewData;
import com.jb.service.MixYhService;
import matlabcontrol.MatlabProxy;

/**
 * @author: mulming
 * @ClassName: YhServiceImpl
 * @date: 2018年7月23日 下午8:41:46
 * @Description:TODO(这里用一句话描述这个类的作用)
 */
@Service
public class MixYhServiceImpl implements MixYhService {
	@Autowired
	private YhMapper yhMapper;

	@Override
	public List<double[]> getMixReList(int kind, double[] C, double[] Q, double[] QQ, double a, double b, double c,
			double investment, HttpServletRequest req,int year) {
		List<double[]> xAndValue=new ArrayList<double[]>();
		Object[] result=null;
		try {
			MatlabProxy proxy=(MatlabProxy) req.getServletContext().getAttribute("proxy");
			if(year==2) {
				 result = proxy.returningFeval("mixTwo",2,C,Q,QQ,kind,a,b,c,investment);
			}else if(year==3) {
				 result = proxy.returningFeval("mixThree",2,C,Q,QQ,kind,a,b,c,investment);
			}else if(year==4) {
				 result = proxy.returningFeval("mixFour",2,C,Q,QQ,kind,a,b,c,investment);
			}else if(year==5) {
				 result = proxy.returningFeval("mixFive",2,C,Q,QQ,kind,a,b,c,investment);
			}
			double[] x=(double[]) result[0];
			xAndValue.add(x);
			double[] val=(double[]) result[1];
			xAndValue.add(val);
		} catch (Exception e) {
			e.getMessage();
		}
		return xAndValue;
	}

	//返回结果矩阵的索引号
	@Override
	public List<Integer> getResultListOfYH(double[] xResult) {
		//double[] xResult1={0,0,1,1,0,1,1,0,0,0,1,1,0,1,1,0,0,0,1,1,0,1,1,0};
		// [11, 16, 26, 31]
		List<Integer> re=new ArrayList<Integer>();
		for(int i=0;i<xResult.length;i++) {
			if(xResult[i]>0.5) {
				re.add(i/8+1+i%8*5);
			}
		}
		return re;
	}

	@Override
	public List<ViewData> getListOneKindFrontYearByYear(int kind, int year) {
		List<ViewData> reLi=new ArrayList<ViewData>();
		for(int i=1;i<=year;i++) {
			ViewData temp=new ViewData();
			temp.setKind(kind);
			temp.setLimY(i);
			ViewData vi=yhMapper.getOneKindData(temp);
			if(i==1) {
				vi.setTotalCost(vi.getCost1());
				vi.setTotalInoil(vi.getInoil1());
			}else if(i==2) {
				vi.setTotalCost(vi.getCost1()+vi.getCost2());
				vi.setTotalInoil(vi.getInoil1()+vi.getInoil2());
			}
			else if(i==3) {
				vi.setTotalCost(vi.getCost1()+vi.getCost2()+vi.getCost3());
				vi.setTotalInoil(vi.getInoil1()+vi.getInoil2()+vi.getInoil3());
			}
			else if(i==4) {
				vi.setTotalCost(vi.getCost1()+vi.getCost2()+vi.getCost3()+vi.getCost4());
				vi.setTotalInoil(vi.getInoil1()+vi.getInoil2()+vi.getInoil3()+vi.getInoil4());
			}else if(i==5) {
				vi.setTotalCost(vi.getCost1()+vi.getCost2()+vi.getCost3()+vi.getCost4()+vi.getCost5());
				vi.setTotalInoil(vi.getInoil1()+vi.getInoil2()+vi.getInoil3()+vi.getInoil4()+vi.getInoil5());
			}
			reLi.add(vi);
		}
		return reLi;
	}

	public ViewData getBaseOil(int year,double rate,double iolNum) {
		//ViewData temp=new ViewData();
		//temp.setLimY(1);
		//temp.setKind(10);
		//ViewData data=yhMapper.getOneKindData(temp);
		double temp=1+rate;
		ViewData data=new ViewData();
		data.setDecrate(-rate*100);
		data.setInoil1(iolNum*temp);
		data.setInoil2(iolNum*temp*temp);
		data.setInoil3(iolNum*temp*temp*temp);
		data.setInoil4(iolNum*temp*temp*temp*temp);
		data.setInoil5(iolNum*temp*temp*temp*temp*temp);
		if(year==1){
			data.setTotalInoil(data.getInoil1());
		}else if(year==2) {
			data.setTotalInoil(data.getInoil1()+data.getInoil2());
		}else if(year==3) {
			data.setTotalInoil(data.getInoil1()+data.getInoil2()+data.getInoil3());
		}else if(year==4) {
			data.setTotalInoil(data.getInoil1()+data.getInoil2()+data.getInoil3()+data.getInoil4());
		}else if(year==5) {
			data.setTotalInoil(data.getInoil1()+data.getInoil2()+data.getInoil3()+data.getInoil4()+data.getInoil5());
		}
		return data;
	}
	
	public ViewData getOneKindData(int kind,int year) {
		ViewData temp=new ViewData();
		temp.setKind(kind);
		temp.setLimY(year);
		ViewData data=yhMapper.getOneKindData(temp);
		if(year==1){
			data.setTotalCost(data.getCost1());
			data.setTotalInoil(data.getInoil1());
		}else if(year==2) {
			data.setTotalCost(data.getCost1()+data.getCost2());
			data.setTotalInoil(data.getInoil1()+data.getInoil2());
		}else if(year==3) {
			data.setTotalCost(data.getCost1()+data.getCost2()+data.getCost3());
			data.setTotalInoil(data.getInoil1()+data.getInoil2()+data.getInoil3());
		}else if(year==4) {
			data.setTotalCost(data.getCost1()+data.getCost2()+data.getCost3()+data.getCost4());
			data.setTotalInoil(data.getInoil1()+data.getInoil2()+data.getInoil3()+data.getInoil4());
		}else if(year==5) {
			data.setTotalCost(data.getCost1()+data.getCost2()+data.getCost3()+data.getCost4()+data.getCost5());
			data.setTotalInoil(data.getInoil1()+data.getInoil2()+data.getInoil3()+data.getInoil4()+data.getInoil5());
		}
		return data;
	}
	
	public List<ResultData> getResultData(List<Integer> matrix,double b) {
		List<ResultData> re=new ArrayList<ResultData>();
		for(int i=0;i<matrix.size();i++) {
			ResultData temp=new ResultData();
			ViewData vi=yhMapper.getViewDataByNum(matrix.get(i));
			temp.setName(vi.getName());
			temp.setMothod(vi.getMothod());
			temp.setWaterwell(vi.getWaterwell());
			temp.setOilwell(vi.getOilwell());
			temp.setRec(vi.getDecrate());
			temp.setYear(vi.getLimY());
			int year=vi.getLimY();
			if(year==1) {
				temp.setCsCost1(vi.getCost1());
				temp.setIncOil1(vi.getInoil1());
				temp.setCzCost1(temp.getIncOil1()*b);
				temp.setTotalCost(temp.getCsCost1()+temp.getCzCost1());
				temp.setTotalInoil(temp.getIncOil1());
				re.add(temp);
			}else if(year==2) {
				temp.setCsCost1(vi.getCost1());
				temp.setCsCost2(vi.getCost2());
				temp.setIncOil1(vi.getInoil1());
				temp.setIncOil2(vi.getInoil2());
				temp.setCzCost1(temp.getIncOil1()*b);
				temp.setCzCost2(temp.getIncOil2()*b);
				temp.setTotalCost(temp.getCsCost1()+temp.getCsCost2()+temp.getCzCost1()+temp.getCzCost2());
				temp.setTotalInoil(temp.getIncOil1()+temp.getIncOil2());
				re.add(temp);
			}else if(year==3) {
				temp.setCsCost1(vi.getCost1());
				temp.setCsCost2(vi.getCost2());
				temp.setCsCost3(vi.getCost3());
				temp.setIncOil1(vi.getInoil1());
				temp.setIncOil2(vi.getInoil2());
				temp.setIncOil3(vi.getInoil3());
				temp.setCzCost1(temp.getIncOil1()*b);
				temp.setCzCost2(temp.getIncOil2()*b);
				temp.setCzCost3(temp.getIncOil3()*b);
				temp.setTotalCost(temp.getCsCost1()+temp.getCsCost2()+temp.getCsCost3()+temp.getCzCost1()+temp.getCzCost2()+temp.getCzCost3());
				temp.setTotalInoil(temp.getIncOil1()+temp.getIncOil2()+temp.getIncOil3());
				re.add(temp);
			}else if(year==4) {
				temp.setCsCost1(vi.getCost1());
				temp.setCsCost2(vi.getCost2());
				temp.setCsCost3(vi.getCost3());
				temp.setCsCost4(vi.getCost4());
				temp.setIncOil1(vi.getInoil1());
				temp.setIncOil2(vi.getInoil2());
				temp.setIncOil3(vi.getInoil3());
				temp.setIncOil4(vi.getInoil4());
				temp.setCzCost1(temp.getIncOil1()*b);
				temp.setCzCost2(temp.getIncOil2()*b);
				temp.setCzCost3(temp.getIncOil3()*b);
				temp.setCzCost4(temp.getIncOil4()*b);
				temp.setTotalCost(temp.getCsCost1()+temp.getCsCost2()+temp.getCsCost3()+temp.getCsCost4()
									+temp.getCzCost1()+temp.getCzCost2()+temp.getCzCost3()+temp.getCzCost4());
				temp.setTotalInoil(temp.getIncOil1()+temp.getIncOil2()+temp.getIncOil3()+temp.getIncOil4());
				re.add(temp);
			}else if(year==5) {
				temp.setCsCost1(vi.getCost1());
				temp.setCsCost2(vi.getCost2());
				temp.setCsCost3(vi.getCost3());
				temp.setCsCost4(vi.getCost4());
				temp.setCsCost5(vi.getCost5());
				temp.setIncOil1(vi.getInoil1());
				temp.setIncOil2(vi.getInoil2());
				temp.setIncOil3(vi.getInoil3());
				temp.setIncOil4(vi.getInoil4());
				temp.setIncOil5(vi.getInoil5());
				temp.setCzCost1(temp.getIncOil1()*b);
				temp.setCzCost2(temp.getIncOil2()*b);
				temp.setCzCost3(temp.getIncOil3()*b);
				temp.setCzCost4(temp.getIncOil4()*b);
				temp.setCzCost5(temp.getIncOil5()*b);
				temp.setTotalCost(temp.getCsCost1()+temp.getCsCost2()+temp.getCsCost3()+temp.getCsCost4()+temp.getCsCost5()
									+temp.getCzCost1()+temp.getCzCost2()+temp.getCzCost3()+temp.getCzCost4()+temp.getCzCost5());
				temp.setTotalInoil(temp.getIncOil1()+temp.getIncOil2()+temp.getIncOil3()+temp.getIncOil4()+temp.getIncOil5());
				re.add(temp);
			}
		}
		return re;
	}

	/* (non-Javadoc)
	 * @see com.jb.service.MixYhService#getResultFiveListOfYH(double[])
	 */
	@Override
	public List<Integer> getResultFiveListOfYH(double[] xResult) {
		List<Integer> re=new ArrayList<Integer>();
		for(int i=0;i<xResult.length;i++) {
			if(i<40) {
				if(xResult[i]>0.5) {
					re.add(i/8+1+i%8*5);
				}
			}else {
				if(xResult[i]>0.5) {
					re.add(45);
				}
			}
		}
		return re;
	}

	/**
	 * 读取Excel数据到数据库,通过文件域
	 * mulming
	 * readExcelByFile
	 * @param file  文件域
	 */
	 public void  readExcelByFile(MultipartFile file)  throws Exception{
		 if(file!=null) {
			 yhMapper.deleteData();
		 }
		 List<String> name=new ArrayList<String>();//定义临时存储空间，获取编号
		 name.add("提液");
		 name.add("注采比");
		 name.add("压裂");
		 name.add("酸化");
		 name.add("补孔");
		 name.add("堵水");
		 name.add("活化水");
		 name.add("注聚合物");
		 name.add("加密井");
			
	    InputStream inputStream = null;  
	    Workbook workbook = null;  
	        inputStream = file.getInputStream();  
	        workbook = WorkbookFactory.create(inputStream);  
	        inputStream.close();  
	        //工作表对象  
	        Sheet sheet = workbook.getSheetAt(0);  
	        //总行数  
	        int rowLength = sheet.getLastRowNum()+1;  
	        //工作表的列  
	        Row row = sheet.getRow(0);  
	        //总列数  
	        int colLength = row.getLastCellNum();  
	        //得到指定的单元格  
	        Cell cell = row.getCell(0);  
	        //得到单元格样式  
	     //   CellStyle cellStyle = cell.getCellStyle();  
	       // System.out.println("行数：" + rowLength + ",列数：" + colLength);  
	       loo1: for (int i = 1; i < rowLength; i++) {  
	            row = sheet.getRow(i); 
	            ViewData vi=new ViewData();
	            for (int j = 0; j < colLength; j++) {  
	                cell = row.getCell(j);  
	                if (cell != null)  
	                    cell.setCellType(CellType.STRING);
	                if(j==0) {
	                	int kind=name.indexOf(cell.getStringCellValue())+1;
	                	if(kind<1||kind>9) {
	                		continue loo1;
	                	}
	                	vi.setKind(kind);
	                	vi.setName(cell.getStringCellValue());
	                }
	              //  else if(j==1) {
	               // 	vi.setMothod(cell.getStringCellValue());
	              //  }
	                else if(j==1) {
	                	int s=vi.getKind();
	                	String d=cell.getStringCellValue();
	                	int num=(vi.getKind()-1)*5+Integer.parseInt(cell.getStringCellValue());
	                	vi.setMothod(cell.getStringCellValue());
	                	vi.setNum(num);
	                	vi.setLimY(Integer.parseInt(cell.getStringCellValue()));
	                }else if(j==2) {
	                	if(cell.getStringCellValue().length()!=0)
	                		vi.setCost1(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==3) {
	                	if(cell.getStringCellValue().length()!=0)
	                		vi.setCost2(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==4) {
	                	if(cell.getStringCellValue().length()!=0)
	                		vi.setCost3(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==5) {
	                	if(cell.getStringCellValue().length()!=0)
	                		vi.setCost4(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==6) {
	                	if(cell.getStringCellValue().length()!=0)
	                		vi.setCost5(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==7) {
	                	if(cell.getStringCellValue().length()!=0)
	                		vi.setInoil1(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==8) {
	                	if(cell.getStringCellValue().length()!=0)
	                		vi.setInoil2(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==9) {
	                	if(cell.getStringCellValue().length()!=0)
	                		vi.setInoil3(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==10) {
	                	if(cell.getStringCellValue().length()!=0)
	                		vi.setInoil4(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==11) {
	                	if(cell.getStringCellValue().length()!=0)
	                		vi.setInoil5(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==12) {
	                	if(cell.getStringCellValue().length()!=0)
	                		vi.setBalance(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==13) {
	                	if(cell.getStringCellValue().length()!=0)
	                		vi.setDecrate(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==14) {
	                	if(cell.getStringCellValue().length()!=0)
	                		vi.setWaterwell(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==15) {
	                	if(cell.getStringCellValue().length()!=0)
	                		vi.setOilwell(Double.parseDouble(cell.getStringCellValue()));
	                }
	            } 
	           //插入数据到数据库中
	           yhMapper.insertData(vi);
	        }  
	 }
}
