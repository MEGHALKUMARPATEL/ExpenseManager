<%@page import="com.bean.IncomeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title> 
</head>
<body>
<h2>Income Added successfully</h2>

	<%
		List<IncomeBean> incomelist = (List<IncomeBean>)request.getAttribute("incomelist");
	%>

	<table border="1">

	<tr>
		<th>IncomeId</th>
		<th>Title</th>
		<th>AccountTypeId</th>
		<th>StatusId</th>
		<th>UserId</th>
		<th>Amount</th>
		<th>Date</th>
		<th>Description</th>
		
	</tr>

<% for(IncomeBean ib:incomelist){ %>
	<tr>
		<td><%=ib.getIncomeId() %></td>
		<td><%=ib.getTitle() %></td>
		<td><%=ib.getAccountTypeId() %></td>
		<td><%=ib.getStatusId() %></td>
		<td><%=ib.getUserId() %></td>
		<td><%=ib.getAmount() %></td>
		<td><%=ib.getDate() %></td>
		<td><%=ib.getDescription() %></td>
	</tr>
	
	<%} %>
	
</table>
<br><br>
<a href="addexpensejsp">AddNewIncome</a> 
</body>
</html> --%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Expense Manager | ListIncome</title>
<meta content="" name="description">
<meta content="" name="keywords">



<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Tables / Expense Manager | ListIncome</title>
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
				<li class="breadcrumb-item active">Income</li>
			</ol>
		</nav>
	</div>


	<%
		List<IncomeBean> incomelist = (List<IncomeBean>) request.getAttribute("incomelist");
	%>

	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">List Income</h5>


						<!-- Table with stripped rows -->
						 
							<div class="datatable-container">
								<table class="table datatable" id="listincome">
									<thead>
										<tr>
										<th>Title</th>
											<th>Amount</th>
											<th>Date</th>
											<th>View Detail</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
									<%
											for(IncomeBean ib:incomelist){
										%>
											<tr>
												<td class="formcss" align="center" ><%=ib.getIncomeId()%></td>
											<td class="formcss" align="center" ><%=ib.getTitle()%></td>
											<td class="formcss" align="center"><%=ib.getAmount()%></td>
											<td class="formcss" align="center"><%=ib.getDate()%></td>
										
											<td  align="center"><a class="btn btn-link text-gradient px-3 mb-0"
												href="viewincome?incomeId=<%=ib.getIncomeId()%>"><i class="bi bi-eye"></i> View</td>
												
													<td>	<a
											href="editincome?incomeId=<%=ib.getIncomeId()%>"><i class="bi bi-pencil"></i> Edit
											</td>
											  </a>
											
											 <td  align="center"><a class="btn btn-link text-danger text-gradient px-3 mb-0"
												href="deleteincome/<%=ib.getIncomeId()%>"><i class="bi bi-trash text-danger"></i>Delete</td>
										</tr>
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

