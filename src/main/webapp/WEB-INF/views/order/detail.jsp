<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<h2>Thông tin hóa đơn</h2>
<h4>${message}</h4>
<form:form  action="/order/checkout" modelAttribute="order" >
	<div class="form-group">
		<label>Id</label>
		<form:input path="id" class="form-control" readonly="true" />
	</div>

	<div class="form-group">
		<label>Tên khách hàng</label>
		<form:input path="customer.id" class="form-control" readonly="true"/>
	</div>

	<div class="form-group">
		<label>Ngày đặt</label>
		<form:input path="orderdate" class="form-control" readonly="true"/>
	</div>
	
		
		<div class="form-group">
		<label>Địa chỉ giao hàng</label>
		<form:input path="address" class="form-control" readonly="true"/>
	</div>

	<div class="form-group">
		<label>Tổng tiền</label>
		<form:input path="amount" class="form-control" readonly="true"/>
	</div>

	<div class="form-group">
		<label>Ghi chú</label>
		<form:textarea path="description" row="3" class="form-control" readonly="true"/>
	</div>


	
</form:form>

<h2>Chi tiết hóa đơn</h2>
<table class="table">
	<thead>
		<tr>
			<th>Id</th>
			<th>Tên sản phẩm</th>
			<th>Giá</th>
			<th>Số lượng</th>
			<th>Tổng tiền</th>
			
		</tr>
	</thead>
	<tbody>
		<c:forEach var="d"
			items="${details}">
			<tr >
				<td>${d.product.id}</td>
				<td>${d.product.name}</td>
				<td>${d.price}</td>
				<td>${d.quantity}</td>
				<td >${d.quantity * d.price}</td>
				
			</tr>
		</c:forEach>
	</tbody>
</table>