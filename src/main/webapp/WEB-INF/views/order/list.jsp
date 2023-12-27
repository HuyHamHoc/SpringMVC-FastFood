<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<h2>Danh sách hóa đơn</h2>
<table class="table">
	<thead>
		<tr>
			<th>Id</th>
			<th>Ngày đặt</th>
			<th>Địa chỉ</th>
			<th>Tổng tiền</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="o" items="${orders}">
			<tr >
				<td>${o.id}</td>
				<td>${o.orderdate}</td>
				<td>${o.address}</td>
				<td>${o.amount}</td>
				
				<td>
				<a href="/order/detail/${o.id}" class="btn btn-sm btn-warning ">
				Detail
				</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
