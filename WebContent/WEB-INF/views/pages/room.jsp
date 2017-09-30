<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<!-- content -->
<article id="content">
	<div class="box1">
		<div class="wrapper">
			<div class="col2 pad">
				
					<h2><img src="images/title_marker1.jpg" alt=""><s:message code="room.tieude" /> ${p.TEN_PHONG }</h2>
				
				<div class="wrapper line1">

					<!-- for -->
					<c:forEach items="${phong }" var="p">
						<div class="col3">
							<figure class="pad_bot3">
								<img style="width: 240px; height: 141px;" src="${p.ANH }" alt="">
							</figure>

							<p class="pad_bot1">
								<strong class="color3">${p.TEN_PHONG }</strong>
							</p>
							<p>	Số người: ${p.SLNGUOI }<br>
								Số phòng: ${p.SLPHONG }<br>
								<f:formatNumber value="${p.GIA_PHONG }" currencySymbol="$" type="currency"/>
							</p>
							<p>${p.GIOI_THIEU }.</p>
							<a href="roomdetail?ID_PHONG=${p.ID_PHONG }" class="button2"><s:message code="room.xemthem" /></a>
						</div>
					</c:forEach>
					<!-- for -->

				</div>
			</div>
		</div>
	</div>
</article>
<!--content end-->