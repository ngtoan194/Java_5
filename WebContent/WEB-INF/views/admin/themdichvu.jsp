<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="top-bar">
	<h1>Quản lý dịch vụ</h1>
</div>
<br />
<div class="select-bar">
	<label> <input type="text" name="textfield" />
	</label> <label> <input type="submit" name="Submit" value="Tìm kiếm" />
	</label>
</div>
<div class="table">
	<form:form action="themdichvu" modelAttribute="dich_vu" method="post"
		enctype="multipart/form-data">
		<img src="admin-imgs/bg-th-left.gif" width="8" height="7" alt=""
			class="left" />
		<img src="admin-imgs/bg-th-right.gif" width="7" height="7" alt=""
			class="right" />
		<table class="listing form" cellpadding="0" cellspacing="0">
			<tr>
				<th class="full" colspan="2">Thêm dịch vụ
					<h3 style="color: red;">${message }</h3>
				</th>
			</tr>
			<tr>
				<td class="first" width="172"><strong>Tên dịch vụ</strong></td>
				<td class="last"><form:input path="TEN_DV" /> <form:errors
						path="TEN_DV" /></td>
			</tr>
			<tr class="bg">
				<td class="first"><strong>Giới thiệu</strong></td>
				<td class="last"><form:textarea path="GIOI_THIEU" rows="4"
						cols="26" /></td>
			</tr>
			<tr>
				<td class="first"><strong>Giá</strong></td>
				<td class="last"><form:input path="GIA" /></td>
			</tr>
			<tr class="bg">
				<td class="first"><strong>Phụ phí</strong></td>
				<td class="last"><form:input path="MOTA_1" /></td>
			</tr>
			<tr class="bg">
				<td class="first"><strong>Mô tả</strong></td>
				<td class="last"><form:input path="MOTA_2" /></td>
			</tr>
			<tr class="bg">
				<td class="first"><strong>Vị trí</strong></td>
				<td class="last"><form:input path="MOTA_3" /></td>
			</tr>
			<tr class="bg">
				<td class="first"><strong>Thời gian mở</strong></td>
				<td class="last"><form:input path="MOTA_4" /></td>
			</tr>
			<tr class="bg">
				<td class="first"><strong>Sức chứa</strong></td>
				<td class="last"><form:input path="MOTA_5" /></td>
			</tr>
			<tr class="bg">
				<td class="first"><strong>Ảnh</strong></td>
				<td class="last"><input
					style="background: yellow; margin-left: 40px;" type="file"
					name="anh" /></td>
			</tr>
		</table>
		<h3 style="color: red;">${mess3}</h3>
		<button name="insert" class="button">Thêm</button>
	</form:form>
</div>