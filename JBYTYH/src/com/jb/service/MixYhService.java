package com.jb.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.jb.pojo.ResultData;
import com.jb.pojo.ViewData;

/**
 * @author: mulming
 * @ClassName: YhService
 * @date: 2018年7月23日 下午8:41:04
 * @Description:TODO(这里用一句话描述这个类的作用)
 */
public interface MixYhService {
	//a，0.35；b:，0.08；kind:是的意思；c=52000,基本增油；investment:总投资钱
	/**
	 * @Author: mulming
	 * @Methods:getSingleList：获取单模型优化结果的x矩阵，以及val的值
	 * @param kind:种类
	 * @param C:总成本
	 * @param Q:总增油
	 * @param QQ:盈亏平衡点
	 * @param a:油价
	 * @param b:吨油操作成本
	 * @param c:基本增油
	 * @param investment
	 * @Return:List<double[]> 返回方案选取的系数矩阵
	 * @Date:下午7:28:20
	 */
	public List<double[]> getMixReList(int kind,double[] C,double[] Q,double QQ[],double a,double b,double c,double investment,HttpServletRequest req,int year);
	//返回结果矩阵的索引号
	public List<Integer> getResultListOfYH(double[] xResult);//返回所选结果的索引号
	public List<Integer> getResultFiveListOfYH(double[] xResult);//返回第5年所选结果的索引号
	public ViewData getBaseOil(int year,double rate,double iolNum);
	//得到单种措施前n年的数据的集合
	public List<ViewData> getListOneKindFrontYearByYear(int kind,int year);
	public ViewData getOneKindData(int kind,int year);//根据种类，得到一个种类的数据 
	public List<ResultData> getResultData(List<Integer> matrix,double b);//根据得到的结果矩阵，取出结果
	
	public void  readExcelByFile(MultipartFile file)  throws Exception;//导入数据
	
}
