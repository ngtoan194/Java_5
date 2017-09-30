<%@ page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="top-bar">
	<h1>
		Quản lý nhân viên<font style="color: red">${mess}</font>
	</h1>
</div>
<br />
<div class="select-bar">
	<label> <input type="text" name="textfield" />
	</label> <label> <input type="submit" name="Submit" value="Tìm kiếm" />
	</label><label><a href="quan-ly-nhan-vien?add"><input type="button"
			value="Thêm mới" /></a></label>
	<!-- <label><a href=""><input type="button" value="Thêm mới" /></a></label> -->
</div>
<div class="table">
	<img src="images/admin-imgs/bg-th-left.gif" width="8" height="7" alt=""
		class="left" /> <img src="images/admin-imgs/bg-th-right.gif"
		width="7" height="7" alt="" class="right" />
	<table class="listing" cellpadding="0" cellspacing="0">
		<tr>
			<th>Mã nhân viên</th>
			<th>Họ và tên</th>
			<th>Giới tính</th>
			<th>Tuổi</th>
			<th>Ảnh</th>
			<th>Trạng thái</th>
			<th>Sửa</th>
			<th>Xóa</th>
		</tr>
		<c:forEach var="nv" items="${nhan_vien}">
			<tr class="bg">
				<td>${nv.ID_NV}</td>
				<td>${nv.HO_TEN}</td>
				<td>${nv.GIOI_TINH}</td>
				<td>${nv.TUOI}</td>
				<td><img src="${nv.ANH}" width="100px" height="auto"></td>
				<c:choose>
					<c:when test="${nv.STATUS == 1}">
						<td style="color: green;">Active</td>
					</c:when>
					<c:otherwise>
						<td style="color: red;">Deactive</td>
					</c:otherwise>
				</c:choose>
				<td><a href="quan-ly-nhan-vien?edit&id=${nv.ID_NV}" name="edit">Sửa</a></td>
				<td><a href="quan-ly-nhan-vien?delete&id=${nv.ID_NV}"
					onclick="return confirm('Bạn có chắc chắn muốn xóa nhân viên này!');">Xóa</a>
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
				<a href="quan-ly-nhan-vien?pages=${i.index}">${i.index}</a>
				</li>
			</c:forEach>
		</strong>
		<!-- <select>
            <option>1</option>
          </select> -->
	</div>
</div>