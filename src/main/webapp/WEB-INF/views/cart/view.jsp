<%@ page pageEncoding="utf-8"%>
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
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="p"
			items="${sessionScope['scopedTarget.cartService'].items}">
			<tr data-id="${p.id}" data-price="${p.price}">
				<td>${p.id}</td>
				<td>${p.name}</td>
				<td>${p.price}</td>
				<td><input value="${p.quantity}" type="number" min="1" style="witdh:70px"></td>
				<td class="amt">${p.quantity * p.price}</td>
				<td>
				<button class="btn btn-sm btn-warning btn-cart-remove">
				<i class="glyphicon glyphicon-trash"></i>
				</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<button class="btn btn-sm btn-danger btn-cart-clear">Clear</button>
<button class="btn btn-sm btn-info">Continue</button>
<a href="/order/checkout" class="btn btn-sm btn-success">Checkout</a>