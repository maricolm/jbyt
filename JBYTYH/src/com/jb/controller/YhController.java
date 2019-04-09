package com.jb.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jb.pojo.ResultData;
import com.jb.pojo.ViewData;
import com.jb.service.YhService;

import matlabcontrol.MatlabProxy;


/**
 * @author: mulming
 * @ClassName: YhController
 * @date: 2018年8月6日 下午8:39:45
 * @Description:TODO(这里用一句话描述这个类的作用)
 */
@Controller
@RequestMapping("/yh")
public class YhController {
	@Autowired
	private YhService yhService;
	
	@RequestMapping("/getPublicParaData.do")
	public String getPublicParaData(int year,HttpServletRequest req){
		req.setAttribute("year", year);
		return "fayh/parainput";
	}
	
	@RequestMapping("/getList.do")
	public String getList(int year,double a,double b,double rate,double c,double investment,HttpServletRequest req) {
		try {
			req.setAttribute("a", a);
			req.setAttribute("b", b);
			req.setAttribute("rate", rate);
			req.setAttribute("c", c);
			req.setAttribute("investment", investment);
			ViewData base=yhService.getBaseOil(year, rate, c);//基础方案
			req.setAttribute("base", base);
			ViewData ty=yhService.getOneKindData(1,year);//体液
			req.setAttribute("ty", ty);
			ViewData zcb=yhService.getOneKindData(2,year);//注采比
			req.setAttribute("zcb", zcb);
			ViewData yl=yhService.getOneKindData(3,year);//压裂
			req.setAttribute("yl", yl);
			ViewData sh=yhService.getOneKindData(4,year);//酸化
			req.setAttribute("sh", sh);
			ViewData bk=yhService.getOneKindData(5,year);//补孔
			req.setAttribute("bk", bk);
			ViewData ds=yhService.getOneKindData(6,year);//堵水
			req.setAttribute("ds", ds);
			ViewData hhs=yhService.getOneKindData(7,year);//活化水
			req.setAttribute("hhs", hhs);
			ViewData zjhw=yhService.getOneKindData(8,year);//注聚合物
			req.setAttribute("zjhw", zjhw);
			ViewData jmj=null;
			if(year==5){
				jmj=yhService.getOneKindData(9,year);//加密井
				req.setAttribute("jmj", jmj);
			}
			req.setAttribute("year", year);
			if(year==1) {
				return "fayh/inputpara1";
			}else if(year==2) {
				return "fayh/inputpara2";
			}else if(year==3) {
				return "fayh/inputpara3";
			}else if(year==4) {
				return "fayh/inputpara4";
			}else if(year==5) {
				return "fayh/inputpara5";
			}else {
				req.setAttribute("msg", "访问有误！");
				return "fayh/uploaderror";
			}
			
		}catch (Exception e) {
			req.setAttribute("msg", "请先上传数据！");
			return "fayh/uploaderror";
		}
	}
	
