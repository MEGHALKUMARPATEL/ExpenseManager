<%@page import="com.bean.ExpenseBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense Manager | List Expense</title>
</head>
<body>

	<%
		List<ExpenseBean> expenselist = (List<ExpenseBean>)request.getAttribute("expenselist");
	%>

	<table border="1">

	<tr>
		<th>ExpenseId</th>
		<th>Title</th>
		<th>CategoryId</th>
		<th>SubCategoryId</th>
		<th>VendorId</th>
		<th>AccountTypeId</th>
		<th>StatusId</th>
		<th>UserId</th>
		<th>Amount</th>
		<th>Date</th>
		<th>Description</th>
		
	</tr>

<% for(ExpenseBean eb:expenselist){ %>
	<tr>
		<td><%=eb.getCategoryId() %></td>
		<td><%=eb.getTitle() %></td>
		<td><%=eb.getCategoryId() %></td>
		<td><%=eb.getSubCategoryId() %></td> 
		<td><%=eb.getVendorId() %></td>
		<td><%=eb.getAccountTypeId() %></td>
		<td><%=eb.getStatusId() %></td>
		<td><%=eb.getUserId() %></td>
		<td><%=eb.getAmount() %></td>
		<td><%=eb.getDate() %></td>
		<td><%=eb.getDescription() %></td>
		
	</tr>
	
	<%} %>
	
</table>
<br><br>
<a href="addexpensejsp">AddNewExpense</a> 

</body>
</html>  --%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Expense Manager | ListExpense</title>
<meta content="" name="description">
<meta content="" name="keywords">



<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Tables / Expense Manager | ListExpense</title>
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
				<li class="breadcrumb-item"><a href="userdashboard">Dashboard </a></li>
				<li class="breadcrumb-item">List</li>
				<li class="breadcrumb-item active">Expense</li>
			</ol>
		</nav>
	</div>


	<%
		List<ExpenseBean> expenselist = (List<ExpenseBean>) request.getAttribute("expenselist");
	%>

	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">List Expense</h5>


						<!-- Table with stripped rows -->
						 
							<div class="datatable-container">
								<table class="table datatable" id="listexpense">
									<thead>
										<tr>
											<th class="formheadcss">Title</th>
											<th class="formheadcss">Amount</th>
											<th class="formheadcss">Date</th>
											<th class="formheadcss">View Detail</th>
											<th class="formheadcss">Edit Detail</th>
										</tr>
									</thead>
									<tbody>
										<%
										 for(ExpenseBean eb : expenselist){
										%>
										<tr>
											<td class="formcss" align="center" ><%=eb.getTitle()%></td>
											<td class="formcss" align="center"><%=eb.getAmount()%></td>
											<td class="formcss" align="center"><%=eb.getDate()%></td>
										
											<td  align="center"><a class="btn btn-link text-gradient px-3 mb-0"
												href="viewexpense?expenseId=<%=eb.getExpenseId()%>"><i class="bi bi-eye"></i> View</td>
												
													<td>	<a
											href="editexpense?expenseId=<%=eb.getExpenseId()%>"><i class="bi bi-pencil"></i> Edit
											</td>
											  </a>
											
											
										<%
										}
										%>

										
									</tbody>
								</table>
							</div>
						 

					</div>
				</div>
 
			</div>
		</div>
	</section>
	</main>

<jsp:include page="AllJS.jsp"></jsp:include>
</body>

</html>

