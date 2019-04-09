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
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/common/js/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/static/fayh/js/verifyChe.js"></script>
<title>参数输入</title>
</head>
<body>
    <div id="saper-container">
        <div class="head">
        	<div class="head1">参数输入</div>
			<div class="head2">结果显示</div>
        </div>
        <div id="saper-bd">
        	<form id="form1" action="${pageContext.request.contextPath}/mix/getMixFiveReList.do" method="post" class="saper-form">
            	<input name="year" value="5"  type="hidden">
             	<input name="a" value="${a }"  type="hidden">
             	<input name="b" value="${b }"  type="hidden">
             	<input name="rate" value="${rate }"  type="hidden">
             	<input name="c" value="${c }"  type="hidden">
             	<input name="investment" value="${investment }"  type="hidden">
            <div class="subfiled clearfix">
                <h2>最优方案集</h2>
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
                                	<th rowspan="2"><input type="checkbox" name="allSel">全选</th>
                                    <th rowspan="2">措施类型</th>
                                    <th rowspan="2">评价年限</th>
                                    <th colspan="5">各年成本(万)</th>
                                    <th rowspan="2">各措施总成本(万)</th>
                                    <th colspan="2">井数(口)</th>
                                    <th colspan="5">各年增油(吨)</th>
                                    <th rowspan="2">各措施总增油(吨)</th>
                                    <th rowspan="2">递减率(%)</th>
                                    <th rowspan="2" title="是指当年产量经济收入等于全部成本时的年产量">盈亏平衡产量</th>
                                </tr>
                                <tr>
                                    <th>1</th>
                                    <th>2</th>
                                    <th>3</th>
                                    <th>4</th>
                                    <th>5</th>
                                    <th>水井</th>
                                    <th>油井</th>
                                    <th>1</th>
                                    <th>2</th>
                                    <th>3</th>
                                    <th>4</th>
                                    <th>5</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                	<th><input type="checkbox" checked="checked" disabled="disabled" name="sele1">日常经营方案</th>
                                    <td>基础方案</td>
                                    <td>5</td>
                                    <td>${base.cost1 }</td>
                                    <td>${base.cost2 }</td>
                                    <td>${base.cost3 }</td>
                                    <td>${base.cost4 }</td>
                                    <td>${base.cost5 }</td>
                                    <td>${base.totalCost }</td>
                                    <td>${base.waterwell }</td>
                                    <td>${base.oilwell }</td>
                                    <td>${base.inoil1 }</td>
                                    <td>${base.inoil2 }</td>
                                    <td>${base.inoil3 }</td>
                                    <td>${base.inoil4 }</td>
                                    <td>${base.inoil5 }</td>
                                    <td>${base.totalInoil }</td>
                                    <td>${base.decrate }</td>
                                    <td>${base.balance }</td>
                                </tr>
                                <c:forEach items="${ty }" var="ty1">
                                <c:choose>
                                	<c:when test="${ty1.limY==1 }">
                                		<tr>
		                                	<th rowspan="10"><input type="checkbox" name="sele" value="1">开发技术</th>
		                                    <td>${ty1.name } ${ty1.mothod }</td>
		                                    <td>${ty1.limY }</td>
		                                    <td>${ty1.cost1 }</td>
		                                    <td>${ty1.cost2 }</td>
		                                    <td>${ty1.cost3 }</td>
		                                    <td>${ty1.cost4 }</td>
		                                    <td>${ty1.cost5 }</td>
		                                    <td>${ty1.totalCost }</td>
		                                    <td>${ty1.waterwell }</td>
		                                    <td>${ty1.oilwell }</td>
		                                    <td>${ty1.inoil1 }</td>
		                                    <td>${ty1.inoil2 }</td>
		                                    <td>${ty1.inoil3 }</td>
		                                    <td>${ty1.inoil4 }</td>
		                                    <td>${ty1.inoil5 }</td>
		                                    <td>${ty1.totalInoil }</td>
		                                    <td>${ty1.decrate }</td>
		                                    <td>${ty1.balance }</td>
		                                </tr>
                                	</c:when>
                                	<c:otherwise>
                                		<tr>
		                                    <td>${ty1.name }  ${ty1.mothod }</td>
		                                    <td>${ty1.limY }</td>
		                                    <td>${ty1.cost1 }</td>
		                                    <td>${ty1.cost2 }</td>
		                                    <td>${ty1.cost3 }</td>
		                                    <td>${ty1.cost4 }</td>
		                                    <td>${ty1.cost5 }</td>
		                                    <td>${ty1.totalCost }</td>
		                                    <td>${ty1.waterwell }</td>
		                                    <td>${ty1.oilwell }</td>
		                                    <td>${ty1.inoil1 }</td>
		                                    <td>${ty1.inoil2 }</td>
		                                    <td>${ty1.inoil3 }</td>
		                                    <td>${ty1.inoil4 }</td>
		                                    <td>${ty1.inoil5 }</td>
		                                    <td>${ty1.totalInoil }</td>
		                                    <td>${ty1.decrate }</td>
		                                    <td>${ty1.balance }</td>
		                                </tr>
                                	</c:otherwise>
                                </c:choose>
                                </c:forEach>
                                <c:forEach items="${zcb }" var="zcb1">
                                	<tr>
	                                    <td>${zcb1.name }  ${zcb1.mothod }</td>
	                                    <td>${zcb1.limY }</td>
	                                    <td>${zcb1.cost1 }</td>
	                                    <td>${zcb1.cost2 }</td>
	                                    <td>${zcb1.cost3 }</td>
	                                    <td>${zcb1.cost4 }</td>
	                                    <td>${zcb1.cost5 }</td>
	                                    <td>${zcb1.totalCost }</td>
	                                    <td>${zcb1.waterwell }</td>
	                                    <td>${zcb1.oilwell }</td>
	                                    <td>${zcb1.inoil1 }</td>
	                                    <td>${zcb1.inoil2 }</td>
	                                    <td>${zcb1.inoil3 }</td>
	                                    <td>${zcb1.inoil4 }</td>
	                                    <td>${zcb1.inoil5 }</td>
	                                    <td>${zcb1.totalInoil }</td>
	                                    <td>${zcb1.decrate }</td>
	                                    <td>${zcb1.balance }</td>
                                	</tr>
                                </c:forEach>
                                <c:forEach items="${yl }" var="yl1">
                                <c:choose>
                                	<c:when test="${yl1.limY==1  }">
                                		<tr>
		                                    <th rowspan="20" style="background-color: white;"><input type="checkbox" name="sele" value="2">措施方案</th>
		                                    <td>${yl1.name }  ${yl1.mothod }</td>
		                                    <td>${yl1.limY }</td>
		                                    <td>${yl1.cost1 }</td>
		                                    <td>${yl1.cost2 }</td>
		                                    <td>${yl1.cost3 }</td>
		                                    <td>${yl1.cost4 }</td>
		                                    <td>${yl1.cost5 }</td>
		                                    <td>${yl1.totalCost }</td>
		                                    <td>${yl1.waterwell }</td>
		                                    <td>${yl1.oilwell }</td>
		                                    <td>${yl1.inoil1 }</td>
		                                    <td>${yl1.inoil2 }</td>
		                                    <td>${yl1.inoil3 }</td>
		                                    <td>${yl1.inoil4 }</td>
		                                    <td>${yl1.inoil5 }</td>
		                                    <td>${yl1.totalInoil }</td>
		                                    <td>${yl1.decrate }</td>
		                                    <td>${yl1.balance }</td>
		                                </tr>
                                	</c:when>
                                	<c:otherwise>
                                		<tr>
		                                    <td>${yl1.name }  ${yl1.mothod }</td>
		                                    <td>${yl1.limY }</td>
		                                    <td>${yl1.cost1 }</td>
		                                    <td>${yl1.cost2 }</td>
		                                    <td>${yl1.cost3 }</td>
		                                    <td>${yl1.cost4 }</td>
		                                    <td>${yl1.cost5 }</td>
		                                    <td>${yl1.totalCost }</td>
		                                    <td>${yl1.waterwell }</td>
		                                    <td>${yl1.oilwell }</td>
		                                    <td>${yl1.inoil1 }</td>
		                                    <td>${yl1.inoil2 }</td>
		                                    <td>${yl1.inoil3 }</td>
		                                    <td>${yl1.inoil4 }</td>
		                                    <td>${yl1.inoil5 }</td>
		                                    <td>${yl1.totalInoil }</td>
		                                    <td>${yl1.decrate }</td>
		                                    <td>${yl1.balance }</td>
		                                </tr>
                                	</c:otherwise>
                                </c:choose>
                                </c:forEach>
                                <c:forEach items="${sh }" var="sh1">
                                	<tr>
	                                    <td>${sh1.name }  ${sh1.mothod }</td>
	                                    <td>${sh1.limY }</td>
	                                    <td>${sh1.cost1 }</td>
	                                    <td>${sh1.cost2 }</td>
	                                    <td>${sh1.cost3 }</td>
	                                    <td>${sh1.cost4 }</td>
	                                    <td>${sh1.cost5 }</td>
	                                    <td>${sh1.totalCost }</td>
	                                    <td>${sh1.waterwell }</td>
	                                    <td>${sh1.oilwell }</td>
	                                    <td>${sh1.inoil1 }</td>
	                                    <td>${sh1.inoil2 }</td>
	                                    <td>${sh1.inoil3 }</td>
	                                    <td>${sh1.inoil4 }</td>
	                                    <td>${sh1.inoil5 }</td>
	                                    <td>${sh1.totalInoil }</td>
	                                    <td>${sh1.decrate }</td>
	                                    <td>${sh1.balance }</td>
	                                </tr>
                                </c:forEach>
                                <c:forEach items="${bk }" var="bk1">
	                                <tr>
	                                    <td>${bk1.name }  ${bk1.mothod }</td>
	                                    <td>${bk1.limY }</td>
	                                    <td>${bk1.cost1 }</td>
	                                    <td>${bk1.cost2 }</td>
	                                    <td>${bk1.cost3 }</td>
	                                    <td>${bk1.cost4 }</td>
	                                    <td>${bk1.cost5 }</td>
	                                    <td>${bk1.totalCost }</td>
	                                    <td>${bk1.waterwell }</td>
	                                    <td>${bk1.oilwell }</td>
	                                    <td>${bk1.inoil1 }</td>
	                                    <td>${bk1.inoil2 }</td>
	                                    <td>${bk1.inoil3 }</td>
	                                    <td>${bk1.inoil4 }</td>
	                                    <td>${bk1.inoil5 }</td>
	                                    <td>${bk1.totalInoil }</td>
	                                    <td>${bk1.decrate }</td>
	                                    <td>${bk1.balance }</td>
	                                </tr>
	                            </c:forEach>
	                            <c:forEach items="${ds }" var="ds1">
	                                <tr>
	                                    <td>${ds1.name }  ${ds1.mothod }</td>
	                                    <td>${ds1.limY }</td>
	                                    <td>${ds1.cost1 }</td>
	                                    <td>${ds1.cost2 }</td>
	                                    <td>${ds1.cost3 }</td>
	                                    <td>${ds1.cost4 }</td>
	                                    <td>${ds1.cost5 }</td>
	                                    <td>${ds1.totalCost }</td>
	                                    <td>${ds1.waterwell }</td>
	                                    <td>${ds1.oilwell }</td>
	                                    <td>${ds1.inoil1 }</td>
	                                    <td>${ds1.inoil2 }</td>
	                                    <td>${ds1.inoil3 }</td>
	                                    <td>${ds1.inoil4 }</td>
	                                    <td>${ds1.inoil5 }</td>
	                                    <td>${ds1.totalInoil }</td>
	                                    <td>${ds1.decrate }</td>
	                                    <td>${ds1.balance }</td>
	                                </tr>
	                            </c:forEach>
	                            <c:forEach	items="${hhs }" var="hhs1">
		                            <c:choose>
		                            	<c:when test="${hhs1.limY==1 }">
		                            		<tr>
			                                	<th rowspan="10"><input type="checkbox" name="sele" value="3">提高采收率</th>
			                                    <td>${hhs1.name }  ${hhs1.mothod }</td>
			                                    <td>${hhs1.limY }</td>
			                                    <td>${hhs1.cost1 }</td>
			                                    <td>${hhs1.cost2 }</td>
			                                    <td>${hhs1.cost3 }</td>
			                                    <td>${hhs1.cost4 }</td>
			                                    <td>${hhs1.cost5 }</td>
			                                    <td>${hhs1.totalCost }</td>
			                                    <td>${hhs1.waterwell }</td>
			                                    <td>${hhs1.oilwell }</td>
			                                    <td>${hhs1.inoil1 }</td>
			                                    <td>${hhs1.inoil2 }</td>
			                                    <td>${hhs1.inoil3 }</td>
			                                    <td>${hhs1.inoil4 }</td>
			                                    <td>${hhs1.inoil5 }</td>
			                                    <td>${hhs1.totalInoil }</td>
			                                    <td>${hhs1.decrate }</td>
			                                    <td>${hhs1.balance }</td>
			                                </tr>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<tr>
			                                    <td>${hhs1.name }  ${hhs1.mothod }</td>
			                                    <td>${hhs1.limY }</td>
			                                    <td>${hhs1.cost1 }</td>
			                                    <td>${hhs1.cost2 }</td>
			                                    <td>${hhs1.cost3 }</td>
			                                    <td>${hhs1.cost4 }</td>
			                                    <td>${hhs1.cost5 }</td>
			                                    <td>${hhs1.totalCost }</td>
			                                    <td>${hhs1.waterwell }</td>
			                                    <td>${hhs1.oilwell }</td>
			                                    <td>${hhs1.inoil1 }</td>
			                                    <td>${hhs1.inoil2 }</td>
			                                    <td>${hhs1.inoil3 }</td>
			                                    <td>${hhs1.inoil4 }</td>
			                                    <td>${hhs1.inoil5 }</td>
			                                    <td>${hhs1.totalInoil }</td>
			                                    <td>${hhs1.decrate }</td>
			                                    <td>${hhs1.balance }</td>
			                                </tr>
		                            	</c:otherwise>
		                            </c:choose>
	                            </c:forEach>
                                <c:forEach	items="${zjhw }" var="zjhw1">
	                               <tr>
	                                    <td>${zjhw1.name }  ${zjhw1.mothod }</td>
	                                    <td>${zjhw1.limY }</td>
	                                    <td>${zjhw1.cost1 }</td>
	                                    <td>${zjhw1.cost2 }</td>
	                                    <td>${zjhw1.cost3 }</td>
	                                    <td>${zjhw1.cost4 }</td>
	                                    <td>${zjhw1.cost5 }</td>
	                                    <td>${zjhw1.totalCost }</td>
	                                    <td>${zjhw1.waterwell }</td>
	                                    <td>${zjhw1.oilwell }</td>
	                                    <td>${zjhw1.inoil1 }</td>
	                                    <td>${zjhw1.inoil2 }</td>
	                                    <td>${zjhw1.inoil3 }</td>
	                                    <td>${zjhw1.inoil4 }</td>
	                                    <td>${zjhw1.inoil5 }</td>
	                                    <td>${zjhw1.totalInoil }</td>
	                                    <td>${zjhw1.decrate }</td>
	                                    <td>${zjhw1.balance }</td>
	                                </tr>
	                             </c:forEach>
	                             <tr>
                                	<th><input type="checkbox" name="sele" name="sele" value="4">加密井/钻井</th>
                                    <td>${jmj.name }  ${jmj.mothod }</td>
                                    <td>${jmj.limY }</td>
                                    <td>${jmj.cost1 }</td>
                                    <td>${jmj.cost2 }</td>
                                    <td>${jmj.cost3 }</td>
                                    <td>${jmj.cost4 }</td>
                                    <td>${jmj.cost5 }</td>
                                    <td>${jmj.totalCost }</td>
                                    <td>${jmj.waterwell }</td>
                                    <td>${jmj.oilwell }</td>
                                    <td>${jmj.inoil1 }</td>
                                    <td>${jmj.inoil2 }</td>
                                    <td>${jmj.inoil3 }</td>
                                    <td>${jmj.inoil4 }</td>
                                    <td>${jmj.inoil5 }</td>
                                    <td>${jmj.totalInoil }</td>
                                    <td>${jmj.decrate }</td>
                                    <td>${jmj.balance }</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div><!--表格结束-->
				<div style="width: 100%;height: 50px;text-align: center;margin-top: 20px;">
                	 <input type="submit" id="ttj" class="sapar-btn sapar-btn-recom" style="width:100px;margin: 0 auto;display:inline-block;float: none;"/>
                </div>
				</form>
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