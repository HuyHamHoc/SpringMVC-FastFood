<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity">
			<div class="form-group">
				<label>Id</label>
				<form:input path="id" class="form-control" />
			</div>
			<div class="form-group">
				<label>Name</label>
				<form:input path="name" class="form-control" />
			</div>
			<div class="form-group">
				<button class="btn btn-primary" formaction="${base}/create">Tạo</button>
				<button class="btn btn-success" formaction="${base}/update">Cập Nhật</button>
				<button class="btn btn-danger" formaction="${base}/delete">Xóa</button>
				<a class="btn btn-warning" href="${base}/index">Reset</a>
			</div>
		</form:form>
	</div>
</div>



