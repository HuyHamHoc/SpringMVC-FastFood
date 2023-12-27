<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity" enctype="multipart/form-data">
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Tên món</label>
					<form:input path="name" class="form-control" />
				</div>
				<div class="form-group col-sm-6">
					
					<form:hidden path="id" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Giá</label>
					<form:input path="price" class="form-control" />
				</div>
				<div class="form-group col-sm-6">
					<label>Số lượng</label>
					<form:input path="quantity" class="form-control" />
				</div>
			</div>
			<div class="row">
			<div class="form-group col-sm-6">
					<label>Loại sản phẩm</label>
					<form:select path="category.id" class="form-control" >
					<form:options items="${cates}" itemLabel="name" itemValue="id"/>
					</form:select>
				</div>
			
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label>Hình Ảnh</label> 
					<input type="file" name ="photo_file" class="form-control">
					<form:hidden path="image" />
				
				</div>
			</div>
			<div class="row">
			<div class="form-group col-sm-12">
					<label>Mô tả</label>
					<form:textarea path="description" row="3" class="form-control" />
				</div>
			
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

<script type="text/javascript">
 
        bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
  </script>

