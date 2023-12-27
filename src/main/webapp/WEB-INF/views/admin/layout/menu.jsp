<%@  page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<ul class="nav navbar-nav navbar-left">
			<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">Quản Lý
				 <span class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="/admin/category/index">Danh Mục</a></li>
					<li><a href="/admin/product/index">Sản Phẩm</a></li>
					<li><a href="/admin/customer/index">Khách Hàng</a></li>
					<li><a href="/admin/order/index">Đơn Hàng</a></li>
				</ul>
			</li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="/account/logout">Đăng Xuất</a></li>
		</ul>
	</div>
</nav>