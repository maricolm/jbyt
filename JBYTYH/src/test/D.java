package test;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.junit.Test;

public class D {
	@Test
	public void test() {
		//读取excel表
		File file = new File("/Users/mulming/code/all_Java/AO/src/excel/one.xlsx");  
        InputStream inputStream = null;  
        Workbook workbook = null;  
        try {  
            inputStream = new FileInputStream(file);  
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
            System.out.println("行数：" + rowLength + ",列数：" + colLength);  
            for (int i = 0; i < rowLength; i++) {  
            	StringBuffer fieldValue=new StringBuffer();//存储每次读取的值
                row = sheet.getRow(i);  
                for (int j = 0; j < colLength; j++) {  
                    cell = row.getCell(j);  
                    //Excel数据Cell有不同的类型，当我们试图从一个数字类型的Cell读取出一个字符串时就有可能报异常：  
                    //Cannot get a STRING value from a NUMERIC cell  
                    //将所有的需要读的Cell表格设置为String格式  
                    if (cell != null)  
                        cell.setCellType(CellType.STRING);
                    if(j<colLength-1)
                    	fieldValue.append(cell.getStringCellValue()+",");
                    else 
                    	fieldValue.append(cell.getStringCellValue());
                    System.out.print(cell.getStringCellValue() + "\t");  
                } 
               String sql="insert into dd(dd,ss) values("+fieldValue.toString()+");";
                System.out.println(sql);
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
	}
}
