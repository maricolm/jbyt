<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/iol/common/css/sapar.css" />
<link rel="stylesheet" type="text/css" href=".${pageContext.request.contextPath}/iol/common/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/iol/static/fayh/css/css.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/common/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/common/js/sapar.js"></script>
<script type="text/javascript" src=".${pageContext.request.contextPath}/iol/common/js/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/static/fayh/js/verifyChe.js"></script>
<title>结果</title>

</head>
<body>
    <div id="saper-container">
        <div class="head">
        	<div class="head2">参数输入</div>
			<div class="head1">结果显示</div>
        </div>
        <div id="saper-bd">
            <div class="subfiled-content">
                <div class="search-box">
                <div class="table">
                    <!--表格具体内容-->
                    <h1 style="text-align: center;color: red;font-size: 20px">${msg }</h1>
                    <div class="table-box">
                        <table id="tab2">
                            <thead>
                                <tr>
                                    <th rowspan="2">措施类型</th>
                                    <th colspan="2">成本(万)</th>
                                    <th rowspan="2">总成本(万)</th>
                                    <th colspan="2">井数(口)</th>
                                    <th rowspan="2">增油(吨)</th>
                                    <th rowspan="2">递减率(%)</th>
                                    <th rowspan="2">备注</th>
                                </tr>
                                <tr>
                                    <th>措施成本</th>
                                    <th>操作成本/日常经营成本</th>
                                    <th>水井</th>
                                    <th>油井</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                	<th>日常经营方案</th>
                                    <td>0</td>
                                    <td>${base.czCost1 }</td>
                                    <td>${base.totalCost }</td>
                                    <td>---</td>
                                    <td>----</td>
                                    <td>${base.totalInoil }</td>
                                    <td>${base.rec }</td>
                                    <td>---</td>
                                </tr>
                                <c:forEach items="${re }" var="re">
	                                <tr>
	                                	<th>${re.name } ${re.mothod }</th>
	                                    <td>${re.csCost1 }</td>
	                                    <td>${re.czCost1 }</td>
	                                    <td>${re.totalCost }</td>
	                                    <td>${re.waterwell }</td>
	                                    <td>${re.oilwell }</td>
	                                    <td>${re.totalInoil }</td>
	                                    <td>${re.rec }</td>
	                                    <td>---</td>
	                                </tr>
                                </c:forEach>
                              	 <tr>
                                	<th>合计</th>
                                    <td>${total.csCost1 }</td>
                                    <td>${total.czCost1 }</td>
                                    <td><fmt:formatNumber value="${total.totalCost }" pattern="#.0#"/></td>
                                    <td><fmt:formatNumber value="${total.waterwell }" pattern="#.0#"/></td>
                                    <td><fmt:formatNumber value="${total.oilwell }" pattern="#.0#"/></td>
                                    <td><fmt:formatNumber value="${total.totalInoil }" pattern="#.0#"/></td>
                                    <td>${total.rec }</td>
                                    <td>Max:<fmt:formatNumber value="${value }" pattern="#.0#"/>万</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div><!--表格结束-->
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