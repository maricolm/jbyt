<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="../../common/css/sapar.css" />
<link rel="stylesheet" href="../css/index_inner.css" />
<link rel="stylesheet" href="css/navThree.css" />
<script src="js/navThree.js"></script>
<title>排序</title>
</head>

<body>
<div id="container">
    <div id="bd">
    	<div class="wrap clearfix">
        	<div class="sidebar" >
            	<h2 class="sidebar-header"><p>tools</p></h2>
            		<div id="menu" class="nav" style="overflow: hidden;">
            			<h1> <a href="${pageContext.request.contextPath}/tool/findAll.do" target="iframe">经营评价排序</a></h1>
            </div>
         </div>  
         <div class="content">
            	<iframe src="uploadsort1.jsp" id="iframe" name="iframe" width="100%" height="100%" frameborder="0"></iframe>
         </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../../common/js/jquery.js"></script>
<script type="text/javascript" src="../../common/js/sapar.js"></script>
<script type="text/javascript" src="../js/index_inner.js"></script>
</html>
