<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/common/js/sapar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/iol/common/js/WdatePicker.js"></script>
<style type="text/css"> 
.file {
    position: relative;
    display: inline-block;
    background: #D0EEFF;
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: #1E88C7;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
}
.file input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.file:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
}
.a-upload {
    padding: 4px 10px;
    height: 20px;
    line-height: 20px;
    position: relative;
    cursor: pointer;
    color: #888;
    background: #fafafa;
    border: 1px solid #ddd;
    border-radius: 4px;
    overflow: hidden;
    display: inline-block;
    *display: inline;
    *zoom: 1
}
 
.a-upload  input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer
}
 
.a-upload:hover {
    color: #444;
    background: #eee;
    border-color: #ccc;
    text-decoration: none
}
</style>
</head>
<body>
    <div id="saper-container" style="width: 100%;height: 500px">
            <div class="subfiled-content" style="margin-left: 20px;margin-top: 50px;">
           	<h3 style="color: blue;">上传您的排序数据！</h3><br><br>
                   <form action="${pageContext.request.contextPath}/tool/uploadSort1.do" method="post" enctype="multipart/form-data">
					<a href="javascript:;" class="a-upload">
					    <input type="file" name="file" id="n"><sppn class="showFileName">点击这里上传文件</sppn>
					</a>
					<a href="javascript:;" class="file" id="no1">上传
					    <input type="submit" name="" >
					</a>
					<input type="submit" name="" id="aa" style="display: none;">
                   </form>
	                <div class="subfiled-style2 clearfix" style="margin-top: 30px">
                    <h2>说明</h2>
	                </div>
	               <div class="table" style="font-size: 16px;margin-top: 10px">
	               <h3 style="font-weight: 99;font-size: 16px">上传你的数据，进行排序</h3>
	                </div><!--表格结束-->
            </div>
        </div>
    </div>
<script type="text/javascript">
	$(".a-upload").change(function(){
	    var filePath=$("#n").val();
        var arr=filePath.split('\\');
        var fileName=arr[arr.length-1];
        $(".showFileName").html(fileName);
	})
</script>
</body>
<script type="text/javascript">
window.onload = function(){
        if(window.addEventListener){ 
			//alert("not ie"); 
		}else if(window.attachEvent){ 
			document.getElementById("no1").style.display='none';
			document.getElementById("aa").style.display='display';
			alert("建议使用非ie内核浏览器"); 
		}
    }
</script>
</html>