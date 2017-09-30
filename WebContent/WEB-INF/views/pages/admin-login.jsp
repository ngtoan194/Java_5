<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<body>
	<div style="padding-bottom: 90px;">
		<div class="login-page">
			<div class="form" style="background: brown;">
				<form class="login-form" action="check-login" method="POST" >
					<input type="text" name="username" placeholder="<s:message code="login.tendangnhap" />" /> 
					<label class="loi">${mess2 }</label>
					<input type="password" name="password" placeholder="<s:message code="login.matkhau" />" />
					<label class="loi">${mess3 }</label>
					<button><s:message code="login.button" /></button>
					<label class="loi">${mess4 }</label>
				</form>
			</div>
		</div>
	</div>
</body>