	@RequestMapping("/getSingleList.do")
	public String getSingleList(int year,double a,double b,double rate,int[] sele,double[] C,double[] Q,double[] QQ,double c,double[] sj,double[] yj,double[] djl,HttpServletRequest req,double investment){
		try {
		//double a=0.35;//油价
		//double b=0.08;//吨油操作成本
		/*List<String> name=new ArrayList<String>();
		name.add("提液");name.add("注采比");name.add("压裂");name.add("酸化");name.add("补孔");
		name.add("堵水");name.add("活化水");name.add("注聚合物");name.add("加密井");*/
		List<Integer> data=new ArrayList<Integer>();
		StringBuffer kind1=new StringBuffer();
		for(int i=0;i<sele.length;i++) {
			kind1.append(sele[i]);
		}
		double value=0.0;
		if(year==5) {
			List<String> temp=new ArrayList<String>();
			temp.add("1");temp.add("2");temp.add("3");temp.add("4");temp.add("12");temp.add("13");temp.add("14");
			temp.add("23");temp.add("24");temp.add("34");temp.add("123");temp.add("124");temp.add("134");temp.add("234");temp.add("1234");
			int x=temp.indexOf(kind1.toString())+1;//得到要调用的方法的序号
			//double c=0;//基本增油
			ViewData baseView=yhService.getBaseOil(year,rate,c);//基础方案
			List<double[]> xAndValue=yhService.getSingleListFive(x, C, Q, QQ, a, b, baseView.getTotalInoil(), investment, req);
			double[] xResult=xAndValue.get(0);//x矩阵结果
			value=xAndValue.get(1)[0];//x矩阵结果
			data=yhService.getResultListOfYH(xResult,year);
		}else {
			List<String> temp=new ArrayList<String>();
			temp.add("1");temp.add("2");temp.add("3");temp.add("12");temp.add("13");temp.add("23");temp.add("123");
			int x=temp.indexOf(kind1.toString())+1;//得到要调用的方法的序号
			//double c=0;//基本增油
			ViewData baseView=yhService.getBaseOil(year,rate,c);//基础方案
			List<double[]> xAndValue=yhService.getSingleList(x, C, Q, QQ, a, b, baseView.getTotalInoil(), investment, req);
			double[] xResult=xAndValue.get(0);//x矩阵结果
			value=xAndValue.get(1)[0];//value结果
			data=yhService.getResultListOfYH(xResult,year);
		}
		//查询出来的结果值
		List<ResultData> re=yhService.getResultData(data, year, b);
		
		//基础方案
		ViewData baseView=yhService.getBaseOil(year, rate, c);
		ResultData base=new ResultData();
		if(year==1) {
			base.setWaterwell(baseView.getWaterwell());
			base.setOilwell(baseView.getOilwell());
			base.setCzCost1(baseView.getInoil1()*b);
			base.setIncOil1(baseView.getInoil1());
			base.setTotalInoil(baseView.getTotalInoil());
			base.setTotalCost(base.getTotalInoil()*b);
			base.setRec(-rate*100);
			//定义最后一行的变量值
			double cs1=0;//措施成本1
			double cz1=baseView.getInoil1()*b;
			double zy1=baseView.getInoil1();
			double zcb=baseView.getTotalInoil()*b;//总成本
			double zsjs=baseView.getWaterwell();//总水井数
			double zyjs=baseView.getOilwell();//总油井数
			double zzy=baseView.getTotalInoil();//总增油
			for(int i=0;i<re.size();i++) {
				cs1+=re.get(i).getCsCost1();
				cz1+=re.get(i).getCzCost1();
				zy1+=re.get(i).getIncOil1();
				zcb+=re.get(i).getTotalCost();
				zsjs+=re.get(i).getWaterwell();
				zyjs+=re.get(i).getOilwell();
				zzy+=re.get(i).getTotalInoil();
			}
			double zhdij=Double.parseDouble((String.format("%.2f", (c-zy1)/c*100)));//总的自然递减率
			ResultData total=new ResultData();
			total.setCsCost1(cs1);total.setCzCost1(cz1);total.setTotalCost(zcb);total.setWaterwell(zsjs);
			total.setOilwell(zyjs);total.setIncOil1(zy1);
			total.setTotalInoil(zzy);total.setRec(zhdij);
			req.setAttribute("base", base);
			req.setAttribute("re", re);
			req.setAttribute("total", total);
			req.setAttribute("value", value);
			req.setAttribute("msg", "单模型1年期");
			return "fayh/resurt1";
		}else if(year==2) {
			base.setWaterwell(baseView.getWaterwell());
			base.setOilwell(baseView.getOilwell());
			base.setCzCost1(baseView.getInoil1()*b);
			base.setCzCost2(baseView.getInoil2()*b);
			base.setIncOil1(baseView.getInoil1());
			base.setIncOil2(baseView.getInoil2());
			base.setTotalInoil(baseView.getTotalInoil());
			base.setTotalCost(base.getTotalInoil()*b);
			base.setRec(-rate*100);
			//定义最后一行的变量值
			double cs1=0;//措施成本1
			double cs2=0;//措施成本2
			double cz1=baseView.getInoil1()*b;
			double cz2=baseView.getInoil2()*b;
			double zy1=baseView.getInoil1();
			double zy2=baseView.getInoil2();
			double zcb=baseView.getTotalInoil()*b;//总成本
			double zsjs=baseView.getWaterwell();//总水井数
			double zyjs=baseView.getOilwell();//总油井数
			double zzy=baseView.getTotalInoil();//总增油
			for(int i=0;i<re.size();i++) {
				cs1+=re.get(i).getCsCost1();
				cs2+=re.get(i).getCsCost2();
				cz1+=re.get(i).getCzCost1();
				cz2+=re.get(i).getCzCost2();
				zcb+=re.get(i).getTotalCost();
				zy1+=re.get(i).getIncOil1();
				zy2+=re.get(i).getIncOil2();
				zsjs+=re.get(i).getWaterwell();
				zyjs+=re.get(i).getOilwell();
				zzy+=re.get(i).getTotalInoil();
				
			}
			double zhdij=Double.parseDouble((String.format("%.2f", (zy1-zy2)/zy1*100)));//总的自然递减率
			ResultData total=new ResultData();
			total.setCsCost1(cs1);total.setCsCost2(cs2);total.setCzCost1(cz1);
			total.setCzCost2(cz2);total.setTotalCost(zcb);total.setWaterwell(zsjs);
			total.setOilwell(zyjs);total.setIncOil1(zy1);total.setIncOil2(zy2);
			total.setTotalInoil(zzy);total.setRec(zhdij);
			req.setAttribute("base", base);
			req.setAttribute("re", re);
			req.setAttribute("total", total);
			req.setAttribute("value", value);
			req.setAttribute("msg", "单模型2年期");
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
			double zcb=baseView.getTotalInoil()*b;//总成本
			double zsjs=baseView.getWaterwell();//总水井数
			double zyjs=baseView.getOilwell();//总油井数
			double zzy=baseView.getTotalInoil();//总增油
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
				zcb+=re.get(i).getTotalCost();
				zsjs+=re.get(i).getWaterwell();
				zyjs+=re.get(i).getOilwell();
				zzy+=re.get(i).getTotalInoil();
			}
			double zhdij=Double.parseDouble((String.format("%.2f", (zy2-zy3)/zy2*100)));//总的自然递减率
			ResultData total=new ResultData();
			total.setCsCost1(cs1);total.setCsCost2(cs2);total.setCsCost3(cs3);
			total.setCzCost1(cz1);total.setCzCost2(cz2);total.setCzCost3(cz3);
			total.setIncOil1(zy1);total.setIncOil2(zy2);total.setIncOil3(zy3);
			total.setTotalCost(zcb);total.setWaterwell(zsjs);total.setOilwell(zyjs);
			total.setTotalInoil(zzy);total.setRec(zhdij);
			req.setAttribute("base", base);
			req.setAttribute("re", re);
			req.setAttribute("total", total);
			
			req.setAttribute("value", value);
			req.setAttribute("msg", "单模型3年期");
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
			double zcb=baseView.getTotalInoil()*b;//总成本
			double zsjs=baseView.getWaterwell();//总水井数
			double zyjs=baseView.getOilwell();//总油井数
			double zzy=baseView.getTotalInoil();//总增油
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
				zcb+=re.get(i).getTotalCost();
				zsjs+=re.get(i).getWaterwell();
				zyjs+=re.get(i).getOilwell();
				zzy+=re.get(i).getTotalInoil();
			}
			double zhdij=Double.parseDouble((String.format("%.2f", (zy3-zy4)/zy3*100)));//总的自然递减率
			ResultData total=new ResultData();
			total.setCsCost1(cs1);total.setCsCost2(cs2);total.setCsCost3(cs3);total.setCsCost4(cs4);
			total.setCzCost1(cz1);total.setCzCost2(cz2);total.setCzCost3(cz3);total.setCzCost4(cz4);
			total.setIncOil1(zy1);total.setIncOil2(zy2);total.setIncOil3(zy3);total.setIncOil4(zy4);
			total.setTotalCost(zcb);total.setWaterwell(zsjs);total.setOilwell(zyjs);
			total.setTotalInoil(zzy);total.setRec(zhdij);
			req.setAttribute("base", base);
			req.setAttribute("re", re);
			req.setAttribute("total", total);
			req.setAttribute("value", value);
			req.setAttribute("msg", "单模型4年期");
			return "fayh/resurt4";
		}else if(year==5) {
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
			double zcb=baseView.getTotalInoil()*b;//总成本
			double zsjs=baseView.getWaterwell();//总水井数
			double zyjs=baseView.getOilwell();//总油井数
			double zzy=baseView.getTotalInoil();//总增油
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
				zcb+=re.get(i).getTotalCost();
				zsjs+=re.get(i).getWaterwell();
				zyjs+=re.get(i).getOilwell();
				zzy+=re.get(i).getTotalInoil();
			}
			double zhdij=Double.parseDouble((String.format("%.2f", (zy4-zy5)/zy4*100)));//总的自然递减率
			ResultData total=new ResultData();
			total.setCsCost1(cs1);total.setCsCost2(cs2);total.setCsCost3(cs3);total.setCsCost4(cs4);total.setCsCost5(cs5);
			total.setCzCost1(cz1);total.setCzCost2(cz2);total.setCzCost3(cz3);total.setCzCost4(cz4);total.setCzCost5(cz5);
			total.setIncOil1(zy1);total.setIncOil2(zy2);total.setIncOil3(zy3);total.setIncOil4(zy4);total.setIncOil5(zy5);
			total.setTotalCost(zcb);total.setWaterwell(zsjs);total.setOilwell(zyjs);
			total.setTotalInoil(zzy);total.setRec(zhdij);
			req.setAttribute("base", base);
			req.setAttribute("re", re);
			req.setAttribute("total", total);
			req.setAttribute("value", value);
			req.setAttribute("msg", "单模型5年期");
			return "fayh/resurt5";
		}
		}catch (Exception e) {
			return "fayh/error";
		}
		return null;
	}
	
	@RequestMapping("/test.do")
	public void test(HttpSession session,HttpServletRequest req){
		try {
		MatlabProxy proxy=(MatlabProxy) req.getServletContext().getAttribute("proxy");
		double p=0.2;
		double[] Q={13795,537,2000,3000,4000,7049};
		double[] C={65,-50,100,300,600,1080};
		double m=2;
		double M=5;
		double QQ=10000;
		double c=10000;
		Object[] result = proxy.returningFeval("demo",5,p,Q,C,m,M,QQ,c);
		double[] r=(double[]) result[0];
		System.out.print("f:");
		for (int i = 0; i < r.length; i++) {
			System.out.print(r[i]);
		}
		double[] x=(double[]) result[1];
		System.out.println();
		System.out.print("x:");
		for (int i = 0; i < x.length; i++) {
			System.out.print(x[i]);
		}
		}catch (Exception e) {}
	}

}
