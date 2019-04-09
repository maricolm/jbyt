package com.jb.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.multipart.MultipartFile;

import com.jb.pojo.Sort1;
import com.jb.pojo.Sort2;

/**
 * @author: mulming
 * @ClassName: ToolsService
 * @date: 2018年8月20日 下午9:10:16
 * @Description:TODO(这里用一句话描述这个类的作用)
 */
public interface ToolsService {
	public List<Sort1>  readExcelByFile(MultipartFile file)  throws Exception;//导入数据
	public List<Sort1> sortDateByUser(Sort1 sort1);
	public void ExportDataToWorkbook(List<Sort1> data,String[] head,Workbook workbook);//导出数据
	public void export(HttpServletResponse response,Workbook wb,String fileName)throws Exception;
	public List<Sort1> findAll();
	public void delete1();
	
	public List<Sort2>  readExcelByFile2(MultipartFile file)  throws Exception;//导入数据
	public List<Sort2> findAll2();//查询排序2所有数据
	public void delete2();//清空表2数据

}
