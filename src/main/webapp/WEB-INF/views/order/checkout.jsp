<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<h2>Shopping Cart</h2>
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
		<c:forEach var="p"
			items="${sessionScope['scopedTarget.cartService'].items}">
			<tr >
				<td>${p.id}</td>
				<td>${p.name}</td>
				<td>${p.price}</td>
				<td>${p.quantity}</td>
				<td >${p.quantity * p.price}</td>
				
			</tr>
		</c:forEach>
	</tbody>
</table>

<h2>Thanh toán</h2>
<h4>${message}</h4>
<form:form  action="/order/checkout" modelAttribute="order" >
	<div class="form-group">
		<label>Tên khách hàng</label>
		<form:input path="customer.id" class="form-control" />
	</div>

	<div class="form-group">
		<label>Ngày đặt</label>
		<form:input path="orderdate" class="form-control" />
	</div>
	
		
		<div class="form-group">
		<label>Địa chỉ giao hàng</label>
		<form:input path="address" class="form-control" />
	</div>

	<div class="form-group">
		<label>Tổng tiền</label>
		<form:input path="amount" class="form-control" />
	</div>

	<div class="form-group">
		<label>Ghi chú</label>
		<form:textarea path="description" row="3" class="form-control" />
	</div>


	<div class="form-group">
		<button class="btn btn-default">Đặt hàng</button>
	</div>
</form:form>
