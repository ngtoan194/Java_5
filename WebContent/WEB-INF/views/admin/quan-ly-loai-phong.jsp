<%@ page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="top-bar">
	<h1>Quản lý loại phòng</h1>
</div>
<br />
<div class="select-bar">
	<label> <input type="text" name="textfield" />
	</label> <label> <input type="submit" name="Submit" value="Tìm kiếm" />
	</label><label><a href="themloaiphong"><input type="button" value="Thêm mới" /></a></label>
</div>
<div class="table">
	<img src="images/admin-imgs/bg-th-left.gif" width="8" height="7" alt=""
		class="left" /> <img src="images/admin-imgs/bg-th-right.gif"
		width="7" height="7" alt="" class="right" />
	<table class="listing" cellpadding="0" cellspacing="0">
		<tr>
			<th>Mã loại phòng</th>
			<th>Tên loại phòng</th>
			<th>Mô tả</th>
			<th>Ảnh</th>
			<th>Sửa</th>
			<th>Xóa</th>
		</tr>
		<c:forEach var="lp" items="${loai_phong}">
			<tr class="bg">
				<td>${lp.ID_LP}</td>
				<td>${lp.TEN_LOAI}</td>
				<td>${lp.MO_TA}</td>
				<td><img src="${lp.ANH}" width="100px" height="auto"></td>
				<td><a href="sualoaiphong?id=${lp.ID_LP}">Sửa</a></td>
				<td><a href="delete?id=${lp.ID_LP}"
					onclick="return confirm('Bạn có chắc chắn muốn xóa loại phòng này!');">Xóa</a>
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
		<strong>Other Pages: 
		<c:forEach var="i" begin="1" end="${pages+1 }">
				<a href="quan-ly-loai-phong?pages=${i}">${i}</a></li>
			</c:forEach>
		</strong>
		<!-- <select>
            <option>1</option>
          </select> -->
	</div>
</div>