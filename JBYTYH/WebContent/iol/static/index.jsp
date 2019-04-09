<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/iol/common/css/sapar.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/iol/static/css/index.css" />
<title>首页</title>
<style type="text/css">
html, body
{
    margin: 0px 0px;
    width: 100%;
    height: 100%;
}
iframe
{
    margin: 0px 0px;
    width: 100%;
    height: 100%;
}
</style>
<script type="text/javascript">
function iframeHeight() {
    document.getElementById('iframe').height="100%";
}
</script>
</head>
<body>
<div id="container">
	<div id="hd">
    	<div class="hd-wrap clearfix">
        	<div class="top-light"></div>
            <h1 class="logo"></h1>
            <ul class="main-nav clearfix">
                <li data-src="system/index.html"><a href="javascript:;">个人中心</a></li>
                <li data-src="fayx/index.html"><a href="javascript:;">方案优选</a></li>
                <li  class="current"><a href="fayh/index.jsp" target="indexIfr">方案优化</a></li>
                <li ><a href="tools/index.jsp" target="indexIfr">油藏成本评价</a></li>
                <li ><a href="sort2/index.jsp" target="indexIfr">油藏成本对比</a></li>
            </ul>
            <div class="toolbar">
                <div class="login-info clearfix">
                    <div class="welcome clearfix"><span>欢迎您,</span><a href="javascript:;" class="user-name">Admin</a></div>
                </div>
                <div class="tool main-nav clearfix" style="padding-left: 60px;">
                    <a href="system/helpindex.html" target="indexIfr" class="clearfix">点击帮助?</a>
                    <a href="javascript:;" class="quit-btn exit">退出</a>
                </div>
            </div>          
        </div>
    </div>
    <div id="bd">
     <iframe src="fayh/index.jsp" name="indexIfr" id="iframe" width="100%" height="100%" frameborder="0"></iframe>
 </div>
 </div>
    <div id="ft" class="clearfix">
    	<div class="ft-left">
            <span>绥靖油田</span>
            <em>Office&nbsp;System</em>
        </div>
        <div class="ft-right">
            <span>sj</span>
            <em>1.0&nbsp;2018</em>
        </div>
    </div>
</div>
<div class="exitDialog">
	<div class="dialog-content">
    	<div class="ui-dialog-icon"></div>
        <div class="ui-dialog-text">
        	<p class="dialog-content">你确定要退出系统？</p>
            <p class="tips">如果是请点击“确定”，否则点“取消”</p>
            <div class="buttons">
                <input type="button" class="button long2 ok" value="确定" />
                <input type="button" class="button long2 normal" value="取消" />
            </div>
        </div>
        
    </div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/common/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/common/js/sapar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/static/js/index.js"></script>
</html>
