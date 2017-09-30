<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!-- content -->
<article id="content">
	<div class="box1">
		<div class="wrapper">
			<div class="col2 pad">
				<h2>
					<img src="images/title_marker1.jpg" alt=""><s:message code="rooms.tieude" /></h2>
				<div class="wrapper line1">

					<!-- for -->
					<c:forEach items="${loai_phong }" var="lp">
						<div class="col3">
							<figure class="pad_bot3"><img style="width: 240px; height: 141px;" src="${lp.ANH }" alt=""></figure>
							<p class="pad_bot1"><strong class="color3">${lp.TEN_LOAI }</strong>	</p>
							<p>${lp.MO_TA }.</p>
							<a href="room?ID_LP=${lp.ID_LP }" class="button2"><s:message code="rooms.xemthem" /></a>
						</div>
					</c:forEach>
					<!-- for -->

				</div>
			</div>
		</div>
	</div>
</article>
<!--content end-->