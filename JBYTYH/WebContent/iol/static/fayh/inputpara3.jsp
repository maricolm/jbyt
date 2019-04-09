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
        	<form id="form1" action="${pageContext.request.contextPath}/yh/getSingleList.do" method="post" class="saper-form">
            	<input name="year" value="3"  type="hidden">
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
                                    <th colspan="3">各年成本(万)</th>
                                    <th rowspan="2">各措施总成本(万)</th>
                                    <th colspan="2">井数(口)</th>
                                    <th colspan="3">各年增油(吨)</th>
                                    <th rowspan="2">各措施总增油(吨)</th>
                                    <th rowspan="2">递减率(%)</th>
                                    <th rowspan="2" title="是指当年产量经济收入等于全部成本时的年产量">盈亏平衡产量</th>
                                </tr>
                                <tr>
                                    <th>1</th>
                                    <th>2</th>
                                    <th>3</th>
                                    <th>水井</th>
                                    <th>油井</th>
                                    <th>1</th>
                                    <th>2</th>
                                    <th>3</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                	<th><input type="checkbox"  checked="checked" disabled="disabled" name="sele1">日常经营方案</th>
                                    <td>基础方案</td>
                                    <td>${base.cost1 }</td>
                                    <td>${base.cost2 }</td>
                                    <td>${base.cost3 }</td>
                                    <td>${base.totalCost }</td>
                                    <td>${base.waterwell }</td>
                                    <td>${base.oilwell }</td>
                                    <td>${base.inoil1 }</td>
                                    <td>${base.inoil2 }</td>
                                    <td>${base.inoil3 }</td>
                                    <td>${base.totalInoil }</td>
                                    <td>${base.decrate }</td>
                                    <td>${base.balance }</td>
                                    <input type="hidden" name="c" value="${base.totalInoil }">
                                </tr>
                                <tr>
                                	<th rowspan="2"><input type="checkbox" name="sele"  name="sele" value="1">开发技术</th>
                                    <td>${ty.name } ${ty.mothod }</td>
                                    <td>${ty.cost1 }</td>
                                    <td>${ty.cost2 }</td>
                                    <td>${ty.cost3 }</td>
                                    <td>${ty.totalCost }</td>
                                    <td>${ty.waterwell }</td>
                                    <td>${ty.oilwell }</td>
                                    <td>${ty.inoil1 }</td>
                                    <td>${ty.inoil2 }</td>
                                    <td>${ty.inoil3 }</td>
                                    <td>${ty.totalInoil }</td>
                                    <td>${ty.decrate }</td>
                                    <td>${ty.balance }</td>
                                    <input type="hidden" name="C" value="${ty.totalCost }">
                                    <input type="hidden" name="sj" value="${ty.waterwell }">
                                    <input type="hidden" name="yj" value="${ty.oilwell }">
                                    <input type="hidden" name="Q" value="${ty.totalInoil }">
                                    <input type="hidden" name="djl" value="${ty.decrate }">
                                    <input type="hidden" name="QQ" value="${ty.balance }">
                                </tr>
                                <tr>
                                    <td>${zcb.name } ${zcb.mothod }</td>
                                    <td>${zcb.cost1 }</td>
                                    <td>${zcb.cost2 }</td>
                                    <td>${zcb.cost3 }</td>
                                    <td>${zcb.totalCost }</td>
                                    <td>${zcb.waterwell }</td>
                                    <td>${zcb.oilwell }</td>
                                    <td>${zcb.inoil1 }</td>
                                    <td>${zcb.inoil2 }</td>
                                    <td>${zcb.inoil3 }</td>
                                    <td>${zcb.totalInoil }</td>
                                    <td>${zcb.decrate }</td>
                                    <td>${zcb.balance }</td>
                                    <input type="hidden" name="C" value="${zcb.totalCost }">
                                    <input type="hidden" name="sj" value="${zcb.waterwell }">
                                    <input type="hidden" name="yj" value="${zcb.oilwell }">
                                    <input type="hidden" name="Q" value="${zcb.totalInoil }">
                                    <input type="hidden" name="djl" value="${zcb.decrate }">
                                    <input type="hidden" name="QQ" value="${zcb.balance }">
                                </tr>
                                <tr>
                                    <th rowspan="4" style="background-color: white;"><input type="checkbox" name="sele"  name="sele" value="2">措施方案</th>
                                    <td>${yl.name } ${yl.mothod }</td>
                                    <td>${yl.cost1 }</td>
                                    <td>${yl.cost2 }</td>
                                    <td>${yl.cost3 }</td>
                                    <td>${yl.totalCost }</td>
                                    <td>${yl.waterwell }</td>
                                    <td>${yl.oilwell }</td>
                                    <td>${yl.inoil1 }</td>
                                    <td>${yl.inoil2 }</td>
                                    <td>${yl.inoil3 }</td>
                                    <td>${yl.totalInoil }</td>
                                    <td>${yl.decrate }</td>
                                    <td>${yl.balance }</td>
                                    <input type="hidden" name="C" value="${yl.totalCost }">
                                    <input type="hidden" name="sj" value="${yl.waterwell }">
                                    <input type="hidden" name="yj" value="${yl.oilwell }">
                                    <input type="hidden" name="Q" value="${yl.totalInoil }">
                                    <input type="hidden" name="djl" value="${yl.decrate }">
                                    <input type="hidden" name="QQ" value="${yl.balance }">
                                </tr>
                                <tr>
                                    <td>${sh.name } ${sh.mothod }</td>
                                    <td>${sh.cost1 }</td>
                                    <td>${sh.cost2 }</td>
                                    <td>${sh.cost3 }</td>
                                    <td>${sh.totalCost }</td>
                                    <td>${sh.waterwell }</td>
                                    <td>${sh.oilwell }</td>
                                    <td>${sh.inoil1 }</td>
                                    <td>${sh.inoil2 }</td>
                                    <td>${sh.inoil3 }</td>
                                    <td>${sh.totalInoil }</td>
                                    <td>${sh.decrate }</td>
                                    <td>${sh.balance }</td>
                                    <input type="hidden" name="C" value="${sh.totalCost }">
                                    <input type="hidden" name="sj" value="${sh.waterwell }">
                                    <input type="hidden" name="yj" value="${sh.oilwell }">
                                    <input type="hidden" name="Q" value="${sh.totalInoil }">
                                    <input type="hidden" name="djl" value="${sh.decrate }">
                                    <input type="hidden" name="QQ" value="${sh.balance }">
                                </tr>
                                <tr>
                                    <td>${bk.name } ${bk.mothod }</td>
                                    <td>${bk.cost1 }</td>
                                    <td>${bk.cost2 }</td>
                                    <td>${bk.cost3 }</td>
                                    <td>${bk.totalCost }</td>
                                    <td>${bk.waterwell }</td>
                                    <td>${bk.oilwell }</td>
                                    <td>${bk.inoil1 }</td>
                                    <td>${bk.inoil2 }</td>
                                    <td>${bk.inoil3 }</td>
                                    <td>${bk.totalInoil }</td>
                                    <td>${bk.decrate }</td>
                                    <td>${bk.balance }</td>
                                    <input type="hidden" name="C" value="${bk.totalCost }">
                                    <input type="hidden" name="sj" value="${ty.waterwell }">
                                    <input type="hidden" name="yj" value="${bk.oilwell }">
                                    <input type="hidden" name="Q" value="${bk.totalInoil }">
                                    <input type="hidden" name="djl" value="${bk.decrate }">
                                    <input type="hidden" name="QQ" value="${bk.balance }">
                                </tr>
                                <tr>
                                    <td>${ds.name } ${ds.mothod }</td>
                                    <td>${ds.cost1 }</td>
                                    <td>${ds.cost2 }</td>
                                    <td>${ds.cost3 }</td>
                                    <td>${ds.totalCost }</td>
                                    <td>${ds.waterwell }</td>
                                    <td>${ds.oilwell }</td>
                                    <td>${ds.inoil1 }</td>
                                    <td>${ds.inoil2 }</td>
                                    <td>${ds.inoil3 }</td>
                                    <td>${ds.totalInoil }</td>
                                    <td>${ds.decrate }</td>
                                    <td>${ds.balance }</td>
                                    <input type="hidden" name="C" value="${ds.totalCost }">
                                    <input type="hidden" name="sj" value="${ds.waterwell }">
                                    <input type="hidden" name="yj" value="${ds.oilwell }">
                                    <input type="hidden" name="Q" value="${ds.totalInoil }">
                                    <input type="hidden" name="djl" value="${ds.decrate }">
                                    <input type="hidden" name="QQ" value="${ds.balance }">
                                </tr>
                                <tr>
                                	<th rowspan="2"><input type="checkbox" name="sele"  name="sele" value="3">提高采收率</th>
                                    <td>${hhs.name } ${hhs.mothod }</td>
                                    <td>${hhs.cost1 }</td>
                                    <td>${hhs.cost2 }</td>
                                    <td>${hhs.cost3 }</td>
                                    <td>${hhs.totalCost }</td>
                                    <td>${hhs.waterwell }</td>
                                    <td>${hhs.oilwell }</td>
                                    <td>${hhs.inoil1 }</td>
                                    <td>${hhs.inoil2 }</td>
                                    <td>${hhs.inoil3 }</td>
                                    <td>${hhs.totalInoil }</td>
                                    <td>${hhs.decrate }</td>
                                    <td>${hhs.balance }</td>
                                    <input type="hidden" name="C" value="${hhs.totalCost }">
                                    <input type="hidden" name="sj" value="${hhs.waterwell }">
                                    <input type="hidden" name="yj" value="${hhs.oilwell }">
                                    <input type="hidden" name="Q" value="${hhs.totalInoil }">
                                    <input type="hidden" name="djl" value="${hhs.decrate }">
                                    <input type="hidden" name="QQ" value="${hhs.balance }">
                                </tr>
                               <tr>
                                    <td>${zjhw.name } ${zjhw.mothod }</td>
                                    <td>${zjhw.cost1 }</td>
                                    <td>${zjhw.cost2 }</td>
                                    <td>${zjhw.cost3 }</td>
                                    <td>${zjhw.totalCost }</td>
                                    <td>${zjhw.waterwell }</td>
                                    <td>${zjhw.oilwell }</td>
                                    <td>${zjhw.inoil1 }</td>
                                    <td>${zjhw.inoil2 }</td>
                                    <td>${zjhw.inoil3 }</td>
                                    <td>${zjhw.totalInoil }</td>
                                    <td>${zjhw.decrate }</td>
                                    <td>${zjhw.balance }</td>
                                    <input type="hidden" name="C" value="${zjhw.totalCost }">
                                    <input type="hidden" name="sj" value="${zjhw.waterwell }">
                                    <input type="hidden" name="yj" value="${zjhw.oilwell }">
                                    <input type="hidden" name="Q" value="${zjhw.totalInoil }">
                                    <input type="hidden" name="djl" value="${zjhw.decrate }">
                                    <input type="hidden" name="QQ" value="${zjhw.balance }">
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div><!--表格结束-->

				<div style="width: 100%;height: 50px;text-align: center;margin-top: 20px;">
                	 <input type="submit" id="tj" class="sapar-btn sapar-btn-recom" style="width:100px;margin: 0 auto;display:inline-block;float: none;"/>
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