<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- content -->
<article id="content">
	<div class="box1">
		<div class="wrapper">
		
			<c:forEach items="${dich_vu }" var="dv">
				<h2><img src="images/title_marker1.jpg" alt="">${dv.TEN_DV }</h2>
				<div id="" style="width: 420px;height: 300px;float: left;border: 1px solid #333;position: relative;">
					<img src="${dv.ANH }" class="slide" style="width: 420px; height: 300px;" />
				</div>

				<div id="beslide" style="height: 210px; width: 400px; float: left; margin-left: 20px;">
					<div class="mota">
						<h2>${dv.TEN_DV }</h2>
						<h4>• ${dv.GIOI_THIEU }</h4>
						<br>
						<h3>Vé: ${dv.GIA } đ</h3>
						<h3>*${dv.MOTA_1 }</h3>
					</div>
				</div>
				<div class="tienich" style="float: left; margin-left: 10px;">
					<h2>Chi tiết</h2>
					<h4> • ${dv.MOTA_2 }</h4><br>
					<h4> • Vị trí: ${dv.MOTA_3 }</h4>
					<h4> • Giờ mở cửa: ${dv.MOTA_4 }</h4>
					<h4> • Sức chứa: ${dv.MOTA_5 }</h4>
				</div>
			</c:forEach>
			
			</div>
		

	</div>


	<div class="pad">
		<div class="wrapper line3">
			<div class="col2">
				<h2>Các dịch vụ của khách sạn</h2>
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
		</div>
	</div>
</article>
<!--content end-->
