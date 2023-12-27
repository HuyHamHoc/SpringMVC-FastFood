<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity">
			<div class="form-group">
				<label>Order Id</label>
				<form:input path="id" class="form-control" readonly="true" />
			</div>
			<div class="form-group">
				<label>Customer</label>
				<form:input path="customer.id" class="form-control" />
			</div>
			<div class="form-group">
				<label>Ngày đặt</label>
				<form:input path="orderdate" class="form-control" />
			</div>
			<div class="form-group">
				<label>Địa chỉ</label>
				<form:input path="address" class="form-control" />
			</div>
			<div class="form-group">
				<label>Tổng tiền</label>
				<form:input path="amount" class="form-control" />
			</div>
			<div class="form-group">
				<label>Mô tả</label>
				<form:textarea path="description" row="3" class="form-control" />
			</div>
			<div class="form-group">
					<button class="btn btn-primary" formaction="${base}/create">Tạo</button>
					<button class="btn btn-success" formaction="${base}/update">Cập Nhật</button>
					<button class="btn btn-danger" formaction="${base}/delete">Xóa</button>
					<a class="btn btn-warning" href="${base}/index">Reset</a>
			</div>
		</form:form>
		<c:if test="${!empty details}">
		<jsp:include page="details.jsp"/>
		</c:if>
	</div>
</div>



