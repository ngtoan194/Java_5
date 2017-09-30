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
	</label><label><a href="themdichvu"><input type="button"
			value="Thêm mới" /></a></label>
</div>
<div class="table">
	<img src="images/admin-imgs/bg-th-left.gif" width="8" height="7" alt=""
		class="left" /> <img src="images/admin-imgs/bg-th-right.gif"
		width="7" height="7" alt="" class="right" />
	<table class="listing" cellpadding="0" cellspacing="0">
		<tr>
			<th>Mã dịch vụ</th>
			<th>Tên dịch vụ</th>
			<th>Ảnh</th>
			<th>Giới thiệu</th>
			<th>Giá</th>
			<th>Phụ phí</th>
			<th>Mô tả</th>
			<th>Vị trí</th>
			<th>Thời gian mở</th>
			<th>Sức chứa</th>
			<th>Sửa</th>
			<th>Xóa</th>
		</tr>
		<c:forEach var="dv" items="${dich_vu}">
			<tr class="bg">
				<td>${dv.ID_DV}</td>
				<td>${dv.TEN_DV}</td>
				<td><img width="100px" height="auto" src="${dv.ANH }"></td>
				<td>${dv.GIOI_THIEU}</td>
				<td>${dv.GIA}</td>
				<td>${dv.MOTA_1}</td>
				<td>${dv.MOTA_2}</td>
				<td>${dv.MOTA_3}</td>
				<td>${dv.MOTA_4}</td>
				<td>${dv.MOTA_5}</td>
				<td><a href="">Sửa</a></td>

				<td><a href=""
					onclick="return confirm('Bạn có chắc chắn muốn xóa dịch vụ này!');">Xóa</a>
				</td>

			</tr>
		</c:forEach>
	</table>
	<!-- <td class="first style2"></td>
			<td><img src="images/admin-imgs/add-icon.gif" width="16" height="16"
				alt="add" /></td>
			<td><img src="images/admin-imgs/hr.gif" width="16" height="16" alt="" /></td>
			<td><img src="images/admin-imgs/save-icon.gif" width="16" height="16"
				alt="save" /></td>
			<td><img src="images/admin-imgs/edit-icon.gif" width="16" height="16"
				alt="edit" /></td>
			<td><img src="images/admin-imgs/login-icon.gif" width="16" height="16"
				alt="login" /></td>
			<td><img src="images/admin-imgs/save-icon.gif" width="16" height="16"
				alt="save" /></td>
			<td class="last"><img src="images/admin-imgs/add-icon.gif" width="16"
				height="16" alt="add" /></td> -->
	<div class="select">
		<strong>Other Pages: <c:forEach varStatus="i" begin="1"
				end="${pages}">
				<a href="quan-ly-dich-vu?pages=${i.index}">${i.index}</a>
				</li>
			</c:forEach>
		</strong>
		<!-- <select>
            <option>1</option>
          </select> -->
	</div>
</div>
