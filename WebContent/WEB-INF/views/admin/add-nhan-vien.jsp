<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="top-bar">
	<h1>Quản lý loại phòng</h1>
</div>
<br />
<div class="select-bar">
	<label> <input type="text" name="textfield" />
	</label> <label> <input type="submit" name="Submit" value="Tìm kiếm" />
	</label>
</div>
<div class="table">
	<form:form action="quan-ly-nhan-vien" modelAttribute="nhan_vien"
		method="POST" enctype="multipart/form-data">
		<img src="admin-imgs/bg-th-left.gif" width="8" height="7" alt=""
			class="left" />
		<img src="admin-imgs/bg-th-right.gif" width="7" height="7" alt=""
			class="right" />
		<table class="listing form" cellpadding="0" cellspacing="0">
			<tr>
				<th class="full" colspan="2">Thêm nhân viên
					<h3 style="color: red;">${mess}</h3>
				</th>
			</tr>
			<tr class="bg">
				<td class="first"><strong>Họ và tên</strong></td>
				<td class="last"><form:input path="HO_TEN" />
				<form:errors path="HO_TEN" element="span"/></td>
			</tr>
			<tr>
				<td class="first"><strong>Giới tính</strong></td>
				<td class="last"><form:select path="GIOI_TINH">
						<form:options items="${sex}" />
					</form:select></td>
			</tr>
			<tr>
				<td class="first"><strong>Tuổi</strong></td>
				<td class="last"><form:input path="TUOI" />
				<form:errors path="TUOI" element="span"/> </td>
			</tr>
			
			<tr class="bg">
				<td class="first"><strong>Ảnh mới</strong></td>
				<td class="last"><input type="file" name="anh" /></td>
			</tr>
			
			<tr class="bg">
				<td class="first"><strong>Trạng thái</strong></td>
				<td class="last">
					<form:select path="STATUS">
						<form:options items="${status}" />
					</form:select></td>
				</td>
			</tr>
		</table>
		<!-- <h3 style="color: red;">${mess}</h3> -->
		<button class="btn btn-default" name="add">Insert</button>
	</form:form>
</div>
