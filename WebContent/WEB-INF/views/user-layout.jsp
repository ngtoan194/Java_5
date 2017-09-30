<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
	<head>
		<base href="${pageContext.servletContext.contextPath}/">
		<meta charset="utf-8" />
		<title>Yellow Hotel</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
		<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
		<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
		
		<!--  Javascript tự viết -->
		<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="js/slider.js"></script>
		
		<script type="text/javascript">
			$(function() {
				$("a[data-lang]").click(function() {
					var lang = $(this).attr("data-lang");
					$.get("index?language=" + lang, function() {
						location.reload();
					});
					return false;
				});
			});
		</script>
		
		<script type="text/javascript" src="js/jquery-1.6.js"></script>
		<script type="text/javascript" src="js/cufon-yui.js"></script>
		<script type="text/javascript" src="js/cufon-replace.js"></script>
		<script type="text/javascript" src="js/Adamina_400.font.js"></script>
		<script type="text/javascript" src="js/jquery.jqtransform.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
		<script type="text/javascript" src="js/kwicks-1.5.1.pack.js"></script>
		<script type="text/javascript" src="js/atooltip.jquery.js"></script>
		<!--[if lt IE 9]>
					<script type="text/javascript" src="js/html5.js"></script>
					<link rel="stylesheet" href="css/ie.css" type="text/css" media="all">
				<![endif]-->
		<!--[if lt IE 7]>
					<div style=' clear: both; text-align:center; position: relative;'>
						<a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a>
					</div>
				<![endif]-->
	</head>
<body id="page1">
		<div class="bg1">
			<div class="bg2">
				<div class="main">
<!-- header -->
					<jsp:include page="header.jsp"></jsp:include>
<!-- header end -->
<!-- content -->
						<article id="content">
							<jsp:include page="${param.view }"></jsp:include>
						</article>
<!--content end-->
					</div>
				</div>
			</div>
		</div>
		<div class="main">
<!-- footer -->
			<jsp:include page="footer.jsp"></jsp:include>
<!-- footer end -->
		</div>
		<script type="text/javascript"> Cufon.now(); </script>
		<script>
			$(document).ready(function(){
				$('.kwicks').kwicks({
					max : 500,
					spacing : 0,
					event : 'mouseover'
				});
							   
			})
		</script>
	</body>
</html>
