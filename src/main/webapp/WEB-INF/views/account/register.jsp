<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<h2>Đăng ký</h2>
<h4>${message}</h4>
<form:form  action="/account/register" 
modelAttribute="form" enctype="multipart/form-data">
	<div class="form-group">
		<label>Tên đăng nhập</label>
		<form:input path="email" class="form-control" />
	</div>

	<div class="form-group">
		<label>Mật khẩu</label>
		<form:input path="password" class="form-control" />
	</div>
	
		<div class="form-group">
		<label>Ho tên đầy đủ</label>
		<form:input path="fullname" class="form-control" />
	</div>

<div class="form-group">
		<label>Ảnh</label>
		<input type="file" name="photo_file">
		<form:hidden path="image" class="form-control" />
	</div>



	<div class="form-group">
		<button class="btn btn-default">Đăng ký</button>
	</div>
</form:form>
