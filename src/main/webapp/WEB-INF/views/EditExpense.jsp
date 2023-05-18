<%@page import="com.bean.StatusBean"%>
<%@page import="com.bean.AccountTypeBean"%>
<%@page import="com.bean.VendorBean"%>
<%@page import="com.bean.SubCategoryBean"%>
<%@page import="com.bean.CategoryBean"%>
<%@page import="com.bean.ExpenseBean"%>
<%@page import="com.bean.ExpenseBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Expense Manager | Edit Expense</title>
<jsp:include page="AllCss.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="AdminHeader.jsp"></jsp:include>
	<jsp:include page="UserSideBar.jsp"></jsp:include>


	<main id="main" class="main">
	<div class="pagetitle">
		<h1>Sub Expense</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="home">Home</a></li>
				<li class="breadcrumb-item">Expense</li>
				<li class="breadcrumb-item active">Edit</li>
			</ol>
		</nav>
	</div>



	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Edit Expense</h5>

						<%
							
							ExpenseBean expense = (ExpenseBean) request.getAttribute("expenseBean");
						List<CategoryBean> categoryList = (List<CategoryBean>)request.getAttribute("categoryList");
						List<SubCategoryBean> subCategoryList = (List<SubCategoryBean>)request.getAttribute("subCategoryList");
						List<VendorBean> vendorList = (List<VendorBean>)request.getAttribute("vendorList");
						List<AccountTypeBean> accountTypeList = (List<AccountTypeBean>)request.getAttribute("accountTypeList");
						List<StatusBean> statusList = (List<StatusBean>)request.getAttribute("statusList");
						%>

						<form action="updateexpense" method="post">
							<input type="hidden" name="expenseId" value="<%=expense.getExpenseId() %>"/>
						
							<div class="row mb-3">
								<label for="inputText" class="col-sm-2 col-form-label">Title
								</label>
								<div class="col-sm-6">
									<input type="text" name=""
										value="<%=expense.getTitle()%>"
										class="form-control">
								</div>
							</div>
							
							<div class="row mb-3">
								<label for="inputText" class="col-sm-2 col-form-label">Category
								</label>
								<div class="col-sm-6">
									<input type="text" name="expenseName"
										value="<%=expense.getCategoryName()%>"
										class="form-control">
								</div>
							</div>
							
							<div class="row mb-3">
								<label for="inputText" class="col-sm-2 col-form-label">Subcategory
								</label>
								<div class="col-sm-6">
									<input type="text" name="expenseName"
										value="<%=expense.getSubcategoryName()%>"
										class="form-control">
								</div>
							</div>
							
							<div class="row mb-3">
								<label for="inputText" class="col-sm-2 col-form-label">Vendor
								</label>
								<div class="col-sm-6">
									<input type="text" name="expenseName"
										value="<%=expense.getVendorName()%>"
										class="form-control">
								</div>
							</div>
							
							<div class="row mb-3">
								<label for="inputText" class="col-sm-2 col-form-label">AccountType
								</label>
								<div class="col-sm-6">
									<input type="text" name="expenseName"
										value="<%=expense.getAccountTypeName()%>"
										class="form-control">
								</div>
							</div>
							
							<div class="row mb-3">
								<label for="inputText" class="col-sm-2 col-form-label">Status
								</label>
								<div class="col-sm-6">
									<input type="text" name="expenseName"
										value="<%=expense.getStatusName()%>"
										class="form-control">
								</div>
							</div>
							
							<div class="row mb-3">
								<label for="inputText" class="col-sm-2 col-form-label">Amount
								</label>
								<div class="col-sm-6">
									<input type="text" name="expenseName"
										value="<%=expense.getAmount()%>"
										class="form-control">
								</div>
							</div>
							
							<div class="row mb-3">
								<label for="inputText" class="col-sm-2 col-form-label">Date
								</label>
								<div class="col-sm-6">
									<input type="text" name="expenseName"
										value="<%=expense.getDate()%>"
										class="form-control">
								</div>
							</div>
							
							

								<div class="row mb-3">
								<div class="col-2"></div>
								<div class="col-2">
									<button class="btn btn-primary w-100" href="updateexpense" type="submit">Update
									</button>
									
									
									
									
									
									
									
									
									
									
									
							
									</div>
								<div class="col-2">
									<a class="btn btn-danger w-100" href="listexpense"
										type="button">Cancel</a>

								</div>

							</div>



						</form>



						<!-- Table with stripped rows -->

						<br> <a href="listexpense"> <i
							class="bi bi-arrow-left"></i> BACK
						</a>

					</div>
				</div>

			</div>
		</div>
	</section>
	</main>

	
	<jsp:include page="AllJS.jsp"></jsp:include>
	<script>
		function validateExpense() {
			expenseId = document.getElementById("expenseId");
			isError = false;
			if (expenseId.value == "-1") {
				isError = true;
			}
		}
	</script>

</body>
</html>