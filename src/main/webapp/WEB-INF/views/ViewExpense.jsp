<%@page import="com.bean.ExpenseBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>View Expense</h2> 

		<%
			ExpenseBean categoryBean = (ExpenseBean) request.getAttribute("categoryBean");
		%>
		
			<div class="row">
							<div class="col-lg-3 col-md-4 label "><b>Expense Name</b></div>
							<div class="col-lg-9 col-md-8"><%=categoryBean.getExpenseName()%></div>
						</div>
						<div class="row">
							<div class="col-lg-3 col-md-4 label "><b>Expense Status</b></div>
							<div class="col-lg-9 col-md-8"><%=categoryBean.getDeleted()==true?"ACTIVE":"DISABLE"%></div>
						</div>

</body>
</html> --%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Expense Manager | view Expense</title>
<meta content="" name="description">
<meta content="" name="keywords">



<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Tables | Expense Manager | ListExpense</title>
<jsp:include page="AllCss.jsp"></jsp:include>
<meta content="" name="description">
<meta content="" name="keywords">

</head>

<body>
<jsp:include page="AdminHeader.jsp"></jsp:include>
	<jsp:include page="UserSideBar.jsp"></jsp:include>


	<main id="main" class="main">
	<div class="pagetitle">
		<h1>Expense</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="../admindashboard">Home</a></li>
				<li class="breadcrumb-item">Expense</li>
				<li class="breadcrumb-item active">List</li>
			</ol>
		</nav>
	</div>


	

	<section class="section">
	
		<%
			ExpenseBean expenseBean = (ExpenseBean) request.getAttribute("expenseBean");
		%>
	
			<div class="row">
							<div><%=expenseBean.getTitle()%></div><br>
							<div><%=expenseBean.getAccountTypeName()%></div><br>
							<div><%=expenseBean.getCategoryName()%></div><br>
							<div><%=expenseBean.getSubcategoryName()%></div><br>
							<div><%=expenseBean.getAmount()%></div><br>
							<div><%=expenseBean.getDate()%></div><br>
							<div><%=expenseBean.getStatusName()%></div><br>
							<div><%=expenseBean.getVendorName()%></div><br>
							<div><%=expenseBean.getDescription()%></div>
						</div>
						
		
	</section>
	</main>

<jsp:include page="AllJS.jsp"></jsp:include>
</body>

</html>