<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
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
				<h2><img src="images/title_marker1.jpg" alt=""><s:message code="mail.title" /></h2>
				<form id="ContactForm" action="send" method="post">
					<div>
						<div class="wrapper">
							<p><input name="from" placeholder="<s:message code="mail.address" />" class="input" style="border: 1px solid;"></p>
						</div>
						<div class="wrapper">
							<p><input name="to" placeholder="To" type="hidden" value="toanndph04367@fpt.edu.vn" class="input" style="border: 1px solid;"></p>
						</div>
						<div class="wrapper">
							<p><input name="subject" placeholder="<s:message code="mail.subject" />" class="input" style="border: 1px solid;"></p>
						</div>
						<div class="textarea_box">
							<p><textarea name="body" placeholder="<s:message code="mail.message" />" cols="1" rows="1" style="border: 1px solid;"></textarea></p>
						</div>
						<div class="wrapper">
							<p style="float: right;">${message }</p>
						</div>
						<button style="float: right; color: yellow; background: black; height: 30px; width: 50px;"><s:message code="mail.button" /></button>
					</div>
				</form>


			</div>
		</div>

	</div>
	<div class="pad">
		<h2>Our Contacts</h2>
		<div class="line2">
			<div class="wrapper line3">
				<div class="col1">
					<p class="pad_bot1">
						<strong class="color2">USA</strong>
					</p>
					<p class="pad_bot1">8901 Marmora Road, Glasgow, D04</p>
					<p class="cols">
						Freephone:<br> Telephone:<br> Fax:<br> Email:
					</p>
					+1 800 559 6580<br> +1 800 603 6035<br> +1 800 889 9898<br>
					<a href="mailto:" class="color1">mail@demolink.org</a>
				</div>
				<div class="col1 pad_left1">
					<p class="pad_bot1">
						<strong class="color2">Canada</strong>
					</p>
					<p class="pad_bot1">8901 Marmora Road, Glasgow, D04</p>
					<p class="cols">
						Freephone:<br> Telephone:<br> Fax:<br> Email:
					</p>
					+1 800 559 6580<br> +1 800 603 6035<br> +1 800 889 9898<br>
					<a href="mailto:" class="color1">mail@demolink.org</a>
				</div>
				<div class="col1 pad_left1">
					<p class="pad_bot1">
						<strong class="color2">Mexico</strong>
					</p>
					<p class="pad_bot1">8901 Marmora Road, Glasgow, D04</p>
					<p class="cols">
						Freephone:<br> Telephone:<br> Fax:<br> Email:
					</p>
					+1 800 559 6580<br> +1 800 603 6035<br> +1 800 889 9898<br>
					<a href="mailto:" class="color1">mail@demolink.org</a>
				</div>
			</div>
		</div>
	</div>
</article>
<!--content end-->