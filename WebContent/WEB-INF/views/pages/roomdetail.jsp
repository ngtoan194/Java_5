<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<!-- content -->
<article id="content">
	<div class="box1">
		<div class="wrapper">

			<c:forEach items="${phong }" var="p">
				<h2>
					<img src="images/title_marker1.jpg" alt=""><s:message code="roomdetail.tenphong" /> ${p.TEN_PHONG }</h2>


					<div id="slider" style="width: 468px; height: 400px; float: left; border: 1px solid #333; position: relative;">
						<img src="${p.ANH }" class="slide" stt="0" style="width: 468px; height: 400px;" /> 
						<img src="images/room2.jpg" class="slide" stt="1" style="display: none; width: 468px;height: 400px;"/>
						<img src="images/room3.jpg" class="slide" stt="2" style="display: none; width: 468px;height: 400px;"/>
						<img src="images/room4.jpg" class="slide" stt="3" style="display: none; width: 468px;height: 400px;"/>
						<img src="images/room5.jpg" class="slide" stt="4" style="display: none; width: 468px;height: 400px;"/>
						
						<a href="#" id="prev"style="text-transform: uppercase; top: 170px; left: 10px; position: absolute;"><img src="images/prev1.png" height="69" width="69"></a> 
						<a href="#" id="next" style="text-transform: uppercase; top: 170px; right: 10px; position: absolute;"><img src="images/next1.png" height="69" width="69"></a>
					</div>



				<div id="beslide">
					<div class="mota">
						<h2><s:message code="roomdetail.mota" /></h2>
						<h4>• ${p.MOTA_1 }</h4>
						<h4>• ${p.MOTA_2 }</h4>
						<h4>• ${p.MOTA_3 }</h4>
						<h4>• ${p.MOTA_4 }</h4>
						<h4>• ${p.MOTA_5 }</h4>
						<h4>• ${p.MOTA_6 }</h4>
						<h4>• ${p.MOTA_7 }</h4>
					</div>
					<div class="tienich">
						<h2><s:message code="roomdetail.tienich" /></h2>
						<div class="lefttienich"
							style="float: right; width: 225px; height: 200px;">
							<h4>
								<img src="images/v.png" height="20" width="20" />${p.TIENICH_1 }</h4>
							<h4>
								<img src="images/v.png" height="20" width="20" />${p.TIENICH_2 }</h4>
							<h4>
								<img src="images/v.png" height="20" width="20" />${p.TIENICH_3}</h4>
							<h4>
								<img src="images/v.png" height="20" width="20" />${p.TIENICH_4 }</h4>
							<h4>
								<img src="images/v.png" height="20" width="20" />${p.TIENICH_5 }</h4>
						</div>
						<div class="righttienichvl">
							<h4>
								<img src="images/v.png" height="20" width="20" />${p.TIENICH_6 }</h4>
							<h4>
								<img src="images/v.png" height="20" width="20" />${p.TIENICH_7 }</h4>
							<h4>
								<img src="images/v.png" height="20" width="20" />${p.TIENICH_8 }</h4>
							<h4>
								<img src="images/v.png" height="20" width="20" />${p.TIENICH_9 }</h4>
							<h4>
								<img src="images/v.png" height="20" width="20" />${p.TIENICH_10 }</h4>
						</div>
					</div>
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