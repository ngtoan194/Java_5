<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form action="insert" modelAttribute="phong">
		<div>
			<label>Mã loại phòng</label>
			<form:input path="loai_phong" />
		</div>
		<div>
			<label>Mã Phòng</label>
			<form:input path="MA_PHONG" />
		</div>
		<div>
			<label>Tên Phòng</label>
			<form:input path="TEN_PHONG" />
		</div>
		<div>
			<label>Ảnh</label>
			<form:input path="PHOTO" />
		</div>
		<div>
			<label>Giới thiệu</label>
			<form:input path="GIOI_THIEU" />
		</div>
		<div>
			<label>Số lượng phòng</label>
			<form:input path="SOLUONG" />
		</div>
		<div>
			<label>Giá phòng</label>
			<form:input path="GIA_PHONG" />
		</div>
		<div>
			<button class="btn btn-default">Insert</button>
			${message }
		</div>
	</form:form>
</body>
</html>