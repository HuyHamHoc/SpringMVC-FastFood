<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity" enctype="multipart/form-data">
			<div class="row">
			<div class="form-group col-sm-6">
					<label>Địa chỉ Email</label>
					<form:input path="email" class="form-control" />
				</div>
				<div class="form-group col-sm-6">
					
					<form:hidden path="id" class="form-control" />
				</div>

				<div class="form-group col-sm-6">
					<label>Mật Khẩu</label>
					<form:input path="password" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Họ Tên</label>
					<form:input path="fullname" class="form-control" />
				</div>
				
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Vai Trò</label>
					<div class="form-control">
						<form:radiobutton path="admin" value="true" label="Admin" />
						<form:radiobutton path="admin" value="false" label="User" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-12">
					<label>Hình Ảnh</label> 
					<input type ="file" name="photo_file" class="form-control">
					<form:hidden path="image" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-12">
						<button class="btn btn-primary" formaction="${base}/create">Tạo</button>
					<button class="btn btn-success" formaction="${base}/update">Cập Nhật</button>
					<button class="btn btn-danger" formaction="${base}/delete">Xóa</button>
					<a class="btn btn-warning" href="${base}/index">Reset</a>
				</div>
			</div>
		</form:form>
	</div>
</div>



