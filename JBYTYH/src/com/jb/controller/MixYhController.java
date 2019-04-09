package com.jb.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jb.pojo.ResultData;
import com.jb.pojo.ViewData;
import com.jb.service.MixYhService;


/**
 * @author: mulming
 * @ClassName: YhController
 * @date: 2018年8月6日 下午8:39:45
 * @Description:TODO(这里用一句话描述这个类的作用)
 */
@Controller
@RequestMapping("/mix")
public class MixYhController {
	@Autowired
	private MixYhService mixYhService;
	
	@RequestMapping("/getMixPublicParaData.do")
	public String getPublicParaData(int year,HttpServletRequest req){
		req.setAttribute("year", year);
		return "fayh/mixparainput";
	}
	@RequestMapping("/getTwoList.do")
	public String getTwoList(int year,double a,double b,double rate,double c,double investment,HttpServletRequest req) {
		try {
			req.setAttribute("a", a);
			req.setAttribute("b", b);
			req.setAttribute("rate", rate);
			req.setAttribute("c", c);
			req.setAttribute("investment", investment);
			ViewData base=mixYhService.getBaseOil(year,rate,c);//基础方案
			req.setAttribute("base", base);
			List<ViewData> ty=mixYhService.getListOneKindFrontYearByYear(1,year);//体液
			req.setAttribute("ty", ty);
			List<ViewData> zcb=mixYhService.getListOneKindFrontYearByYear(2,year);//注采比
			req.setAttribute("zcb", zcb);
			List<ViewData> yl=mixYhService.getListOneKindFrontYearByYear(3,year);//压裂
			req.setAttribute("yl", yl);
			List<ViewData> sh=mixYhService.getListOneKindFrontYearByYear(4,year);//酸化
			req.setAttribute("sh", sh);
			List<ViewData> bk=mixYhService.getListOneKindFrontYearByYear(5,year);//补孔
			req.setAttribute("bk", bk);
			List<ViewData> ds=mixYhService.getListOneKindFrontYearByYear(6,year);//堵水
			req.setAttribute("ds", ds);
			List<ViewData> hhs=mixYhService.getListOneKindFrontYearByYear(7,year);//活化水
			req.setAttribute("hhs", hhs);
			List<ViewData> zjhw=mixYhService.getListOneKindFrontYearByYear(8,year);//注聚合物
			req.setAttribute("zjhw", zjhw);
			if(year==2) {
				return "fayh/twoYinputpara";
			}else if(year==3) {
				return "fayh/threeYinputpara";
			} else if(year==4) {
				return "fayh/fourYinputpara";
			}else if(year==5){
				ViewData jmj=mixYhService.getOneKindData(9, 5);
				req.setAttribute("jmj", jmj);
				return "fayh/fiveYinputpara";
			}else {
				req.setAttribute("msg", "访问有误！");
				return "fayh/uploaderror";
			}
		}catch (Exception e) {
			req.setAttribute("msg", "请先上传数据！");
			return "fayh/uploaderror";
		}
	}
	
	
	@RequestMapping("/getMixReList.do")
	public String getMixReList(int year,double investment,double rate,double a,double b,double c,int[] sele,HttpServletRequest req) {
		try {
		//double a=0.35;//油价
		//double b=0.08;//吨油操作成本
		double value=0;
		List<String> temp=new ArrayList<String>();
		temp.add("1");temp.add("2");temp.add("3");temp.add("12");temp.add("13");temp.add("23");temp.add("123");
		StringBuffer kind1=new StringBuffer();
		for(int i=0;i<sele.length;i++) {
			kind1.append(sele[i]);
		}
		int x=temp.indexOf(kind1.toString())+1;//得到要调用的方法的序号
		ViewData baseView=mixYhService.getBaseOil(year,rate,c);//基础方案
		double[] C=new double[year*8];
		double[] Q=new double[year*8];
		double[] QQ=new double[year*8];
		List<ViewData> ty=mixYhService.getListOneKindFrontYearByYear(1,year);//体液
		List<ViewData> zcb=mixYhService.getListOneKindFrontYearByYear(2,year);//注采比
		List<ViewData> yl=mixYhService.getListOneKindFrontYearByYear(3,year);//压裂
		List<ViewData> sh=mixYhService.getListOneKindFrontYearByYear(4,year);//酸化
		List<ViewData> bk=mixYhService.getListOneKindFrontYearByYear(5,year);//补孔
		List<ViewData> ds=mixYhService.getListOneKindFrontYearByYear(6,year);//堵水
		List<ViewData> hhs=mixYhService.getListOneKindFrontYearByYear(7,year);//活化水
		List<ViewData> zjhw=mixYhService.getListOneKindFrontYearByYear(8,year);//注聚合物
		for(int i=0;i<year;i++) {
			C[0+i*8]=ty.get(i).getTotalCost();
			C[1+i*8]=zcb.get(i).getTotalCost();
			C[2+i*8]=yl.get(i).getTotalCost();
			C[3+i*8]=sh.get(i).getTotalCost();
			C[4+i*8]=bk.get(i).getTotalCost();
			C[5+i*8]=ds.get(i).getTotalCost();
			C[6+i*8]=hhs.get(i).getTotalCost();
			C[7+i*8]=zjhw.get(i).getTotalCost();
			Q[0+i*8]=ty.get(i).getTotalInoil();
			Q[1+i*8]=zcb.get(i).getTotalInoil();
			Q[2+i*8]=yl.get(i).getTotalInoil();
			Q[3+i*8]=sh.get(i).getTotalInoil();
			Q[4+i*8]=bk.get(i).getTotalInoil();
			Q[5+i*8]=ds.get(i).getTotalInoil();
			Q[6+i*8]=hhs.get(i).getTotalInoil();
			Q[7+i*8]=zjhw.get(i).getTotalInoil();
			QQ[0+i*8]=ty.get(i).getBalance();
			QQ[1+i*8]=zcb.get(i).getBalance();
			QQ[2+i*8]=yl.get(i).getBalance();
			QQ[3+i*8]=sh.get(i).getBalance();
			QQ[4+i*8]=bk.get(i).getBalance();
			QQ[5+i*8]=ds.get(i).getBalance();
			QQ[6+i*8]=hhs.get(i).getBalance();
			QQ[7+i*8]=zjhw.get(i).getBalance();
		}
		ResultData base=new ResultData();
		if(year==2) {
			base.setWaterwell(baseView.getWaterwell());
			base.setOilwell(baseView.getOilwell());
			base.setCzCost1(baseView.getInoil1()*b);
			base.setCzCost2(baseView.getInoil2()*b);
			base.setIncOil1(baseView.getInoil1());
			base.setIncOil2(baseView.getInoil2());
			base.setTotalInoil(baseView.getTotalInoil());
			base.setTotalCost(base.getTotalInoil()*b);
			base.setRec(-rate*100);
			List<double[]> xAndValue=mixYhService.getMixReList(x, C, Q, QQ, a, b,baseView.getTotalInoil(), investment, req,year);
			double[] xResult=xAndValue.get(0);//x矩阵结果
			value=xAndValue.get(1)[0];//value结果
			List<Integer> rindex=mixYhService.getResultListOfYH(xResult);
			List<ResultData> re=mixYhService.getResultData(rindex, b);
			//定义最后一行的变量值
			double cs1=0;//措施成本1
			double cs2=0;//措施成本2
			double cz1=baseView.getInoil1()*b;
			double cz2=baseView.getInoil2()*b;
			double zy1=baseView.getInoil1();
			double zy2=baseView.getInoil2();
			double totalCost=baseView.getTotalInoil()*b;//总成本
			double zsjs=baseView.getWaterwell();//总水井数
			double zyjs=baseView.getOilwell();//总油井数
			double zzy=baseView.getTotalInoil();//总增油
			for(int i=0;i<re.size();i++) {
				cs1+=re.get(i).getCsCost1();
				cs2+=re.get(i).getCsCost2();
				cz1+=re.get(i).getCzCost1();
				cz2+=re.get(i).getCzCost2();
				zy1+=re.get(i).getIncOil1();
				zy2+=re.get(i).getIncOil2();
				totalCost+=re.get(i).getTotalCost();
				zsjs+=re.get(i).getWaterwell();
				zyjs+=re.get(i).getOilwell();
				zzy+=re.get(i).getTotalInoil();
			}
			double zhdij=Double.parseDouble((String.format("%.2f", (zy1-zy2)/zy1*100)));//总的自然递减率
			ResultData total=new ResultData();
			total.setCsCost1(cs1);total.setCsCost2(cs2);total.setCzCost1(cz1);
			total.setCzCost2(cz2);total.setTotalCost(totalCost);total.setWaterwell(zsjs);
			total.setOilwell(zyjs);total.setIncOil1(zy1);total.setIncOil2(zy2);
			total.setTotalInoil(zzy);total.setRec(zhdij);
			req.setAttribute("base", base);
			req.setAttribute("re", re);
			req.setAttribute("total", total);
			req.setAttribute("value", value);
			req.setAttribute("msg", "混合模型2年期");
			return "fayh/resurt2";
		}else if(year==3) {
			base.setWaterwell(baseView.getWaterwell());
			base.setOilwell(baseView.getOilwell());
			base.setCzCost1(baseView.getInoil1()*b);
			base.setCzCost2(baseView.getInoil2()*b);
			base.setCzCost3(baseView.getInoil3()*b);
			base.setIncOil1(baseView.getInoil1());
			base.setIncOil2(baseView.getInoil2());
			base.setIncOil3(baseView.getInoil3());
			base.setTotalInoil(baseView.getTotalInoil());
			base.setTotalCost(base.getTotalInoil()*b);
			base.setRec(-rate*100);
			List<double[]> xAndValue=mixYhService.getMixReList(x, C, Q, QQ, a, b,baseView.getTotalInoil(), investment,req,year);
			double[] xResult=xAndValue.get(0);//x矩阵结果
			value=xAndValue.get(1)[0];//value结果
			List<Integer> rindex=mixYhService.getResultListOfYH(xResult);
			List<ResultData> re=mixYhService.getResultData(rindex, b);
			//定义最后一行的变量值
			//定义最后一行的变量值
			double cs1=0;//措施成本1
			double cs2=0;//措施成本2
			double cs3=0;//措施成本2
			double cz1=baseView.getInoil1()*b;
			double cz2=baseView.getInoil2()*b;
			double cz3=baseView.getInoil3()*b;
			double zy1=baseView.getInoil1();
			double zy2=baseView.getInoil2();
			double zy3=baseView.getInoil3();
			double totalCost=base.getTotalInoil()*b;//总成本
			double zsjs=base.getWaterwell();//总水井数
			double zyjs=base.getOilwell();//总油井数
			double zzy=base.getTotalInoil();//总增油
			for(int i=0;i<re.size();i++) {
				cs1+=re.get(i).getCsCost1();
				cs2+=re.get(i).getCsCost2();
				cs3+=re.get(i).getCsCost3();
				cz1+=re.get(i).getCzCost1();
				cz2+=re.get(i).getCzCost2();
				cz3+=re.get(i).getCzCost3();
				zy1+=re.get(i).getIncOil1();
				zy2+=re.get(i).getIncOil2();
				zy3+=re.get(i).getIncOil3();
				totalCost+=re.get(i).getTotalCost();
				zsjs+=re.get(i).getWaterwell();
				zyjs+=re.get(i).getOilwell();
				zzy+=re.get(i).getTotalInoil();
			}
			double zhdij=Double.parseDouble((String.format("%.2f", (zy2-zy3)/zy2*100)));//总的自然递减率
			ResultData total=new ResultData();
			total.setCsCost1(cs1);total.setCsCost2(cs2);total.setCsCost3(cs3);
			total.setCzCost1(cz1);total.setCzCost2(cz2);total.setCzCost3(cz3);
			total.setIncOil1(zy1);total.setIncOil2(zy2);total.setIncOil3(zy3);
			total.setTotalCost(totalCost);total.setWaterwell(zsjs);total.setOilwell(zyjs);
			total.setTotalInoil(zzy);total.setRec(zhdij);
			req.setAttribute("base", base);
			req.setAttribute("re", re);
			req.setAttribute("total", total);
			req.setAttribute("value", value);
			req.setAttribute("msg", "混合模型3年期");
			return "fayh/resurt3";
		}else if(year==4) {
			base.setWaterwell(baseView.getWaterwell());
			base.setOilwell(baseView.getOilwell());
			base.setCzCost1(baseView.getInoil1()*b);
			base.setCzCost2(baseView.getInoil2()*b);
			base.setCzCost3(baseView.getInoil3()*b);
			base.setCzCost4(baseView.getInoil4()*b);
			base.setIncOil1(baseView.getInoil1());
			base.setIncOil2(baseView.getInoil2());
			base.setIncOil3(baseView.getInoil3());
			base.setIncOil4(baseView.getInoil4());
			base.setTotalInoil(baseView.getTotalInoil());
			base.setTotalCost(base.getTotalInoil()*b);
			base.setRec(-rate*100);
			List<double[]> xAndValue=mixYhService.getMixReList(x, C, Q, QQ, a, b, baseView.getTotalInoil(), investment,req,year);
			double[] xResult=xAndValue.get(0);//x矩阵结果
			value=xAndValue.get(1)[0];//value结果
			List<Integer> rindex=mixYhService.getResultListOfYH(xResult);
			List<ResultData> re=mixYhService.getResultData(rindex, b);
			//定义最后一行的变量值
			double cs1=0;//措施成本1
			double cs2=0;//措施成本2
			double cs3=0;//措施成本2
			double cs4=0;//措施成本2
			double cz1=baseView.getInoil1()*b;
			double cz2=baseView.getInoil2()*b;
			double cz3=baseView.getInoil3()*b;
			double cz4=baseView.getInoil4()*b;
			double zy1=baseView.getInoil1();
			double zy2=baseView.getInoil2();
			double zy3=baseView.getInoil3();
			double zy4=baseView.getInoil4();
			double totalCost=base.getTotalInoil()*b;//总成本
			double zsjs=base.getWaterwell();//总水井数
			double zyjs=base.getOilwell();//总油井数
			double zzy=base.getTotalInoil();//总增油
			for(int i=0;i<re.size();i++) {
				cs1+=re.get(i).getCsCost1();
				cs2+=re.get(i).getCsCost2();
				cs3+=re.get(i).getCsCost3();
				cs4+=re.get(i).getCsCost4();
				cz1+=re.get(i).getCzCost1();
				cz2+=re.get(i).getCzCost2();
				cz3+=re.get(i).getCzCost3();
				cz4+=re.get(i).getCzCost4();
				zy1+=re.get(i).getIncOil1();
				zy2+=re.get(i).getIncOil2();
				zy3+=re.get(i).getIncOil3();
				zy4+=re.get(i).getIncOil4();
				totalCost+=re.get(i).getTotalCost();
				zsjs+=re.get(i).getWaterwell();
				zyjs+=re.get(i).getOilwell();
				zzy+=re.get(i).getTotalInoil();
			}
			double zhdij=Double.parseDouble((String.format("%.2f", (zy3-zy4)/zy3*100)));//总的自然递减率
			ResultData total=new ResultData();
			total.setCsCost1(cs1);total.setCsCost2(cs2);total.setCsCost3(cs3);total.setCsCost4(cs4);
			total.setCzCost1(cz1);total.setCzCost2(cz2);total.setCzCost3(cz3);total.setCzCost4(cz4);
			total.setIncOil1(zy1);total.setIncOil2(zy2);total.setIncOil3(zy3);total.setIncOil4(zy4);
			total.setTotalCost(totalCost);total.setWaterwell(zsjs);total.setOilwell(zyjs);
			total.setTotalInoil(zzy);total.setRec(zhdij);
			req.setAttribute("base", base);
			req.setAttribute("re", re);
			req.setAttribute("total", total);
			req.setAttribute("value", value);
			req.setAttribute("msg", "混合模型4年期");
			return "fayh/resurt4";
		}
		} catch (Exception e) {
			return "fayh/error";
		}
		return "fiveYinputpara";
	}
	@RequestMapping("/getMixFiveReList.do")
	public String getMixFiveReList(int year,double rate,double c,double a,double b,double investment,int[] sele,HttpServletRequest req) {
	try {
		//double a=0.35;//油价
		//double b=0.08;//吨油操作成本
		double value=0;
		List<String> temp=new ArrayList<String>();
		temp.add("1");temp.add("2");temp.add("3");temp.add("4");temp.add("12");temp.add("13");temp.add("14");
		temp.add("23");temp.add("24");temp.add("34");temp.add("123");temp.add("124");temp.add("134");temp.add("234");temp.add("1234");
		StringBuffer kind1=new StringBuffer();
		for(int i=0;i<sele.length;i++) {
			kind1.append(sele[i]);
		}
		int x=temp.indexOf(kind1.toString())+1;//得到要调用的方法的序号
		ViewData baseView=mixYhService.getBaseOil(year,rate,c);//基础方案
		//double c=baseView.getInoil1();//获取基本增油
		double[] C=new double[41];
		double[] Q=new double[41];
		double[] QQ=new double[41];
		List<ViewData> ty=mixYhService.getListOneKindFrontYearByYear(1,year);//体液
		List<ViewData> zcb=mixYhService.getListOneKindFrontYearByYear(2,year);//注采比
		List<ViewData> yl=mixYhService.getListOneKindFrontYearByYear(3,year);//压裂
		List<ViewData> sh=mixYhService.getListOneKindFrontYearByYear(4,year);//酸化
		List<ViewData> bk=mixYhService.getListOneKindFrontYearByYear(5,year);//补孔
		List<ViewData> ds=mixYhService.getListOneKindFrontYearByYear(6,year);//堵水
		List<ViewData> hhs=mixYhService.getListOneKindFrontYearByYear(7,year);//活化水
		List<ViewData> zjhw=mixYhService.getListOneKindFrontYearByYear(8,year);//注聚合物
		ViewData jmj=mixYhService.getOneKindData(9, 5);
		for(int i=0;i<year;i++) {
			C[0+i*8]=ty.get(i).getTotalCost();
			C[1+i*8]=zcb.get(i).getTotalCost();
			C[2+i*8]=yl.get(i).getTotalCost();
			C[3+i*8]=sh.get(i).getTotalCost();
			C[4+i*8]=bk.get(i).getTotalCost();
			C[5+i*8]=ds.get(i).getTotalCost();
			C[6+i*8]=hhs.get(i).getTotalCost();
			C[7+i*8]=zjhw.get(i).getTotalCost();
			Q[0+i*8]=ty.get(i).getTotalInoil();
			Q[1+i*8]=zcb.get(i).getTotalInoil();
			Q[2+i*8]=yl.get(i).getTotalInoil();
			Q[3+i*8]=sh.get(i).getTotalInoil();
			Q[4+i*8]=bk.get(i).getTotalInoil();
			Q[5+i*8]=ds.get(i).getTotalInoil();
			Q[6+i*8]=hhs.get(i).getTotalInoil();
			Q[7+i*8]=zjhw.get(i).getTotalInoil();
			QQ[0+i*8]=ty.get(i).getBalance();
			QQ[1+i*8]=zcb.get(i).getBalance();
			QQ[2+i*8]=yl.get(i).getBalance();
			QQ[3+i*8]=sh.get(i).getBalance();
			QQ[4+i*8]=bk.get(i).getBalance();
			QQ[5+i*8]=ds.get(i).getBalance();
			QQ[6+i*8]=hhs.get(i).getBalance();
			QQ[7+i*8]=zjhw.get(i).getBalance();
		}
		C[40]=jmj.getTotalCost();
		Q[40]=jmj.getTotalInoil();
		QQ[40]=jmj.getBalance();
		ResultData base=new ResultData();
		base.setWaterwell(baseView.getWaterwell());
		base.setOilwell(baseView.getOilwell());
		base.setCzCost1(baseView.getInoil1()*b);
		base.setCzCost2(baseView.getInoil2()*b);
		base.setCzCost3(baseView.getInoil3()*b);
		base.setCzCost4(baseView.getInoil4()*b);
		base.setCzCost5(baseView.getInoil5()*b);
		base.setIncOil1(baseView.getInoil1());
		base.setIncOil2(baseView.getInoil2());
		base.setIncOil3(baseView.getInoil3());
		base.setIncOil4(baseView.getInoil4());
		base.setIncOil5(baseView.getInoil5());
		base.setTotalInoil(baseView.getTotalInoil());
		base.setTotalCost(base.getTotalInoil()*b);
		base.setRec(-rate*100);
		List<double[]> xAndValue=mixYhService.getMixReList(x, C, Q, QQ, a, b, baseView.getTotalInoil(), investment,req,year);
		double[] xResult=xAndValue.get(0);//x矩阵结果
		value=xAndValue.get(1)[0];//value结果
		List<Integer> rindex=mixYhService.getResultFiveListOfYH(xResult);
		List<ResultData> re=mixYhService.getResultData(rindex, b);
		//定义最后一行的变量值
		double cs1=0;//措施成本1
		double cs2=0;//措施成本2
		double cs3=0;//措施成本2
		double cs4=0;//措施成本2
		double cs5=0;//措施成本2
		double cz1=baseView.getInoil1()*b;
		double cz2=baseView.getInoil2()*b;
		double cz3=baseView.getInoil3()*b;
		double cz4=baseView.getInoil4()*b;
		double cz5=baseView.getInoil5()*b;
		double zy1=baseView.getInoil1();
		double zy2=baseView.getInoil2();
		double zy3=baseView.getInoil3();
		double zy4=baseView.getInoil4();
		double zy5=baseView.getInoil5();
		double totalCost=base.getTotalInoil()*b;//总成本
		double zsjs=base.getWaterwell();//总水井数
		double zyjs=base.getOilwell();//总油井数
		double zzy=base.getTotalInoil();//总增油
		for(int i=0;i<re.size();i++) {
			cs1+=re.get(i).getCsCost1();
			cs2+=re.get(i).getCsCost2();
			cs3+=re.get(i).getCsCost3();
			cs4+=re.get(i).getCsCost4();
			cs5+=re.get(i).getCsCost5();
			cz1+=re.get(i).getCzCost1();
			cz2+=re.get(i).getCzCost2();
			cz3+=re.get(i).getCzCost3();
			cz4+=re.get(i).getCzCost4();
			cz5+=re.get(i).getCzCost5();
			zy1+=re.get(i).getIncOil1();
			zy2+=re.get(i).getIncOil2();
			zy3+=re.get(i).getIncOil3();
			zy4+=re.get(i).getIncOil4();
			zy5+=re.get(i).getIncOil5();
			totalCost+=re.get(i).getTotalCost();
			zsjs+=re.get(i).getWaterwell();
			zyjs+=re.get(i).getOilwell();
			zzy+=re.get(i).getTotalInoil();
		}
		double zhdij=Double.parseDouble((String.format("%.2f", (zy4-zy5)/zy4*100)));//总的自然递减率
		ResultData total=new ResultData();
		total.setCsCost1(cs1);total.setCsCost2(cs2);total.setCsCost3(cs3);total.setCsCost4(cs4);total.setCsCost5(cs5);
		total.setCzCost1(cz1);total.setCzCost2(cz2);total.setCzCost3(cz3);total.setCzCost4(cz4);total.setCzCost5(cz5);
		total.setIncOil1(zy1);total.setIncOil2(zy2);total.setIncOil3(zy3);total.setIncOil4(zy4);total.setIncOil5(zy5);
		total.setTotalCost(totalCost);total.setWaterwell(zsjs);total.setOilwell(zyjs);
		total.setTotalInoil(zzy);total.setRec(zhdij);
		req.setAttribute("base", base);
		req.setAttribute("re", re);
		req.setAttribute("total", total);
		req.setAttribute("value", value);
		req.setAttribute("msg", "混合模型5年期");
		return "fayh/resurt5";
	}catch (Exception e) {
		return "fayh/error";
	}
	}
	
	//上传数据
	@RequestMapping("/upload.do")
	public String upload(MultipartFile file,HttpServletRequest req) throws Exception{
		try {
			mixYhService.readExcelByFile(file);
			req.setAttribute("msg", "上传数据成功");
			return "fayh/uploaderror";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			req.setAttribute("msg", "上传数据失败，请检查数据模版格式是否正确！");
			return "fayh/uploaderror";
		}
	}	
}
