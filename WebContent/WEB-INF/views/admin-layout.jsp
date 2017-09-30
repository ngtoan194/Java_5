<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>CMS Admin</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<base href="${pageContext.servletContext.contextPath}/"/>
<style media="all" type="text/css">
@import "css/admin-style.css";
</style>
</head>
<body>
<div id="main">
  <div id="header"> <a href="quan-ly-loai-phong" class="logo"><!-- <img src="images/admin-imgs/logo.gif" width="101" height="29" alt="" /> -->Yellow Hotel</a>
    <ul id="top-navigation">
      <jsp:include page="admin-layout/menu-top.jsp"></jsp:include>
    </ul>
  </div>
  <div id="middle">
    <div id="left-column">
      <h3>Welcome Admin</h3>
      <!--<ul class="nav">
        <li><a href="">Lorem Ipsum dollar</a></li>
        <li><a href="">Dollar</a></li>
        <li><a href="">Lorem dollar</a></li>
        <li><a href="">Ipsum dollar</a></li>
        <li><a href="">Lorem Ipsum dollar</a></li>
        <li class="last"><a href="">Dollar Lorem Ipsum</a></li>
      </ul>-->
      </div>
    <div id="center-column">
      <jsp:include page="${param.view}"></jsp:include>
    </div>
    <div id="right-column"> <strong class="h">INFO</strong>
      <div class="box">Detect and eliminate viruses and Trojan horses, even new and unknown ones. Detect and eliminate viruses and Trojan horses, even new and </div>
    </div>
  </div>
  <div id="footer"></div>
</div>
</html>

