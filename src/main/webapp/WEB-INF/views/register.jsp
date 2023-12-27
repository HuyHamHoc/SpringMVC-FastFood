<%@  page pageEncoding="utf-8"%>
<link href="/static/css/register.css" rel="stylesheet" />
<script src="/static/js/register.js"></script>

<!-- main -->
<div class="main-w3layouts wrapper">
	<h1>Đăng ký </h1>
	<h4 style="text-align: center;">${message}</h4>
	<div class="main-agileinfo">
		<div class="agileits-top">
			<form action="/register" method="post" enctype="multipart/form-data">
					<div class="form-group">
					
						<input class="text" type="text" name="email" placeholder="Email" required="" path="email">
					</div>
					<br>
					<div class="form-group">
					
						<input class="text" type="password" name="password" placeholder="Mật khẩu" required="" path="password">
					</div>
					<br>
					<div class="form-group">
						
						<input class="text" type="text" name="fullname" placeholder="Họ tên" required="" path="fullname">
					</div>
					<br>
					<div class="form-group">
					<br>
						
						<input type="file" name="photo_file" path="image">
					</div>
					<div class="form-group">
						<input type="submit" value="Đăng ký">
					</div>
				</form>

			<p>
				 <a href="login"> Đăng nhập tại đây!</a>
			</p>
		</div>
	</div>
	