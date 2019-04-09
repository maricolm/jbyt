<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/iol/common/css/sapar.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/iol/static/css/index_inner.css" />
<link rel="stylesheet" href="css/navThree.css" />
<script src="${pageContext.request.contextPath}/iol/static/fayh/js/navThree.js"></script>
<title>优化</title>
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
    <div id="bd">
    	<div class="wrap clearfix">
        	<div class="sidebar" >
            	<h2 class="sidebar-header"><p>优化模型</p></h2>
            		<div id="menu" class="nav" style="overflow: hidden;">
            			<h1 onClick="javascript:ShowMenu(this,'NO0')"> - 单模型</h1>
								<span id="NO0" class="no">
								   <h3 onClick="javascript:ShowMenu(this,'NO00')"> 
								   		<a href="${pageContext.request.contextPath}/yh/getPublicParaData.do?year=1"  target="iframe">1年</a>
								   </h3>
								   <h3 onClick="javascript:ShowMenu(this,'NO01')">
								   		<a href="${pageContext.request.contextPath}/yh/getPublicParaData.do?year=2"  target="iframe">2年</a>
								   </h3>
								   <h3 onClick="javascript:ShowMenu(this,'NO02')">
								   		<a href="${pageContext.request.contextPath}/yh/getPublicParaData.do?year=3"  target="iframe">3年</a>
								   </h3>
								   <h3 onClick="javascript:ShowMenu(this,'NO03')">
								   		<a href="${pageContext.request.contextPath}/yh/getPublicParaData.do?year=4"  target="iframe">4年</a>
								   </h3>
								   <h3 onClick="javascript:ShowMenu(this,'NO04')">
								   		<a href="${pageContext.request.contextPath}/yh/getPublicParaData.do?year=5"  target="iframe">5年</a>
								   </h3>
								</span>
							</h1>
					    <!--mean 结束-->
						<h1 onClick="javascript:ShowMenu(this,'NO1')"> - 混合模型</h1>
							<span id="NO1" class="no">
							   <h3 onClick="javascript:ShowMenu(this,'NO10')"> 
							   		<a href="${pageContext.request.contextPath}/mix/getMixPublicParaData.do?year=2"  target="iframe">2年</a>
							   </h3>
							   <h3 onClick="javascript:ShowMenu(this,'NO11')">
							   		<a href="${pageContext.request.contextPath}/mix/getMixPublicParaData.do?year=3"  target="iframe">3年</a>
							   </h3>
							   <h3 onClick="javascript:ShowMenu(this,'NO12')">
							   		<a href="${pageContext.request.contextPath}/mix/getMixPublicParaData.do?year=4"  target="iframe">4年</a>
							   </h3>
							   <h3 onClick="javascript:ShowMenu(this,'NO13')">
							   		<a href="${pageContext.request.contextPath}/mix/getMixPublicParaData.do?year=5"  target="iframe">5年</a>
							   </h3>
							</span>
						</h1>
					    </div>
					    <!--mean 结束-->
            </div>
            <div class="content" id="temp">
            	<iframe src="upload.jsp" id="iframe" name="iframe" width="100%" height="100%" frameborder="0"></iframe>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/common/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/common/js/sapar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/static/js/index_inner.js"></script>
<script type="text/javascript">
window.onload = function(){
        if(window.addEventListener){ 
			//alert("not ie"); 
		}else if(window.attachEvent){ 
			document.getElementById("temp").style.height='500px';; 
		}
    }
</script>
</html>
