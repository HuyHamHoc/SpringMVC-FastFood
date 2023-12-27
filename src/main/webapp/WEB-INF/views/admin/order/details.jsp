<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<table class="table table-hover">
	<thead>
		<tr>
			<th>Id</th>
			<th>Khách hàng</th>
			<th>Giá</th>
			<th>Số lượng</th>
			<th>Tổng tiền</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="e" items="${details}">
			<tr>
				<td>${e.product.id}</td>
				<td>${e.product.name}</td>
				<td>${e.price}</td>
				<td>${e.quantity}</td>
				<td>${e.price*e.quantity}</td>			
			</tr>
		</c:forEach>
	</tbody>
</table>