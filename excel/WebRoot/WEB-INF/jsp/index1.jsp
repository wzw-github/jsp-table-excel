<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		
  </head>
  
  <body>
 	<script type="text/javascript" src="./static/js/jszip.min.js"></script>
	<script type="text/javascript" src="./static/js/FileSaver.js"></script>
	<script type="text/javascript" src="./static/js/excel-gen.js"></script>
  	<script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
  	<script type="text/javascript">
		$(document).ready(function(){
				$("#generate-excel").click(function(){
					var excel=new ExcelGen({"src_id":"test_table","show_header":true});
					excel.generate();
				});
			});
  	</script>
  	<button type="button" id="generate-excel"> 将表格转换为Excel</button>
    <div>
    	<table id="test_table">
    		<thead>
    			<tr>
    				<th>书名</th>
    				<th>作者</th>
    				<th>出版社</th>
    				<th>页数</th>
    				<th>价格</th>
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
    					<td>${b.bookPrice }</td>
    				</tr>
    			</c:forEach>
    		</tbody>
    	</table>
    </div>
<%--     <div>
    	<c:if test="${pi.hasPreviousPage}">
			<a href="query?pageNum=1">首页</a>
			<a href="query?pageNum=${pi.pageNum-1}">上一页</a>
		</c:if>
		<c:if test="${pi.hasNextPage}">
			<a href="query?pageNum=${pi.pageNum+1}">下一页</a>
			<a href="query?pageNum=${pi.pages}">末页</a>
		</c:if>
		<span>第${pi.pageNum}页/共${pi.pages}页cvvvvvv</span>
    </div> --%>
  </body>
</html>
