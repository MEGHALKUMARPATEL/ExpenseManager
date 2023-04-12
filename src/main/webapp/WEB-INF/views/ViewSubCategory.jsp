<%@page import="com.bean.SubCategoryBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>View Sub Category</h2>

		<%
			SubCategoryBean subCategoryBean = (SubCategoryBean) request.getAttribute("subCategoryBean");
		%>
		
		SubCategoryId :  <%=subCategoryBean.getSubCategoryId() %><br><br>
		CategoryId  :<%=subCategoryBean.getCategoryId() %> <br><br>
		SubCategoryName : <%=subCategoryBean.getSubCategoryName() %><br><br>
		CategoryName : <%=subCategoryBean.getCategoryName() %><br><br>
		Deleted :  <%=subCategoryBean.isDeleted() %>

</body>
</html>