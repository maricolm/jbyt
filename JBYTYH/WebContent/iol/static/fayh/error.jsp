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
        <div id="saper-bd">
            <div class="subfiled-content">
                <div class="search-box">
                <div class="table">
                    <!--表格具体内容-->
                    <h1>错误页面</h1>
                    <div class="table-box">
                        对不起，您有一个错误，请检查你的参数是否全部正确！
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