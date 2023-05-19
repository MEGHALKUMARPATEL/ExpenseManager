<%@page import="java.util.Calendar"%>
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
						<%ExpenseBean expenseBean = (ExpenseBean)request.getAttribute("expenseBean"); %>
						<form action="updateexpense" method="post">
							<input type="hidden" name="expenseId" value="<%=expense.getExpenseId() %>"/>
						
							<div class="row mb-3">
								<label for="inputText" class="col-sm-2 col-form-label">Title
								</label>
								<div class="col-sm-6">
									<input type="text" name="title"
										value="<%=expense.getTitle()%>"
										class="form-control">
								</div>
							</div>
							
							<div class="row mb-3">
								<label for="inputText" class="col-sm-2 col-form-label">Category
								</label>
								<div class="col-sm-6">
									 <select name="categoryId" class="form-control form-control-lg">
											 <option value="${expenseBean.categoryId}" >${expenseBean.categoryName}</option>
											 <%System.out.println("catgory for edit"+expenseBean.getCategoryId()); %>
												<% 
													for(CategoryBean cb:categoryList){ %>
														<option value=""><%=cb.getCategoryName() %></option>
														<%} %>	
													</select>
								</div>
							</div>
							
							<div class="row mb-3">
								<label for="inputText" class="col-sm-2 col-form-label">Subcategory
								</label>
								<div class="col-sm-6">
									 <select name="subCategoryId" class="form-control form-control-lg">
										 <option value="${expenseBean.subCategoryId }">${expenseBean.subcategoryName}</option>
											<% for(SubCategoryBean sb:subCategoryList){ %>
													<option value="<%=sb.getSubCategoryId()%>"><%=sb.getSubCategoryName() %></option>
													<%} %>	
													</select>
								</div>
							</div>
							
							<div class="row mb-3">
								<label for="inputText" class="col-sm-2 col-form-label">Vendor
								</label>
								<div class="col-sm-6">
									<select name="vendorId" class="form-control form-control-lg">
											 <option value="${expenseBean.vendorId }">${expenseBean.vendorName }</option>
												<% 
													for(VendorBean vb:vendorList){ %>
														<option value="<%=vb.getVendorId()%>"><%=vb.getVendorName() %></option>
														<%} %>	
													</select>
								</div>
							</div>
							
							<div class="row mb-3">
								<label for="inputText" class="col-sm-2 col-form-label">AccountType
								</label>
								<div class="col-sm-6">
									<select name="accountTypeId" class="form-control form-control-lg">
											 <option value="${expenseBean.accountTypeId }">${expenseBean.accountTypeName }</option>
												<% 
													for(AccountTypeBean ab:accountTypeList){ %>
														<option value="<%=ab.getAccountTypeId()%>"><%=ab.getAccountTypeName() %></option>
														<%} %>	
													</select>
								</div>
							</div>
							
							<div class="row mb-3">
								<label for="inputText" class="col-sm-2 col-form-label">Status
								</label>
								<div class="col-sm-6">
									<select name="statusId" class="form-control form-control-lg">
											 <option value="${expenseBean.statusId }">${expenseBean.statusName }</option>
												<% 
													for(StatusBean sb:statusList){ %>
														<option value="<%=sb.getStatusId()%>"><%=sb.getStatusName() %></option>
														<%} %>	
													</select>
								</div>
							</div>
							
							<div class="row mb-3">
								<label for="inputText" class="col-sm-2 col-form-label">Amount
								</label>
								<div class="col-sm-6">
									<input type="text" name="amount"
										value="<%=expense.getAmount()%>"
										class="form-control">
								</div>
							</div>
							
							<%
											Calendar c = Calendar.getInstance(); 
											int d = c.get(c.DAY_OF_MONTH); //07 
											int m = c.get(c.MONTH)+1;//03
											String mon = "";
											String dt = "";
											if(m<=9){
												mon = 0+""+m; 
											}else{
												mon = m+"";
											}
											if(d <= 9){
												dt = 0+""+d;
											}else{
												dt = d+"";
											}
											int y = c.get(c.YEAR);//2023 
											System.out.println(y+"-"+m+"-"+d);
										%>	
							
							<div class="row mb-3">
								<label for="inputText" class="col-sm-2 col-form-label">Date
								</label>
								<div class="col-sm-6">
									<input type="date" name="date"
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