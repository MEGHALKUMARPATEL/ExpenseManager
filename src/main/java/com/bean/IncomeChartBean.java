package com.bean;

public class IncomeChartBean {

		private String userId;
		private String month;
		private Long incomeAmount;
		
		
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getMonth() {
			return month;
		}
		public void setMonth(String month) {
			this.month = month;
		}
		public Long getIncomeAmount() {
			return incomeAmount;
		}
		public void setIncomeAmount(Long incomeAmount) {
			this.incomeAmount = incomeAmount;
		}
		
}
