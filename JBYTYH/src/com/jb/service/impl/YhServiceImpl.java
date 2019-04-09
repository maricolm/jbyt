package com.jb.service.impl;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jb.mapper.YhMapper;
import com.jb.pojo.ResultData;
import com.jb.pojo.ViewData;
import com.jb.service.YhService;

import matlabcontrol.MatlabProxy;

/**
 * @author: mulming
 * @ClassName: YhServiceImpl
 * @date: 2018年7月23日 下午8:41:46
 * @Description:TODO(这里用一句话描述这个类的作用)
 */
@Service
public class YhServiceImpl implements YhService {
	@Autowired
	private YhMapper yhMapper;

	//根据种类，得到5年成本集合或者5年增油集合
	public double getTotalByDataList(List<Double> para,int year){
		double total=0;
		for (int i = 0; i < year; i++) {
			total+=para.get(i);
		}
		return total;
	}
	
	@Override
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

	/* (non-Javadoc)
	 * @see com.jb.service.YhService#getBaseOil(int)
	 */
	@Override
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
	
	//返回Matlab计算后的x矩阵和value的值。
	@Override
	public List<double[]> getSingleList(int kind, double[] C, double[] Q, double QQ[], double a, double b, double c,
			double investment,HttpServletRequest req) {
		List<double[]> xAndValue=new ArrayList<double[]>();
		try {
			MatlabProxy proxy=(MatlabProxy) req.getServletContext().getAttribute("proxy");
			Object[] result = proxy.returningFeval("singleModel",2,C,Q,QQ,kind,a,b,c,investment);
			double[] x=(double[]) result[0];
			xAndValue.add(x);
			double[] val=(double[]) result[1];
			xAndValue.add(val);
		} catch (Exception e) {
			e.getMessage();
		}
		return xAndValue;
	}
	@Override
	public List<double[]> getSingleListFive(int kind, double[] C, double[] Q, double[] QQ, double a, double b,
			double c, double investment, HttpServletRequest req) {
		List<double[]> xAndValue=new ArrayList<double[]>();
		try {
			MatlabProxy proxy=(MatlabProxy) req.getServletContext().getAttribute("proxy");
			Object[] result = proxy.returningFeval("singleModelFive",2,C,Q,QQ,kind,a,b,c,investment);
			double[] x=(double[]) result[0];
			xAndValue.add(x);
			double[] val=(double[]) result[1];
			xAndValue.add(val);
		} catch (Exception e) {
			e.getMessage();
		}
		return xAndValue;
	}
	//得到根据x矩阵的0 1值，返回最终的结果
	public List<Integer> getResultListOfYH(double[] xResult,int year){
		List<Integer> Result=new ArrayList<Integer>() ;
		for(int i=0;i<xResult.length;i++) {
			if(xResult[i]>0.5) {
				Result.add(year+i*5);
			}
		}
		return Result;
	}

	@Override
	public List<ResultData> getResultData(List<Integer> matrix,int year,double b) {
		List<ResultData> re=new ArrayList<ResultData>();
		for(int i=0;i<matrix.size();i++) {
			ResultData temp=new ResultData();
			ViewData vi=yhMapper.getViewDataByNum(matrix.get(i));
			temp.setName(vi.getName());
			temp.setMothod(vi.getMothod());
			temp.setWaterwell(vi.getWaterwell());
			temp.setOilwell(vi.getOilwell());
			temp.setRec(vi.getDecrate());
			temp.setYear(year);
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

}
