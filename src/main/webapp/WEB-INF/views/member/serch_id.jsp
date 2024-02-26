<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="${path}/css/member/serch.css">
<script src="${path}/resources/js/jquery.js"></script>
<script src="${path}/resources/js/member/s_id.js"></script>
</head>
<body>
<div class="CARBig">
<%-- include : main --%>
<%@ include file="../include/header.jsp" %>
</div>
<div class="CARBig">
<form action="serch_id_email_ck" method="post">
<div id="wrap">
	<div id="serchform"> 
		<div id="logo">
			
			<p id="logoP">아이디 찾기</p>
			아이디는 가입시 입력하신 이메일을 통해 찾을 수 있습니다.
			
		</div>
		<div id="id_form">
		<%-- 
				<div id="id_name">
					<input id="m_name" name="m_name" placeholder="이름"
					onfocus="this.placeholder=''" onblur="this.placeholder='이름'" autocomplete="off">
				</div>--%>
				<div id="email_form">
					<input id="m_email" name="m_email" placeholder="이메일"
					onfocus="this.placeholder=''" onblur="this.placeholder='이메일'" autocomplete="off">
				</div>
				<div id="button_form1">
					<input type="submit" id="btn01"  value="인증번호받기" onclick="return serch_email();">
				</div>
				
			</div>
			</div>
	</div>
</form>
</div>
<div class="CARBig">
<%-- include : footer --%>
<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>