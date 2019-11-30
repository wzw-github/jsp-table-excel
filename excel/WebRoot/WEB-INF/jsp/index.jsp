<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">

	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>jQuery网页表格导出Excel文件</title>
		<link rel="stylesheet" href="https://www.jq22.com/jquery/bootstrap-3.3.4.css">
		<link rel="stylesheet" href="https://www.jq22.com/jquery/font-awesome.4.6.0.css">
	</head>

	<body>
	<button type="button" id="generate-excel"> 将表格转换为Excel</button>
    <div>
    	<a href="goAdd">新增新书</a>
    	<table id="test_table">
    		<thead>
    			<tr>
    				<th>书名</th>
    				<th>作者</th>
    				<th>出版社</th>
    				<th>页数</th>
    				<th>价格</th>
    			</tr>
    		</thead>
    		<tbody>
    			<c:forEach items="${bList }" var="b">
    				<tr>
    					<td>${b.bookName }</td>
    					<td>${b.bookAuthor }</td>
    					<td>${b.bookPublish }</td>
    					<td>${b.bookPage }</td>
    					<td>${b.bookPrice }</td>
    				</tr>
    			</c:forEach>
    		</tbody>
    	</table>
    </div>
    <div>
    	<c:if test="${pi.hasPreviousPage}">
			<a href="query?pageNum=1">首页</a>
			<a href="query?pageNum=${pi.pageNum-1}">上一页</a>
		</c:if>
		<c:if test="${pi.hasNextPage}">
			<a href="query?pageNum=${pi.pageNum+1}">下一页</a>
			<a href="query?pageNum=${pi.pages}">末页</a>
		</c:if>
		<span>第${pi.pageNum}页/共${pi.pages}页cvvvvvv</span>
    </div>

	</body>
		<!--<script src="js/jquery-1.js"></script>-->
		<script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
		<script>
			$(document).ready(function(){
				$("#generate-excel").click(function(){
					var excel=new ExcelGen({"src_id":"test_table","show_header":true});
					excel.generate();
				});
			});
		</script>
		<script type="text/javascript" src="./static/js/jszip.min.js"></script>
		<script type="text/javascript" src="./static/js/FileSaver.js"></script>
		<script type="text/javascript" src="./static/js/excel-gen.js"></script>
</html>