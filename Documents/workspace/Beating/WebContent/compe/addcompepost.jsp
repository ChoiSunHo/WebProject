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
<h1>��ȸ���� �߰��ϴ� ������</h1>
<div class = "container">
	<div class = "row">
	<form action = "addcompeAction.jsp" method = "post">
	
	<table style="text-align:center; border:1px solid #dddddd">
	<thead>
		<tr>
			<th style = "bacground-color : #eeeeee; text-align:center;">��ȸ���� �߰� ���</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><input type = "text" placeholder = "�� ����" name = "CompeTitle" maxlength = "50" ></td>
			</tr>
			
			<tr>
			<td><textarea  placeholder = "�� ����" name = "CompeContent" maxlength = "2048" style = "height:350px;" ></textarea></td>
		</tr>
	
	</tbody>
	</table>
	<%//if (session.getAttribute("UserID") == "admin"){ %>
	<% //(�ּ�)  ��ȸ�����̴� �����ڸ� ���� �ۼ��� �� �ְ� �ϰ�;��� (�Ǵ��� �ȵǴ��� �� ��...)
	//(�ּ�)  admin�� ���Ƿ� ���� ��!  %>
	<input type = "submit" value = "�۵��" > 
	<%//} %>
	</form>
	</div>
</div>

</body>
</html>