<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지</title>
<link rel="stylesheet" type="text/css" href="${path}/css/serch_id.css">
<script src="${path}/js/jquery.js"></script>
<script src="${path}/js/s_id.js"></script>
</head>
<body>
<%-- include : main --%>
<%@ include file="../include/header.jsp" %>
<div id="wrap">
	<div id="serchform"> 
		<div id="logo">
			
			<p id="logoP">아이디 찾기</p>
			아이디는 가입시 입력하신 이메일을 통해 찾을 수 있습니다.
			
		</div>
		<div id="name_form">
				<div id="id_name">
					<input id="m_name" name="m_name" placeholder="이름"
					onfocus="this.placeholder=''" onblur="this.placeholder='이름'">
				</div>
				<div id="email_form">
					<input id="m_email" name="m_email" placeholder="이메일"
					onfocus="this.placeholder=''" onblur="this.placeholder='이메일'">
				</div>
				<div id="button_form1">
					<input type="button" id="btn01"  value="인증번호받기" onclick="return serch_email();">
				</div>
				
				<div id="ck_form">
					<input id="ck_email" name="ck_email" placeholder="인증번호"
					onfocus="this.placeholder=''" onblur="this.placeholder='인증번호'">
				</div>
				<div id="button_form">
					<input type="button" id="btn02" value="찾기" onclick="return last_ck();">
					<%--이메일 인증 안 되면 alert 이메일을 먼저 인증해주세요. --%>
				</div>
			</div>
	</div>
</div>


<%-- include : footer --%>
<%@ include file="../include/footer.jsp" %>

</body>
</html>