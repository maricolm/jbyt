package com.jb.pojo;

/**
 * @author: mulming
 * @ClassName: ResultData
 * @date: 2018年8月6日 下午8:54:36
 * @Description:TODO(这里用一句话描述这个类的作用)
 */
public class ResultData {
	private String name;//措施类型
	private String mothod;//方案名
	private double csCost1;//措施成本
	private double csCost2;//措施成本
	private double csCost3;//措施成本
	private double csCost4;//措施成本
	private double csCost5;//措施成本
	private double czCost1;//操作成本
	private double czCost2;//操作成本
	private double czCost3;//操作成本
	private double czCost4;//操作成本
	private double czCost5;//操作成本
	private double incOil1;//增油
	private double incOil2;//增油
	private double incOil3;//增油
	private double incOil4;//增油
	private double incOil5;//增油
	private double totalCost;//总成本
	private double waterwell;//水井
	private double oilwell;//油井
	private double totalInoil;//总增油
	private double rec;//递减率
	private int year;//实施评价年限

	public String getMothod() {
		return mothod;
	}

	public void setMothod(String mothod) {
		this.mothod = mothod;
	}

	public Double getDouble(double para) {
		return Double.parseDouble((String.format("%.2f", para)));
	}

	
	public void setName(String name) {
		this.name = name;
	}

	public void setCsCost1(double csCost1) {
		this.csCost1 = getDouble(csCost1);
	}

	public void setCsCost2(double csCost2) {
		this.csCost2 = getDouble(csCost2);
	}


	public void setCsCost3(double csCost3) {
		this.csCost3 = getDouble(csCost3);
	}


	public void setCsCost4(double csCost4) {
		this.csCost4 = getDouble(csCost4);
	}


	public void setCsCost5(double csCost5) {
		this.csCost5 = getDouble(csCost5);
	}


	public void setCzCost1(double czCost1) {
		this.czCost1 = getDouble(czCost1);
	}


	public void setCzCost2(double czCost2) {
		this.czCost2 = getDouble(czCost2);
	}


	public void setCzCost3(double czCost3) {
		this.czCost3 = getDouble(czCost3);
	}


	public void setCzCost4(double czCost4) {
		this.czCost4 = getDouble(czCost4);
	}


	public void setCzCost5(double czCost5) {
		this.czCost5 = getDouble(czCost5);
	}


	public void setTotalCost(double totalCost) {
		this.totalCost = getDouble(totalCost);
	}


	public void setWaterwell(double waterwell) {
		this.waterwell = getDouble(waterwell);
	}


	public void setOilwell(double oilwell) {
		this.oilwell = getDouble(oilwell);
	}


	public void setTotalInoil(double totalInoil) {
		this.totalInoil = getDouble(totalInoil);
	}


	public void setRec(double rec) {
		this.rec = getDouble(rec);
	}


	public void setYear(int year) {
		this.year = year;
	}


	public String getName() {
		return name;
	}

	public double getCsCost1() {
		return csCost1;
	}

	public double getCsCost2() {
		return csCost2;
	}

	public double getCsCost3() {
		return csCost3;
	}

	public double getCsCost4() {
		return csCost4;
	}

	public double getCsCost5() {
		return csCost5;
	}

	public double getCzCost1() {
		return czCost1;
	}

	public double getCzCost2() {
		return czCost2;
	}

	public double getCzCost3() {
		return czCost3;
	}

	public double getCzCost4() {
		return czCost4;
	}

	public double getCzCost5() {
		return czCost5;
	}

	public double getTotalCost() {
		return totalCost;
	}

	public double getWaterwell() {
		return waterwell;
	}

	public double getOilwell() {
		return oilwell;
	}

	public double getTotalInoil() {
		return totalInoil;
	}

	public double getRec() {
		return rec;
	}

	public int getYear() {
		return year;
	}


	public double getIncOil1() {
		return incOil1;
	}


	public void setIncOil1(double incOil1) {
		this.incOil1 = getDouble(incOil1);
	}


	public double getIncOil2() {
		return incOil2;
	}


	public void setIncOil2(double incOil2) {
		this.incOil2 = getDouble(incOil2);
	}


	public double getIncOil3() {
		return incOil3;
	}


	public void setIncOil3(double incOil3) {
		this.incOil3 = getDouble(incOil3);
	}


	public double getIncOil4() {
		return incOil4;
	}


	public void setIncOil4(double incOil4) {
		this.incOil4 = getDouble(incOil4);
	}


	public double getIncOil5() {
		return incOil5;
	}


	public void setIncOil5(double incOil5) {
		this.incOil5 = getDouble(incOil5);
	}
	
}
