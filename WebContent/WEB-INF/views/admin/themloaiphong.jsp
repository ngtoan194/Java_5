<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="top-bar">
	<h1>Quản lý loại phòng</h1>
</div>
<br />
<div class="select-bar">
	<label> <input type="text" name="textfield" />
	</label> <label> <input type="submit" name="Submit" value="Tìm kiếm" />
	</label>
</div>
<div class="table"><form:form action="themloaiphong" modelAttribute="loai_phong" method="post" enctype="multipart/form-data"><img src="admin-imgs/bg-th-left.gif" width="8" height="7" alt="" class="left" />
      <img src="admin-imgs/bg-th-right.gif" width="7" height="7" alt="" class="right" />
        <table class="listing form" cellpadding="0" cellspacing="0">
          <tr>
            <th class="full" colspan="2">Thêm loại phòng <h3 style="color: red;">${message }</h3></th>
          </tr>
          <tr>
            <td class="first" width="172"><strong>Mã loại phòng</strong></td>
            <td class="last"><form:input path="ID_LP" /><form:errors path="ID_LP"/></td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Tên loại phòng</strong></td>
            <td class="last"><form:input path="TEN_LOAI" /><form:errors path="TEN_LOAI"/></td>
          </tr>
          <tr>
            <td class="first"><strong>Mô tả</strong></td>
            <td class="last"><form:textarea path="MO_TA" rows="4" cols="26"/><form:errors path="MO_TA"/></td>
          </tr>
          <tr class="bg">
            <td class="first"><strong>Ảnh</strong></td>
            <td class="last"><input style="background: yellow; margin-left: 40px; " type="file" name="anh" /><form:errors path="ANH"/></td>
          </tr>
        </table>
        <h3 style="color: red;">${mess3}</h3>
        <button name="insert" class="button">Thêm</button>
        </form:form>
      </div>