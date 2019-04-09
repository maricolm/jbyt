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
<title>结果</title>
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
           	<h3 style="color: blue;">上传您的优选数据！</h3><br><br>
                   <form action="${pageContext.request.contextPath}/mix/upload.do" method="post" enctype="multipart/form-data">
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
	               <h3 style="font-weight: 99;font-size: 16px">措施方案组合的优化决策分成两个部分：</h3>
	                	<ol>
	                		<li>1、限定投资总额下的方案组合的优化决策
油田可以根据当年的生产预算来确定每年的投资总额，在投资总额一定的情况下，以经济效益最大化为目标，建立措施方案组合的优化模型。油田投资计划分为单年投资计划和多年投资计划，本项目针对投资计划及在多年投资计划中措施实施年限是否等于投资年限，在投资总额一定的情况下，以经济效益最大化为目标建立了2类优化模型。。</li>
	                		<li>2、最优方案组合的最少投资总额的确定
在一定投资总额范围内，经济效益最大化的措施方案组合优化结果不唯一（即在同一最大经济效益值下，措施方案组合的结果可能有多种），分别计算出经济效益最大的各个措施方案组合下的成本，把措施方案组合总成本最小的成本作为投资总额。
以上两部分的研究，既达到了经济效益最大化，又保证了投入成本最少的目的。</li>
	                	</ol>
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