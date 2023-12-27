<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<div class="row">
	<div class="col-sm-5 text-center">
		<img class="detail-img" src="/static/Images/${prod.image}">
	</div>
	<div class="col-sm-7">
		<ul class="detail-info">
			<li>Tên Món: ${prod.name}</li>
			<li>Giá:<f:formatNumber value="${prod.price}"
					pattern="#,###.000" />VNĐ
			</li>
			<li>Danh Mục: ${prod.category.name}</li>
			<li>Số Lượng: ${prod.quantity}</li>
		</ul>
	</div>
</div>
<div class="text-justify">${prod.description}</div>

<ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#tab1">YÊU THÍCH</a></li>
	<li><a data-toggle="tab" href="#tab2">ĐÃ XEM</a></li>
</ul>

<div class="tab-content">
	<div id="tab1" class="tab-pane fade in active">
		<div>
			<c:forEach var="p" items="${favo}">
				<a href="/product/detail/${p.id}"> <img class="thumb-img"
					src="/static/Images/${p.image}">
				</a>
			</c:forEach>
		</div>
	</div>
	
	<div id="tab2" class="tab-pane fade">
		<div>
			<c:forEach var="p" items="${viewed}">
				<a href="/product/detail/${p.id}"> <img class="thumb-img"
					src="/static/Images/${p.image}">
				</a>
			</c:forEach>
		</div>
	</div>
</div>

