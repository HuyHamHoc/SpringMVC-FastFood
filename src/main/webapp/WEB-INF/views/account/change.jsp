<%@ page pageEncoding="utf-8"%>
<h2>Thay đổi mật khẩu</h2>
<h4>${message}</h4>
<form action="/account/change" method="post">
	<div class="form-group">
		<label>Tên đăng nhập</label>
		<input name="email" class="form-control">
	</div>

	<div class="form-group">
		<label>Mật khẩu hiện tại</label>
		<input name="pw" class="form-control" >
	</div>

	<div class="form-group">
		<label>Mật khẩu mới</label>
		<input name="pw1" class="form-control" >
	</div>
	
	<div class="form-group">
		<label>Nhập lại mật khẩu mới</label>
		<input name="pw2" class="form-control" >
	</div>

	<div class="form-group">
		<button class="btn btn-default">Thay đổi mật khẩu</button>
	</div>
</form>