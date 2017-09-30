<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- content -->
<article id="content">
	<div class="box1">
		<div class="wrapper">
			<form action="#" id="form1" style="height: 375px;">
				<h2>Bảng giá</h2>
				<fieldset>
					<c:forEach items="${phong }" var="p">
					<div class="row" style="margin-bottom: 25px;">
					
					${p.TEN_PHONG }
					
					(${p.SLPHONG } phòng): 
					
					&nbsp; 
					
					${p.GIA_PHONG } đ

					</div>
					</c:forEach>
					<br>
				</fieldset>
			</form>
			<div class="col2_pad">
				<form action="#" id="form2">
					<h2>
						<img src="images/title_marker1.jpg" alt="">Đặt phòng
					</h2>
					<table border="0" cellpadding="0" cellspacing="0">
						<tr class="table">
							<td class="dt_left">Họ và tên</td>
							<td class="dt_right"><input type="text" class="input"></td>
						</tr>
						<tr class="table">
							<td class="dt_left">Email</td>
							<td class="dt_right"><input type="text" class="input"></td>
						</tr>
						<tr class="table">
							<td class="dt_left">Số điện thoại</td>
							<td class="dt_right"><input type="text" class="input"></td>
						</tr>
						<tr class="table">
							<td class="dt_left">Số CMND</td>
							<td class="dt_right"><input type="text" class="input"></td>
						</tr>
						<tr class="table">
							<td class="dt_left">Loại phòng</td>
							<td class="dt_right">
								<div class="select1">
									<select>
										<option value="chon">&nbsp;</option>
										<option value="supreme">Supreme</option>
										<option value="vip">VIP</option>
										<option value="giadinh">Gia Đình</option>
									</select>
								</div>
							</td>
						</tr>
						<tr class="table">
							<td class="dt_left">Ngày đến</td>
							<td class="dt_right"><select name="loaiphong">
									<option value="chon">&nbsp;</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
							</select> <select name="loaiphong">
									<option value="chon">&nbsp;</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
							</select> <select name="loaiphong">
									<option value="chon">&nbsp;</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
							</select></td>
						</tr>
						<tr class="table">
							<td class="dt_left">Ngày đi</td>
							<td class="dt_right"><select>
									<option value="chon">&nbsp;</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
							</select> <select name="loaiphong">
									<option value="chon">&nbsp;</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
							</select> <select name="loaiphong">
									<option value="chon">&nbsp;</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
							</select></td>
						</tr>
						<tr class="table">
							<td class="dt_left">Ghi chú</td>
							<td class="dt_right"><textarea cols="1" rows="1"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="form_btn">
									<a href="#" class="button1"
										onClick="document.getElementById('form1').submit()">Gửi</a> <a
										href="#" class="button1"
										onClick="document.getElementById('form1').reset()">Xóa</a>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>

	</div>
	<div class="pad">
		<div class="wrapper line3">
			<div class="col2">
				<h2>Giới thiệu về đặt phòng</h2>
				<p class="pad_bot1">
					<strong class="color2">Yellow Hotel mang đến cho du khách
						những thông tin bổ ích trong lĩnh vực du lịch và lữ hành.</strong>
				</p>
				<p>Các thông tin chính bao gồm những vấn đề chủ yếu để mang lại
					một chuyến đi hoàn hảo cho du khách, dù đó là chuyến du lịch hay
					công tác của bạn. Đó là những thông tin về cách thức đặt phòng
					khách sạn, đặt vé máy bay trực tuyến, so sánh, tìm kiếm khách sạn
					tiện ích hay vé máy bay giá rẻ phù hợp với lịch trình của bạn. Bên
					cạnh đó là những việc cần chuẩn bị cho chuyến đi như những đồ dùng,
					vật dụng cá nhân hay những kiến thức để giữ an toàn trên tàu xe.
					Thậm chí, bao gồm cả những kinh nghiệm khi làm sao tiện lợi và an
					toàn khi đi xa cùng với trẻ nhỏ, chống say tàu xe…</p>

				<div class="pad_bot2">
					<div class="wrapper line2">
						<div class="col1">
							<ul class="list1">
								<li><a href="#">Xem mẫu phòng Supreme</a></li>
								<li><a href="#">Xem mẫu phòng VIP</a></li>
								<li><a href="#">Xem mẫu phòng Gia đình</a></li>
								<li><a href="#">Xem mẫu phòng Sang trọng</a></li>
							</ul>
						</div>
						<div class="col1 pad_left1">
							<ul class="list1">
								<li><a href="#">Xem mẫu phòng Cao cấp</a></li>
								<li><a href="#">Xem mẫu phòng Tiêu chuẩn</a></li>
								<li><a href="#">Xem mẫu phòng Thường</a></li>
							</ul>
						</div>
					</div>
				</div>
				<a href="#" class="button1">Xem thêm</a>
			</div>
			<div class="col1 pad_left1">
				<h2>Chính sách</h2>
				<p class="pad_bot1">
					<strong class="color2">CÁC CHÍNH SÁCH CỦA YELLOW HOTEL</strong>
				</p>
				<p class="pad_bot1">• Giờ trả phòng : 12:00 trưa.</p>
				<p class="pad_bot1">• Giờ nhận phòng: 13:00 chiều.</p>
				<p class="pad_bot1">• Thanh toán trước 50% trên tổng giá trị
					tiền phòng để đặt phòng có bảo đảm.</p>
				<p class="pad_bot1">
					<strong class="color2">CHÍNH SÁCH CHO TRẺ EM</strong>
				</p>
				<p class="pad_bot1">Miễn phí tiền phòng cho tối đa 02 trẻ em
					dưới 5 tuổi ở cùng phòng với người lớn, không kê thêm giường phụ.
					Trẻ em từ 06 đến 11 tuổi tính tiền phòng bằng 50% giá ngưòi lớn.</p>
			</div>
		</div>
	</div>
</article>
<!--content end-->