package com.jb.service.impl;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jb.controller.SortController;
import com.jb.mapper.YhMapper;
import com.jb.pojo.Sort1;
import com.jb.pojo.Sort2;
import com.jb.pojo.Temp;
import com.jb.pojo.ViewData;
import com.jb.service.ToolsService;

/**
 * @author: mulming
 * @ClassName: ToolsServiceImpl
 * @date: 2018年8月20日 下午9:10:50
 * @Description:TODO(这里用一句话描述这个类的作用)
 */
@Service
public class ToolsServiceImpl implements ToolsService {
	@Autowired
	private YhMapper yhMapper;
	/**
	 * 读取Excel数据到数据库,通过文件域
	 * mulming
	 * readExcelByFile
	 * @param file  文件域
	 */
	 public List<Sort1>  readExcelByFile(MultipartFile file)  throws Exception{
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
	      for (int i = 5; i < rowLength; i++) {  
	            row = sheet.getRow(i); 
	            Sort1 sort=new Sort1();
	            for (int j = 0; j < colLength; j++) {  
	                cell = row.getCell(j);  
	                if (cell != null)  
	                    cell.setCellType(CellType.STRING);
	                if(j==0) {
	                	sort.setCol1(cell.getStringCellValue());
	                }else if(j==1) {
	                	sort.setCol2(cell.getStringCellValue());
	                }else if(j==2) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol3(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==3) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol4(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==4) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol5(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==5) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol6(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==6) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol7(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==7) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol8(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==8) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol9(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==9) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol10(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==10) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol11(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==11) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol12(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==12) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol13(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==13) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol14(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==14) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol15(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==15) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol16(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==16) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol17(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==17) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol18(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==18) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol19(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==19) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol20(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==20) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol21(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==21) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol22(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==22) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol23(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==23) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol24(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==24) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol25(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==25) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol26(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==26) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol27(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==27) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol28(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==28) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol29(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==29) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol30(cell.getStringCellValue());
	                }else if(j==30) {
	                	sort.setCol31(Double.parseDouble(cell.getStringCellValue()));
	                }
	            } 
	           //插入数据到数据库中
	           yhMapper.insertSort1(sort);
	        }  
	      List<Sort1> sort=yhMapper.queryAll();
	      return sort;
	 }
	/* (non-Javadoc)
	 * @see com.jb.service.ToolsService#sortDateByUser(com.jb.pojo.Sort1)
	 */
	@Override
	public List<Sort1> sortDateByUser(Sort1 sort1) {
		return yhMapper.sortDateByUser(sort1);
	}
	
	/**
	 * mulming
	 * ExportData:把数据加载到workBook工作布中去
	 * @param data 输入数据：必须是List<List<String>>类型的数据
	 * @param head 表的第一行，即表头。list中第一个参数为sheet名， 后面一次为表头的参数，即项目的属性名称
	 * @return 返回导出文件后的地址
	 * String
	 * 下午5:24:09
	 */
	public void ExportDataToWorkbook(List<Sort1> data,String[] head,Workbook workbook) {
	    Sheet sheet = workbook.createSheet("排序结果");  //项目名存储到第一,表单名
	    Row headRow=sheet.createRow(0);
	    for(int i=0;i<head.length;i++) {
	    	headRow.createCell(i).setCellValue(head[i]);
	    }
		for(int i=0;i<data.size();i++) {
			Row row = sheet.createRow(i+1); 
			row.createCell(0).setCellValue(data.get(i).getCol1());
			row.createCell(1).setCellValue(data.get(i).getCol2());
			row.createCell(2).setCellValue(data.get(i).getCol3());
			row.createCell(3).setCellValue(data.get(i).getCol4());
			row.createCell(4).setCellValue(data.get(i).getCol5());
			row.createCell(5).setCellValue(data.get(i).getCol6());
			row.createCell(6).setCellValue(data.get(i).getCol7());
			row.createCell(7).setCellValue(data.get(i).getCol8());
			row.createCell(8).setCellValue(data.get(i).getCol9());
			row.createCell(9).setCellValue(data.get(i).getCol10());
			row.createCell(10).setCellValue(data.get(i).getCol11());
			row.createCell(11).setCellValue(data.get(i).getCol12());
			row.createCell(12).setCellValue(data.get(i).getCol13());
			row.createCell(13).setCellValue(data.get(i).getCol14());
			row.createCell(14).setCellValue(data.get(i).getCol15());
			row.createCell(15).setCellValue(data.get(i).getCol16());
			row.createCell(16).setCellValue(data.get(i).getCol17());
			row.createCell(17).setCellValue(data.get(i).getCol18());
			row.createCell(18).setCellValue(data.get(i).getCol19());
			row.createCell(19).setCellValue(data.get(i).getCol20());
			row.createCell(20).setCellValue(data.get(i).getCol21());
			row.createCell(21).setCellValue(data.get(i).getCol22());
			row.createCell(22).setCellValue(data.get(i).getCol23());
			row.createCell(23).setCellValue(data.get(i).getCol24());
			row.createCell(24).setCellValue(data.get(i).getCol25());
			row.createCell(25).setCellValue(data.get(i).getCol26());
			row.createCell(26).setCellValue(data.get(i).getCol27());
			row.createCell(27).setCellValue(data.get(i).getCol28());
			row.createCell(28).setCellValue(data.get(i).getCol29());
			row.createCell(29).setCellValue(data.get(i).getCol30());
			row.createCell(30).setCellValue(data.get(i).getCol31());
		}
       workbook.setSheetName(0, "排序结果");  
	}
	
	public void export(HttpServletResponse response,Workbook wb,String fileName)throws Exception{
		 response.setHeader("Content-Disposition", "attachment;filename="+new String(fileName.getBytes("utf-8"),"iso8859-1"));
			response.setContentType("application/ynd.ms-excel;charset=UTF-8");
			OutputStream out=response.getOutputStream();
			wb.write(out);
			out.flush();
			out.close();
	 }
	/* (non-Javadoc)
	 * @see com.jb.service.ToolsService#findAll()
	 */
	@Override
	public List<Sort1> findAll() {
		List<Sort1> sort=yhMapper.queryAll();
	    return sort;
	}
	
	
	@Override
	public List<Sort2> readExcelByFile2(MultipartFile file) throws Exception {
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
	      for (int i = 2; i < rowLength; i++) {  
	            row = sheet.getRow(i); 
	            Sort2 sort=new Sort2();
	            for (int j = 0; j < colLength; j++) {  
	                cell = row.getCell(j);  
	                if (cell != null)  
	                    cell.setCellType(CellType.STRING);
	               if(j==1) {
	                	sort.setCol1(cell.getStringCellValue());
	                }else if(j==2) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol2(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==3) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol3(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==4) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol4(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==5) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol5(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==6) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol6(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==7) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol7(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==8) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol8(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==9) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol9(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==11) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol11(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==13) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol13(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==15) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol15(Double.parseDouble(cell.getStringCellValue()));
	                }else if(j==17) {
	                	if(cell.getStringCellValue().length()!=0)
	                		sort.setCol17(Double.parseDouble(cell.getStringCellValue()));
	                }
	            } 
	           //插入数据到数据库中
	           yhMapper.insertSort2(sort);
	        }  
	     Temp temp1=new Temp(null, "col9", null);
	     List<Sort2> sort1=yhMapper.findSort2Bydec(temp1);
	     for(int i=0;i<sort1.size();i++) {
	    	 Temp temp=new Temp(sort1.get(i).getId()+"", "col10", i+1+"");
	    	 yhMapper.modifySort(temp);
	     }
	     Temp temp2=new Temp(null, "col11", null);
	     List<Sort2> sort2=yhMapper.findSort2Bydec(temp2);
	     for(int i=0;i<sort2.size();i++) {
	    	 Temp temp=new Temp(sort2.get(i).getId()+"", "col12", i+1+"");
	    	 yhMapper.modifySort(temp);
	     }
	     Temp temp3=new Temp(null, "col13", null);
	     List<Sort2> sort3=yhMapper.findSort2Bydec(temp3);
	     for(int i=0;i<sort3.size();i++) {
	    	 Temp temp=new Temp(sort3.get(i).getId()+"", "col14", i+1+"");
	    	 yhMapper.modifySort(temp);
	     }
	     Temp temp4=new Temp(null, "col15", null);
	     List<Sort2> sort4=yhMapper.findSort2Bydec(temp4);
	     for(int i=0;i<sort4.size();i++) {
	    	 Temp temp=new Temp(sort4.get(i).getId()+"", "col16", i+1+"");
	    	 yhMapper.modifySort(temp);
	     }
	     Temp temp5=new Temp(null, "col17", null);
	     List<Sort2> sort5=yhMapper.findSort2Bydec(temp5);
	     for(int i=0;i<sort5.size();i++) {
	    	 Temp temp=new Temp(sort5.get(i).getId()+"", "col18", i+1+"");
	    	 yhMapper.modifySort(temp);
	     }
	     
	     List<Sort2> sort=yhMapper.queryAll2();
		return sort;
	}
	
	//清空表1
	public void delete1() {
		yhMapper.deleteSort1();
	}
	
	@Override
	public List<Sort2> findAll2() {
		return yhMapper.queryAll2();
	}
	
	@Override
	public void delete2() {
		 yhMapper.deleteSort2();
	}

}
