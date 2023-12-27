<%@ page  pageEncoding="utf-8"%>
    
<link href="/static/css/login.css" rel="stylesheet"/>
<script src="/static/js/login.js"></script>

<div class="login-page">
  <div class="form"   >
  <h4 style="text-align: center;">${message}</h4>
    <form class="login-form"  action="/login" method="post">
      <input type="text" placeholder="Email" name="email"  value="${uid}"/>
      <input type="password" placeholder="Password" name="pw"  value="${pwd}"/>
      <div class="form-group">
		<button class="btn btn-default">Đăng nhập</button>
		<p class="message">Bạn chưa đăng ký? <a href="register">Đăng ký tại đây!</a></p>
	</div>
      
    </form>
  </div>
</div>