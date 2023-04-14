<%@page import="com.bean.CategoryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ExpenseManager | List Category</title>
</head>
<body>
	<h3>List Category</h3>
	
	<%
		List<CategoryBean> list = (List<CategoryBean>)request.getAttribute("list");
	%>


<table border="1">

	<tr>
		<th>CategoryId</th>
		<th>CategoryName</th>
		<th>Deleted</th>
		<th>Action</th>
	</tr>

<% for(CategoryBean cb:list){ %>
	<tr>
		<td><%=cb.getCategoryId() %></td>
		<td><%=cb.getCategoryName() %></td>
		<td><%=cb.getDeleted() %></td>
		<td><a href="deletecategory/<%=cb.getCategoryId() %>">Delete</a></td>
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

<title>Expense Manager | ListCategory</title>
<meta content="" name="description">
<meta content="" name="keywords">



<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Tables | Expense Manager | ListCategory</title>
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


	<%
		List<CategoryBean> list = (List<CategoryBean>) request.getAttribute("list");
	%>

	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">List Category</h5>


						<!-- Table with stripped rows -->
						 
							<div class="datatable-container">
								<table class="table datatable" id="listcategory">
									<thead>
										<tr>
											<th>CategoryId</th>
											<th>CategoryName</th>
											<th>Deleted?</th>
											<th>Action</th>
										</tr>
									</thead>
								<tbody>
									<%
										for (CategoryBean cb : list) {
									%>
									<tr>
										 
										<td><%=cb.getCategoryName()%></td>
										<td>
											<div class="form-check form-switch">


												<input class="form-check-input" onclick="changeStatus(<%=cb.getCategoryId()%>,<%=cb.getDeleted() %>)" type="checkbox"
													id="flexSwitchCheckChecked"
													<%=!cb.getDeleted() ? "checked" : ""%>>

											</div>
										</td>
										<td><a
											href="viewcategory?categoryId=<%=cb.getCategoryId()%>"><i class="bi bi-eye"></i>   </a>
											|
											
										<a
											href="editcategory?categoryId=<%=cb.getCategoryId()%>"><i class="bi bi-pencil"></i>   </a>
											
											</td>
									</tr>

									<%
										}
									%>
								</tbody>
								</table>
								<a href="newcategory"><i class="bi bi-plus-circle-fill fs-2" style="size: 250px"></i>Add New Category</a>
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