<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!-- header -->
					<header>
						<h1><a href="index" id="logo">Yellow Hotel</a></h1>
						<div class="department">
						
							<a href="#" data-lang="en">ENGLISH</a>&nbsp; &nbsp; &nbsp;<a href="#" data-lang="vi">TIẾNG VIỆT</a>
							<br>
							
							<span><s:message code="global.header.sdt" /> &nbsp;  0941239697</span>

						</div>
					</header>
					<div class="box"><div class="ic">More Website Templates @ TemplateMonster.com - October 24, 2011!</div>
						<nav>
							<ul id="menu">
								<jsp:include page="menu.jsp"></jsp:include>
							</ul>
						</nav>
<!-- header end -->