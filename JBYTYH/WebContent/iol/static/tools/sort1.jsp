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
<title>参数输入</title>
</head>
<body>
    <div id="saper-container">
        <div id="saper-bd">
        	<form id="form1" action="${pageContext.request.contextPath}/tool/Sort1.do" method="post" class="saper-form">
            <div class="subfiled-content">
                    <div class="kv-item clearfix">
                        
                        <label>油藏：</label>
                        <div class="kv-item-content">
	                         <select name="kindName" style="width: 100px">
	                         	<option value="-1">请选择...</option>
	                         	<c:forEach items="${name }" var="name1">
	                         		<option value="${name1 }">${name1 }</option>
	                         	</c:forEach>
	                         </select>
                        </div>
                        
						<label>年份：</label>
                        <div class="kv-item-content">
                            <select name="selectYear"  style="width: 100px">
                            <option value="-1">请选择...</option>
                            		<c:forEach items="${year }" var="year1">
                            			<option value="${year1 }">${year1 }</option>
                            		</c:forEach>
                            </select>
                        </div>
                        
                        <label>排序指标：</label>
                        <div class="kv-item-content">
                            <select name="sortKind"  style="width: 100px">
                            	<option value="-1">请选择...</option>
                            	<option value="col31">单井利润</option>
                            	<option value="col26">净收益</option>
                            </select>
                        </div>
                        <label></label>
                         <div class="kv-item-content">
		                		<input value="提交" type="submit" class="sapar-btn sapar-btn-recom" style="width:100px;margin: 0 auto;display:inline-block;float: none;">
		                </div>
                  </div>
            </div>
           </form>
            <div class="subfiled clearfix">
                <h2></h2>
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
                                	<th>序号</th>
                                	<th>油藏</th>
                                    <th>年份</th>
                                    <th>总投资</th>
                                    <th>年收益</th>
                                    <th>累计收益</th>
                                    <th>净现值</th>
                                    <th>经济界限</th>
                                    <th>净现值率</th>
                                    <th>投入产出比</th>
                                    <th>单井利润</th>
                                    <th>净收益</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%int i=1; %>
                            <c:forEach items="${sort1 }" var="sort" begin="">
                            	<tr>
                            		<td><%=i++ %></td>
                                    <td>${sort.col1 }</td>
                                    <td>${sort.col2 }</td>
                                    <td>${sort.col20 }</td>
                                    <td>${sort.col24 }</td>
                                    <td>${sort.col25 }</td>
                                    <td>${sort.col27 }</td>
                                    <td>${sort.col28 }</td>
                                    <td>${sort.col29 }</td>
                                    <td>${sort.col30 }</td>
                                    <td>${sort.col31 }</td>
                                    <td>${sort.col26 }</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div><!--表格结束-->
				<div style="width: 100%;height: 50px;text-align: center;margin-top: 20px;">
                		<a href="${pageContext.request.contextPath}/tool/export.do" id="tj" class="sapar-btn sapar-btn-recom" style="width:100px;margin: 0 auto;display:inline-block;float: none;">导出Excel</a>
                		<a href="${pageContext.request.contextPath}/tool/delete1.do"  onclick="return confirm('你的操作将无法恢复。确认清空？')" id="tj" class="sapar-btn sapar-btn-recom" style="width:100px;margin: 0 auto;display:inline-block;float: none;">清空数据</a>
                </div>
            </div>
        </div>
        <div id="saper-ft"></div>
    </div>
</body>

<script type="text/javascript">
$('#pagin').pagination(100,{
    callback: function(page){
        alert(page);    
    },
    display_msg: true,
    setPageNo: true
});

</script>
</html>