<%@page import="com.bean.CategoryBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>View Category</h2> 

		<%
			CategoryBean categoryBean = (CategoryBean) request.getAttribute("categoryBean");
		%>
		
			<div class="row">
							<div class="col-lg-3 col-md-4 label "><b>Category Name</b></div>
							<div class="col-lg-9 col-md-8"><%=categoryBean.getCategoryName()%></div>
						</div>
						<div class="row">
							<div class="col-lg-3 col-md-4 label "><b>Category Status</b></div>
							<div class="col-lg-9 col-md-8"><%=categoryBean.getDeleted()==true?"ACTIVE":"DISABLE"%></div>
						</div>

</body>
</html> --%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Expense Manager | ListCategory</title>
<meta content="" name="description">
<meta content="" name="keywords">



<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Tables / Expense Manager | ListCategory</title>
<jsp:include page="AllCss.jsp"></jsp:include>
<meta content="" name="description">
<meta content="" name="keywords">

</head>

<body>
<jsp:include page="AdminHeader.jsp"></jsp:include>
	<jsp:include page="AdminSideBar.jsp"></jsp:include>


	<main id="main" class="main">
	<div class="pagetitle">
		<h1>Category</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="../admindashboard">Home</a></li>
				<li class="breadcrumb-item">Category</li>
				<li class="breadcrumb-item active">List</li>
			</ol>
		</nav>
	</div>


	

	<section class="section">
	
		<%
			CategoryBean categoryBean = (CategoryBean) request.getAttribute("categoryBean");
		%>
		
			<div class="row">
							<div class="col-lg-3 col-md-4 label "><b>Category Name</b></div>
							<div class="col-lg-9 col-md-8"><%=categoryBean.getCategoryName()%></div>
						</div>
						<div class="row">
							<div class="col-lg-3 col-md-4 label "><b>Category Status</b></div>
							<div class="col-lg-9 col-md-8"><%=categoryBean.getDeleted()%></div>
						</div>
		
	</section>
	</main>

<jsp:include page="AllJS.jsp"></jsp:include>
</body>

</html>