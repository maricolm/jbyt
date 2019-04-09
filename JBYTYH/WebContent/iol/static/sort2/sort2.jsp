<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/iol/common/css/sapar.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/iol/common/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/iol/static/tools/css/css.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/common/js/jquery.js"></script>
<script type="text/javascript" src=".${pageContext.request.contextPath}/iol/common/js/sapar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/common/js/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/static/sort2/jQuery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/static/sort2/jqplot.js"></script>
<title>参数输入</title>
</head>
<body>
    <div id="saper-container">
        <div id="saper-bd">
            <div class="subfiled clearfix">
            	
            </div>
            <div class="subfiled-content">
                <div class="search-box">
                <!--表格开始-->
                <div class="table">
                    <!--表格具体内容-->
                    <div class="table-box">
                        <table id="tab2">
                            <thead>
                                <tr>
                                	<th  rowspan="2">油藏</th>
                                    <th  rowspan="2">生产成本</th>
                                    <th  rowspan="2">折旧折耗</th>
                                    <th  rowspan="2">操作费用</th>
                                    <th  rowspan="2">人员费用</th>
                                    <th  rowspan="2">基本运行费</th>
                                    <th  rowspan="2">原油商品量</th>
                                    <th  rowspan="2">开井油水井数</th>
                                    <th  colspan="2">生产成本</th>
                                    <th  colspan="2">操作费用</th>
                                    <th  colspan="2">基本运行费</th>
                                    <th  colspan="2">人员费用</th>
                                    <th  colspan="2">折旧折耗</th>
                                </tr>
                                <tr>
                                	<th>单井生产成本</th>
                                	<th>排序</th>
                                	<th>单井操作费用</th>
                                	<th>排序</th>
                                	<th>单井基本运行费</th>
                                	<th>排序</th>
                                	<th>单井人员费用</th>
                                	<th>排序</th>
                                	<th>单井折旧折耗</th>
                                	<th>排序</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${sort2 }" var="list">
                            	<tr>
                                    <td>${list.col1 }</td>
                                    <td>${list.col2 }</td>
                                    <td>${list.col3 }</td>
                                    <td>${list.col4 }</td>
                                    <td>${list.col5 }</td>
                                    <td>${list.col6 }</td>
                                    <td>${list.col7 }</td>
                                    <td>${list.col8 }</td>
                                    <td>${list.col9 }</td>
                                    <td>${list.col10 }</td>
                                    <td>${list.col11 }</td>
                                    <td>${list.col12 }</td>
                                    <td>${list.col13 }</td>
                                    <td>${list.col14 }</td>
                                    <td>${list.col15 }</td>
                                    <td>${list.col16 }</td>
                                    <td>${list.col17 }</td>
                                    <td>${list.col18 }</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div><!--表格结束-->
                <div style="width: 100%;height: 50px;text-align: center;margin-top: 20px;">
                <a href="${pageContext.request.contextPath}/tool/delete2.do" id="tj" class="sapar-btn sapar-btn-recom" style="width:100px;margin: 0 auto;display:inline-block;float: none;">清空数据</a>
                </div>
            </div>
        </div>
        <div id="saper-ft"></div>
    </div>
    <div id="col1" style="display: none;"><c:forEach items='${sort2 }' var='list'>${list.col1 },</c:forEach></div>
    <div id="col2"  style="display: none;"><c:forEach items='${sort2 }' var='list'>${list.col11 },</c:forEach></div>
    <div id="col3"  style="display: none;"><c:forEach items='${sort2 }' var='list'>${list.col13 },</c:forEach></div>
    <div id="col4"  style="display: none;"><c:forEach items='${sort2 }' var='list'>${list.col15 },</c:forEach></div>
    <div id="col5"   style="display: none;"><c:forEach items='${sort2 }' var='list'>${list.col17 },</c:forEach></div>
    <div id="col6"   style="display: none;"><c:forEach items='${sort2 }' var='list'>${list.col9 },</c:forEach></div>
  
	<div id="chart1"></div>
	<div id="chart2"></div>
	<script type="text/javascript">
		var data1=$("#col2").text();
		var data11=data1.split(",").slice(0,data1.split(",").length-1);
		console.log(data11);
		var data2=$("#col3").text();
		var data22=data2.split(",").slice(0,data2.split(",").length-1);
		var data3=$("#col4").text();
		var data33=data3.split(",").slice(0,data3.split(",").length-1);
		var data4=$("#col5").text();
		var data44=data4.split(",").slice(0,data4.split(",").length-1);
		var data5=$("#col6").text();
		var data55=data5.split(",").slice(0,data5.split(",").length-1);
		
		var max=0;
		for(var i=0;i<data11.length;i++){
			if(parseFloat(max)<parseFloat(data11[i])){
				max=parseFloat(data11[i]);
			}
		}
		for(var i=0;i<data22.length;i++){
			if(parseFloat(max)<parseFloat(data22[i])){
				max=parseFloat(data22[i]);
			}
		}
		for(var i=0;i<data33.length;i++){
			if(parseFloat(max)<parseFloat(data33[i])){
				max=parseFloat(data33[i]);
			}
		}
		for(var i=0;i<data44.length;i++){
			if(parseFloat(max)<parseFloat(data44[i])){
				max=parseFloat(data44[i]);
			}
		}
		for(var i=0;i<data55.length;i++){
			if(parseFloat(max)<parseFloat(data55[i])){
				max=parseFloat(data55[i]);
			}
		}
		
		var data = [data55,data11,data22,data33,data44];
		var data_max = max+5; //Y轴最大刻度
		var line_title = ["单井生产成本","操作费用","基本运行费","人员费","折旧折耗"]; //曲线名称
		var y_label = "数值"; //Y轴标题
		var x_label = "油藏"; //X轴标题
		var xx=$("#col1").text();
		//var x = [1,2,3,4,5,6,7,8,9]; //定义X轴刻度值
		var x = xx.split(",").slice(0,xx.split(",").length-1); //定义X轴刻度值
		var title = "对比图"; //统计图标标题
		j.jqplot.diagram.base("chart1", data, line_title, "对比图", x, x_label, y_label, data_max, 1);
		j.jqplot.diagram.base("chart2", data, line_title, "统计图", x, x_label, y_label, data_max, 2);
	</script>
    
</body>

</html>