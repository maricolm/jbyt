package com.jb.mapper;

import java.util.List;

import com.jb.pojo.Sort1;
import com.jb.pojo.Sort2;
import com.jb.pojo.Temp;
import com.jb.pojo.ViewData;

/**
 * @author: mulming
 * @ClassName: YhMapper
 * @date: 2018年7月23日 下午8:43:12
 * @Description:TODO(这里用一句话描述这个类的作用)
 */
public interface YhMapper {
	
	//根据种类，得到评价期的那一年的数据
	public ViewData getOneKindData(ViewData data1);
	//根据序号，返回值
	public ViewData getViewDataByNum(int num);
	
	//插入数据
	public void insertData(ViewData data);
	//清空数据表
	public void deleteData();
	
	//插入数据
	public void insertSort1(Sort1 sort1);
	//清空数据表
	public void deleteSort1();
	
	//查询全部的数据
	public List<Sort1> queryAll();
	
	//排序
	public List<Sort1> sortDateByUser(Sort1 sort1);
	
	//插入数据
	public void insertSort2(Sort2 sort2);
	//查询全部的数据2
	public List<Sort2> queryAll2();
	//清空数据表
	public void deleteSort2();
	
	//按降序查询
	public List<Sort2> findSort2Bydec(Temp temp);
	
	//按顺序赋值
	public void modifySort(Temp temp);//修改排序

}
