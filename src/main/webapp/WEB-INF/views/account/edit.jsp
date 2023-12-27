<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<h2>Chỉnh sửa thông tin</h2>
<h4>${message}</h4>
<form:form  action="/account/edit" 
modelAttribute="form" enctype="multipart/form-data">
	<div class="form-group">
		<label>Tên đăng nhập</label>
		<form:input path="email" class="form-control" readonly="true"/>
	</div>
	
		<div class="form-group">
		<label>Ho tên đầy đủ</label>
		<form:input path="fullname" class="form-control" />
	</div>

<div class="form-group">
		<label>Ảnh</label>
		<img  src="/static/Images/User/${form.image}" style="width:80px; height:90px;">
		<input type="file" name="photo_file">
		<form:hidden path="image" class="form-control" />
	</div>

	<div class="form-group">
	<form:hidden path="password"  />
	<form:hidden path="admin"  />
	
	</div>


	<div class="form-group">
		<button class="btn btn-default">Chỉnh sửa</button>
	</div>
</form:form>
