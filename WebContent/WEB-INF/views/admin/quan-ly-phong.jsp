<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="top-bar">
	<h1>Quản lý phòng</h1>
</div>
<br />
<div class="select-bar">
	<label> <input type="text" name="textfield" />
	</label> <label> <input type="submit" name="Submit" value="Tìm kiếm" />
	</label><label><a href="themloaiphong"><input type="button"
			value="Thêm mới" /></a></label>
</div>
<div class="table">
	<img src="images/admin-imgs/bg-th-left.gif" width="8" height="7" alt=""
		class="left" /> <img src="images/admin-imgs/bg-th-right.gif"
		width="7" height="7" alt="" class="right" />
	<table class="listing" cellpadding="0" cellspacing="0">
		<tr>
			<th>Mã phòng</th>
			<th>Tên phòng</th>
			<th>Ảnh</th>
			<th>Giới thiệu</th>
			<th>Số phòng</th>
			<th>Số người</th>
			<th>Mô tả</th>
			<th>Tiện ích</th>
			<th>Trạng thái</th>
			<th>Sửa</th>
			<th>Xóa</th>
		</tr>
		<c:forEach var="p" items="${phong}">
			<tr class="bg">
				<td>${p.ID_PHONG}</td>
				<td>${p.TEN_PHONG}</td>
				<td><img src="${p.ANH}" width="50px" height="auto"></td>
				<td>${p.GIOI_THIEU}</td>
				<td>${p.SLPHONG }</td>
				<td>${p.SLNGUOI }</td>
				<td>${p.GIA_PHONG }</td>
				<td>
					<h5>• ${p.MOTA_1}</h5>
					<h5>• ${p.MOTA_2}</h5>
					<h5>• ${p.MOTA_3}</h5>
					<h5>• ${p.MOTA_4}</h5>
					<h5>• ${p.MOTA_5}</h5>
					<h5>• ${p.MOTA_6}</h5>
					<h5>• ${p.MOTA_7}</h5>
				</td>
				<td>
					<h5>• ${p.TIENICH_1}</h5>
					<h5>• ${p.TIENICH_2}</h5>
					<h5>• ${p.TIENICH_3}</h5>
					<h5>• ${p.TIENICH_4}</h5>
					<h5>• ${p.TIENICH_5}</h5>
					<h5>• ${p.TIENICH_6}</h5>
					<h5>• ${p.TIENICH_7}</h5>
					<h5>• ${p.TIENICH_8}</h5>
					<h5>• ${p.TIENICH_9}</h5>
					<h5>• ${p.TIENICH_10}</h5>
				</td>
				<td>${p.STATUS }</td>
				<td><a href="">Sửa</a></td>

				<td><a href=""
					onclick="return confirm('Bạn có chắc chắn muốn xóa phòng này!');">Xóa</a>
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
		<strong>Other Pages: <c:forEach var="i" begin="1"
				end="${pages+1 }">
				<a href="quan-ly-phong?pages=${i}">${i}</a>
				</li>
			</c:forEach>
		</strong>
		<!-- <select>
            <option>1</option>
          </select> -->
	</div>
</div>