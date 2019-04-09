package com.jb.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import com.jb.pojo.Sort1;
import com.jb.pojo.Sort2;
import com.jb.service.ToolsService;

/**
 * @author: mulming
 * @ClassName: Sort
 * @date: 2018年8月20日 下午9:08:54
 * @Description:TODO(排序小工具)
 */
@Controller
@RequestMapping("/tool")
public class SortController {
	@Autowired
	private ToolsService toolsService;
	//上传数据
	@RequestMapping("/uploadSort1.do")
	public String uploadSort1(MultipartFile file,HttpServletRequest req,HttpSession session) throws Exception{
		try {
			List<Sort1> sort1=toolsService.readExcelByFile(file);
			Set<String> name = new TreeSet<String>();//油藏名字
			Set<String> year = new TreeSet<String>();//油藏年份
			for(int i=0;i<sort1.size();i++) {
				name.add(sort1.get(i).getCol1());
				year.add(sort1.get(i).getCol2());
			}
			session.setAttribute("sortDate", sort1);
			req.setAttribute("sort1", sort1);
			session.setAttribute("name", name);
			session.setAttribute("year", year);
			return "tools/sort1";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			req.setAttribute("msg", "上传数据失败，请检查数据模版格式是否正确！");
			return "tools/uploaderror";
		}
	}	
	
	@RequestMapping("/Sort1.do")
	public String Sort1(String kindName,String selectYear,String sortKind,HttpServletRequest req,HttpSession session) throws Exception{
		Set<String> name = (Set<String>) session.getAttribute("name");
		Set<String> year = (Set<String>) session.getAttribute("year");
		Sort1 temp=new Sort1();
		temp.setCol1(kindName);
		temp.setCol2(selectYear);
		temp.setKind(sortKind);
		List<Sort1> sort1=toolsService.sortDateByUser(temp);
		session.setAttribute("sortDate", sort1);
		session.setAttribute("name", name);
		session.setAttribute("year", year);
		req.setAttribute("sort1", sort1);
		return "tools/sort1";
	}
	
	//清空数据
	@RequestMapping("/delete1.do")
	public String delete1(HttpSession session,HttpServletResponse response) throws Exception{
		toolsService.delete1();
		return "tools/uploadsort1";
	}
	
	//导出数据
	@RequestMapping("/export.do")
	public void export(HttpSession session,HttpServletResponse response) throws Exception{
		List<Sort1> data=(List<Sort1>) session.getAttribute("sortDate");
		Workbook workbook = new XSSFWorkbook();
		String headers[]={"油藏","年份","油井数","油井开","注水井数","注水井数开","基本投资","油水井投资","建设总投资","折旧折耗","人员费用","基本运行费","材料费","电费","运输费","井下作业费","维护及维修费","业务外包支出","其他","总投资","折现率","累产油量","油价","年收益","累计收益","净收益","净现值","经济界限","净现值率","投入产出比","单井利润"};
	   toolsService.ExportDataToWorkbook(data, headers, workbook);//把数据集加载到workBook中
	   toolsService.export(response, workbook, System.currentTimeMillis()+".xlsx");
	}
	
	//直接查询所有
	@RequestMapping("/findAll.do")
	public String findAll(HttpServletRequest req,HttpSession session) throws Exception{
		try {
			
			List<Sort1> sort1=toolsService.findAll();
			Set<String> name = new TreeSet<String>();//油藏名字
			Set<String> year = new TreeSet<String>();//油藏年份
			for(int i=0;i<sort1.size();i++) {
				name.add(sort1.get(i).getCol1());
				year.add(sort1.get(i).getCol2());
			}
			session.setAttribute("sortDate", sort1);
			req.setAttribute("sort1", sort1);
			session.setAttribute("name", name);
			session.setAttribute("year", year);
			return "tools/sort1";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			req.setAttribute("msg", "上传数据失败，请检查数据模版格式是否正确！");
			return "tools/uploaderror";
		}
	}

	
	//上传数据
	@RequestMapping("/uploadSort2.do")
	public String uploadSort2(MultipartFile file,HttpServletRequest req,HttpSession session) throws Exception{
		try {
			List<Sort2> sort2=toolsService.readExcelByFile2(file);
			session.setAttribute("sort2", sort2);
			return "redirect:/iol/static/sort2/sort2.jsp";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			req.setAttribute("msg", "上传数据失败，请检查数据模版格式是否正确！");
			return "tools/uploaderror";
		}
	}	
	//查询所有
	@RequestMapping("/findAll2.do")
	public String findAll2(HttpServletRequest req,HttpSession session) throws Exception{
		try {
			List<Sort2> sort2=toolsService.findAll2();
			session.setAttribute("sort2", sort2);
			return "redirect:/iol/static/sort2/sort2.jsp";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			req.setAttribute("msg", "上传数据失败，请检查数据模版格式是否正确！");
			return "tools/uploaderror";
		}
	}	
	//清空排序2数据
	@RequestMapping("/delete2.do")
	public String delete2(HttpServletRequest req,HttpSession session) throws Exception{
		try {
			toolsService.delete2();
			return "redirect:/iol/static/sort2/uploadSort2.jsp";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			req.setAttribute("msg", "上传数据失败，请检查数据模版格式是否正确！");
			return "tools/uploaderror";
		}
	}
}
