<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "java.sql.*"%>
    <%request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name = "viewpoint" content = "widht = device-width">
<title>Insert title here</title>
</head>
<body>
<h1>대회일정 추가하는 페이지</h1>
<div class = "container">
	<div class = "row">
	<form action = "addcompeAction.jsp" method = "post">
	
	<table style="text-align:center; border:1px solid #dddddd">
	<thead>
		<tr>
			<th style = "bacground-color : #eeeeee; text-align:center;">대회일정 추가 양식</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><input type = "text" placeholder = "글 제목" name = "CompeTitle" maxlength = "50" ></td>
			</tr>
			
			<tr>
			<td><textarea  placeholder = "글 내용" name = "CompeContent" maxlength = "2048" style = "height:350px;" ></textarea></td>
		</tr>
	
	</tbody>
	</table>
	<%//if (session.getAttribute("UserID") == "admin"){ %>
	<% //(주석)  대회일정이니 관리자만 글을 작성할 수 있게 하고싶었음 (되는지 안되는지 잘 모름...)
	//(주석)  admin은 임의로 정한 것!  %>
	<input type = "submit" value = "글등록" > 
	<%//} %>
	</form>
	</div>
</div>

</body>
</html>