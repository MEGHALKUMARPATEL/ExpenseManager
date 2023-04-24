<%@page import="com.bean.SubCategoryBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>List Sub Category</h3>
	
	<%
		List<SubCategoryBean> list = (List<SubCategoryBean>)request.getAttribute("list");
	%>


<table border="1">

	<tr>
		<th>Sub CategoryId</th>
		<th>CategoryID</th>
		<th>Sub CategoryName</th>
		<th>Deleted</th>
		<th>Action</th>
	</tr>

<% for(SubCategoryBean cb:list){ %>
	<tr>
		<td><%=cb.getSubCategoryId() %></td>
		<td><%=cb.getCategoryId() %></td>
		<td><%=cb.getSubCategoryName() %></td>
		<td><%=cb.isDeleted() %></td>
		<td><a href="deletesubcategory/<%=cb.getSubCategoryId() %>">Delete</a></td>
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

<title>Expense Manager | ListSubCategory</title>
<meta content="" name="description">
<meta content="" name="keywords">



<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Tables | Expense Manager | ListSubCategory</title>
<jsp:include page="AllCss.jsp"></jsp:include>
<meta content="" name="description">
<meta content="" name="keywords">

</head>

<body>
<jsp:include page="AdminHeader.jsp"></jsp:include>
	<jsp:include page="AdminSideBar.jsp"></jsp:include>


	<main id="main" class="main">
	<div class="pagetitle">
		<h1>SubCategory</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="../admindashboard">Home</a></li>
				<li class="breadcrumb-item">SubCategory</li>
				<li class="breadcrumb-item active">List</li>
			</ol>
		</nav>
	</div>


	<%
		List<SubCategoryBean> list = (List<SubCategoryBean>) request.getAttribute("list");
	%>

	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">List SubCategory</h5>


						<!-- Table with stripped rows -->
						 
							<div class="datatable-container">
								<table class="table datatable" id="listsubcategory">
									<thead>
										<tr>
											
											<th>SubCategoryName</th>
											<th>Category Name</th>
											<th>Action</th>
										</tr>
									</thead>
								<tbody>
									<%
										for (SubCategoryBean sb : list) {
									%>
									<tr>
										<td><%=sb.getSubCategoryName()%></td>
										<td><%=sb.getCategoryName()%>
										<td>
										
										
										<a href="editsubcategory?subCategoryId=<%=sb.getSubCategoryId() %>"><i class="bi bi-pencil text-primary"></i> Edit</a> | 
										<a href="deletesubcategory/<%=sb.getSubCategoryId()%>"><i class="bi bi-trash text-danger"></i> Delete</a>
										</td>
									</tr>
									<%
										}
									%>
								</tbody>
								</table>
								<a href="subcategories"><i class="bi bi-plus-circle-fill fs-2" style="size: 250px"></i>Add New Sub Category</a>
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