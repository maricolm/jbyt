package com.jb.pojo;

/**
 * @author: mulming
 * @ClassName: ViewData
 * @date: 2018年8月6日 下午8:54:07
 * @Description:实体类
 */
public class ViewData {
	private int id;//id
	private int num;//方案编号
	private String mothod;//方案名
	private int kind;//措施种类。
	private String name;//措施名称
	private int limY;//评价年限
	private double cost1;//第一年成本
	private double cost2;//第二年成本
	private double cost3;//第三年成本
	private double cost4;//第四年成本
	private double cost5;//第五年成本
	private double inoil1;//第一年增油
	private double inoil2;//第二年增油
	private double inoil3;//第三年增油
	private double inoil4;//第四年增油
	private double inoil5;//第五年增油
	private double balance;//盈亏平衡产量
	private double	decrate;//递减率
	private double waterwell;//水井
	private double oilwell;//油井
	private double totalCost;//总成本
	private double totalInoil;//总增油
	
	public String getMothod() {
		return mothod;
	}
	public void setMothod(String mothod) {
		this.mothod = mothod;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getLimY() {
		return limY;
	}
	public void setLimY(int limY) {
		this.limY = limY;
	}
	public double getCost1() {
		return cost1;
	}
	public void setCost1(double cost1) {
		this.cost1 = Double.parseDouble((String.format("%.2f", cost1)));
	}
	public double getCost2() {
		return cost2;
	}
	public void setCost2(double cost2) {
		this.cost2 = Double.parseDouble((String.format("%.2f", cost2)));
	}
	public double getCost3() {
		return cost3;
	}
	public void setCost3(double cost3) {
		this.cost3 = Double.parseDouble((String.format("%.2f", cost3)));
	}
	public double getCost4() {
		return cost4;
	}
	public void setCost4(double cost4) {
		this.cost4 = Double.parseDouble((String.format("%.2f", cost4)));
	}
	public double getCost5() {
		return cost5;
	}
	public void setCost5(double cost5) {
		this.cost5 = Double.parseDouble((String.format("%.2f", cost5)));
	}
	public double getInoil1() {
		return inoil1;
	}
	public void setInoil1(double inoil1) {
		this.inoil1 = Double.parseDouble((String.format("%.2f", inoil1)));
	}
	public double getInoil2() {
		return inoil2;
	}
	public void setInoil2(double inoil2) {
		this.inoil2 = Double.parseDouble((String.format("%.2f", inoil2)));
	}
	public double getInoil3() {
		return inoil3;
	}
	public void setInoil3(double inoil3) {
		this.inoil3 = Double.parseDouble((String.format("%.2f", inoil3)));
	}
	public double getInoil4() {
		return inoil4;
	}
	public void setInoil4(double inoil4) {
		this.inoil4 = Double.parseDouble((String.format("%.2f", inoil4)));
	}
	public double getInoil5() {
		return inoil5;
	}
	public void setInoil5(double inoil5) {
		this.inoil5 = Double.parseDouble((String.format("%.2f", inoil5)));
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = Double.parseDouble((String.format("%.2f", balance)));
	}
	public double getDecrate() {
		return decrate;
	}
	public void setDecrate(double decrate) {
		this.decrate = Double.parseDouble((String.format("%.2f", decrate)));
	}
	public double getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(double totalCost) {
		this.totalCost = Double.parseDouble((String.format("%.2f", totalCost)));
	}
	public double getTotalInoil() {
		return totalInoil;
	}
	public void setTotalInoil(double totalInoil) {
		this.totalInoil = Double.parseDouble((String.format("%.2f", totalInoil)));
	}
	public double getWaterwell() {
		return waterwell;
	}
	public void setWaterwell(double waterwell) {
		this.waterwell = Double.parseDouble((String.format("%.2f", waterwell)));
	}
	public double getOilwell() {
		return oilwell;
	}
	public void setOilwell(double oilwell) {
		this.oilwell = Double.parseDouble((String.format("%.2f", oilwell)));
	}
	
}
