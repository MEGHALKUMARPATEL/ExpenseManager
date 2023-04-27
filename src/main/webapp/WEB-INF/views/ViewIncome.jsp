<%@page import="com.bean.IncomeBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>View Income</h2> 

		<%
			IncomeBean categoryBean = (IncomeBean) request.getAttribute("categoryBean");
		%>
		
			<div class="row">
							<div class="col-lg-3 col-md-4 label "><b>Income Name</b></div>
							<div class="col-lg-9 col-md-8"><%=categoryBean.getIncomeName()%></div>
						</div>
						<div class="row">
							<div class="col-lg-3 col-md-4 label "><b>Income Status</b></div>
							<div class="col-lg-9 col-md-8"><%=categoryBean.getDeleted()==true?"ACTIVE":"DISABLE"%></div>
						</div>

</body>
</html> --%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Income Manager | view Income</title>
<meta content="" name="description">
<meta content="" name="keywords">



<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Tables | Income Manager | ListIncome</title>
<jsp:include page="AllCss.jsp"></jsp:include>
<meta content="" name="description">
<meta content="" name="keywords">

</head>

<body>
<jsp:include page="AdminHeader.jsp"></jsp:include>
	<jsp:include page="AdminSideBar.jsp"></jsp:include>


	<main id="main" class="main">
	<div class="pagetitle">
		<h1>Income</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="../admindashboard">Home</a></li>
				<li class="breadcrumb-item">Income</li>
				<li class="breadcrumb-item active">List</li>
			</ol>
		</nav>
	</div>


	

	<section class="section">
	
		<%
			IncomeBean incomeBean = (IncomeBean) request.getAttribute("incomeBean");
		%>
	
			<div class="row">
							<div><%=incomeBean.getTitle()%></div><br>
							<div><%=incomeBean.getAccountTypeName()%></div><br>
							<div><%=incomeBean.getAmount()%></div><br>
							<div><%=incomeBean.getDate()%></div><br>
							<div><%=incomeBean.getStatusName()%></div><br>
							<div><%=incomeBean.getDescription()%></div>
						</div>
						
		
	</section>
	</main>

<jsp:include page="AllJS.jsp"></jsp:include>
</body>

</html>