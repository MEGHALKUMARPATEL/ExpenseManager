<%@page import="com.bean.AccountTypeBean"%>
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
	
	<h3>List Status</h3>
	
	<%
		List<AccountTypeBean> list = (List<AccountTypeBean>)request.getAttribute("list");
	%>
	
	<table border="1">

	<tr>
		<th>AccountTypeId</th>
		<th>AccountType</th>
		<th>Deleted</th>
		<th>Action</th>
	</tr>

       <% for(AccountTypeBean ab:list){ %>
	<tr>
		<td><%=ab.getAccountTypeId() %></td>
		<td><%=ab.getAccountTypeName() %></td>
		<td><%=ab.isDeleted() %></td>
		<td><a href="deletevendor/<%=ab.getAccountTypeID)%>%">Delete</a></td>
	
		
	</tr>
	
	<%} %>
	
</table>
<br><br>
<a href="subcategories">Sub Category</a> 
</body>
</html> --%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Expense Manager | ListAccountType</title>
<meta content="" name="description">
<meta content="" name="keywords">



<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Tables / Expense Manager | ListAccountType</title>
<jsp:include page="AllCss.jsp"></jsp:include>
<meta content="" name="description">
<meta content="" name="keywords">

</head>

<body>
<jsp:include page="AdminHeader.jsp"></jsp:include>
	<jsp:include page="AdminSideBar.jsp"></jsp:include>


	<main id="main" class="main">
	<div class="pagetitle">
		<h1>AccountType</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
				<li class="breadcrumb-item">AccountType</li>
				<li class="breadcrumb-item active">List</li>
			</ol>
		</nav>
	</div>


	<%
		List<AccountTypeBean> list = (List<AccountTypeBean>) request.getAttribute("list");
	%>

	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">List AccountType</h5>


						<!-- Table with stripped rows -->
						 
							<div class="datatable-container">
								<table class="table datatable" id="listaccounttype">
									<thead>
										<tr>
											<th>AccountTypeId</th>
											<th>AccountTypeName</th>
											<th>Deleted?</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (AccountTypeBean cb : list) {
										%>
										<tr>
											<td><%=cb.getAccountTypeId()%></td>
											<td><%=cb.getAccountTypeName()%></td>
											<td><%=cb.isDeleted()%></td>
											<td><a href="deleteaccounttype/<%=cb.getAccountTypeId()%>">Delete</a>
												| <a href="viewaccounttype/<%=cb.getAccountTypeId()%>">View</a></td>
										</tr>

										<%
											}
										%>
									</tbody>
								</table>
								<a href="accounttype"><i class="bi bi-plus-circle-fill fs-2" style="size: 250px"></i>Add New AccountType</a>
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