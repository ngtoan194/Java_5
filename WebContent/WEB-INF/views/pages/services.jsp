<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- content -->
<article id="content">
	<div class="box1">
		<div class="wrapper">
			<form action="#" id="form1">
				<h2>Đặt phòng nhanh</h2>
				<fieldset>
					<div class="row">
						<input type="text" class="input"> Họ tên
					</div>
					<div class="row">
						<input type="text" class="input"> E-Mail
					</div>
					<div class="row">
						<input type="text" class="input"> Số điện thoại
					</div>
					<div class="row">
						<input type="text" class="input"> Số CMND
					</div>
					<div class="row">
						<div class="select1">
							<select><option>Đơn</option>
								<option>Đôi</option>
								<option>...</option></select>
						</div>
						Loại Phòng
					</div>
					<div class="row">
						<div class="select2">
							<select><option>&nbsp;</option>
								<option>...</option></select>
						</div>
						<div class="select2">
							<select><option>&nbsp;</option>
								<option>...</option></select>
						</div>
						<div class="select2">
							<select><option>&nbsp;</option>
								<option>...</option></select>
						</div>
						Ngày đến
					</div>
					<div class="row">
						<div class="select2">
							<select><option>&nbsp;</option>
								<option>...</option></select>
						</div>
						<div class="select2">
							<select><option>&nbsp;</option>
								<option>...</option></select>
						</div>
						<div class="select2">
							<select><option>&nbsp;</option>
								<option>...</option></select>
						</div>
						Ngày đi
					</div>
					<div class="row_textarea">
						Ghi chú
						<textarea cols="1" rows="1"></textarea>
					</div>
					<div class="wrapper">
						<a href="#" class="button1"
							onClick="document.getElementById('form1').submit()">Gửi</a> <a
							href="#" class="button1"
							onClick="document.getElementById('form1').reset()">Xóa</a>
					</div>
				</fieldset>
			</form>

			<div class="col2 pad">

				<h2>
					<img src="images/title_marker1.jpg" alt="">Dịch vụ nổi bật
				</h2>

				<c:forEach items="${dich_vu }" var="dv">

					<div class="wrapper pad_bot2">
						<figure class="left marg_right1" style="height: 250px; height: 150px;">
							<img style="height: 250px; height: 150px;" src="${dv.ANH }" alt="">
						</figure>

						<p class="pad_bot1">
							<strong class="color3">${dv.TEN_DV }</strong> <br>
							${dv.GIOI_THIEU }
						</p>

						<a href="servicedetail?ID_DV=${dv.ID_DV }" class="color1">Xem thêm</a>
					</div>

				</c:forEach>
				<ul >
					<c:forEach var="i" begin="1" end="${pages+1 }">
						<li style="float: left; height:20px; width:20px; margin-left:5px; padding-left: 5px; border: 1px solid;">
							<a href="services?pages=${i}">${i}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div class="pad">
		<div class="wrapper line3">
			<div class="col2">
				<h2>Dịch vụ chính</h2>
				<p class="pad_bot1">
					<strong class="color2">SỨC KHỎE VÀ AN TOÀN CỦA KHÁCH</strong>
				</p>
				<p class="pad_bot1">Quý khách có thể hoàn toàn tin tưởng vào hệ
					thống báo cháy và các trang thiết bị chữa cháy của khách sạn cũng
					như hệ thống an ninh trong phòng quý khách. Khóa từ và các biện
					pháp an toàn được trang bị cho mỗi phòng theo tiêu chuẩn 5 sao.</p>
				<p class="pad_bot1">Khách sạn được trang bị một hệ thống điều
					hòa nhiệt độ cùng với bộ cửa ra vào và cửa sổ chống ngăn tiếng ồn
					được sản xuất bởi công ty Euro Window, sẽ giúp bạn không bị quấy
					rầy hay thức giấc bởi âm thanh từ đường phố.</p>
				<div class="wrapper pad_bot2">
					<div class="col1">
						<ul class="list1">
						
							<li><a href="#">Bể bơi 4 mùa</a></li>
							<li><a href="#">Fitness center</a></li>
							<li><a href="#">Dịch vụ văn phòng</a></li>
							<li><a href="#">Dịch vụ giặt ủi quần áo</a></li>
						</ul>
						
					</div>
					<div class="col1 pad_left1">
						<ul class="list1">
							<li><a href="#">Dịch vụ phòng 24/24</a></li>
							<li><a href="#">Dịch vụ cho thuê tự lái</a></li>
							<li><a href="#">Dịch vụ xe đưa đón sân bay</a></li>
							<li><a href="#">Dịch vụ đặt vé máy bay, tour du lịch</a></li>
						</ul>
					</div>
				</div>
				<a href="#" class="button1">Xem thêm</a>
			</div>
			<div class="col1 pad_left1">
				<h2>Ưu đãi đặc biệt</h2>
				<div class="wrapper">
					<figure class="left marg_right1">
						<img src="images/page2_img3.jpg" alt="">
					</figure>
					<p class="pad_bot1">
						<strong class="color2">Đặt trước phòng VIP 10 này</strong>
					</p>
					<p class="pad_bot1">Được miễn phí vào tập Fitness center và bể
						bơi 4 mùa.</p>
				</div>
				<div class="wrapper">
					<figure class="left marg_right1">
						<img src="images/page2_img4.jpg" alt="">
					</figure>
					<p class="pad_bot1">
						<strong class="color2">Đặt trước phòng loại thường 10 này</strong>
					</p>
					<p class="pad_bot2">Được khách sạn miễn phí đưa đón sân bay/
						bến xe.</p>
				</div>
				<a href="#" class="button1">Xem thêm</a>
			</div>
		</div>
	</div>
</article>
<!--content end-->
</html>