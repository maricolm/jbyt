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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/iol/static/fayh/css/fayx_step.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/common/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/ommon/js/sapar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/common/js/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/static/fayh/js/verifynull.js" ></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/iol/static/fayh/css/css.css" />
<title>输入公告参数</title>
</head>

<body>
    <div id="saper-container">
        <div id="saper-hd"></div>
        <div id="saper-bd">
            <div class="head">
	        	<div class="head1">参数输入</div>
				<div class="head2">结果显示</div>
       		</div>
            <div class="subfiled-content">
                <form name="f1" id="f1" action="${pageContext.request.contextPath}/mix/getTwoList.do" method="post">
                	<input name="year" type="hidden" value="${year }"/>
                    <div class="search-box clearfix">
                        <div class="content">
                            <div class="kv-item clearfix">
                                <label></label>
                                <div class="kv-item-content" style="text-align: center;">
                                    <h3 style="color: red">${year }混合模型</h3>
                                </div>
                            </div>
                            <div class="kv-item clearfix">
                                <label>油价：</label>
                                <div class="kv-item-content">
                                    <input type="text" value="0.35" id="t1" name="a">&nbsp;万
                                    <small style="color: red"></small>
                                </div>
                                
                            </div>
                            <div class="kv-item clearfix">
                                <label>吨油操作成本：</label>
                                <div class="kv-item-content">
                                    <input type="text" name="b" value="0.08"  id="t2">&nbsp;吨
                                    <small style="color: red"></small>
                                </div>
                            </div>
                            <div class="kv-item clearfix">
                                <label>增油折现率：</label>
                                <div class="kv-item-content">
                                    <input type="text" value="-0.1" name="rate" id="t3">
                                    <small style="color: red"></small>
                                </div>
                            </div>
                            <div class="kv-item clearfix">
                                <label>基础增油产量：</label>
                                <div class="kv-item-content">
                                    <input type="text" value="52000" name="c" id="t4">&nbsp;吨
                                    <small style="color: red"></small>
                                </div>
                            </div>
                            <div class="kv-item clearfix">
                                <label>投资总额：</label>
                                <div class="kv-item-content">
                                    <input type="text" name="investment" id="t5">&nbsp;万
                                    <small style="color: red"></small>
                                </div>
                            </div>
                            <div class="kv-item clearfix">
                                <label></label>
                                <div class="kv-item-content">
                                    <input class="sapar-btn sapar-btn-recom query-btn" type="submit" value="下一步" id="stpe1">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <div class="subfiled-style2 clearfix">
                    <h2>说明</h2>
                </div>
               <div class="table" style="font-size: 16px">
                	<ol>
                		<li>1、本页面需要您输入评价所需的前置条件，包含了折现率、增油折算率、油价、汇率、吨油操作成本和油井使用寿命。每一个参数设置都会直接影响到评价结果。</li>
                		<li>2、其中：投资总额是本油田当年开发计划中所确定的措施总投资。</li>
                	</ol>
                </div><!--表格结束-->
            </div>
        </div>
        <div id="saper-ft"></div>
    </div>
</body>
</html>