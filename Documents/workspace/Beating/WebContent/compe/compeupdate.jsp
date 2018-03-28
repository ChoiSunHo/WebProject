<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.io.PrintWriter" %>
    <%@ page import = "Competition.Competition" %>
    <%@ page import = "Competition.CompetitionDAO" %>
    <%request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<% /*String UserID = null;
		if (session.getAttribute("UserID") != null){
			UserID = (String)session.getAttribute("UserID");
		}*/ //로그인 유지
		%>

<% 
	/*if(UserID == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 하세요!')");
	script.println("location.href = 'login.jsp'");
	script.println("</script>");
	}*/ //

	int compeNum = 0;
	if(request.getParameter("compeNum") != null){
		compeNum = Integer.parseInt(request.getParameter("compeNum"));
	}
	if(compeNum == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'compeschedule.jsp'");
		script.println("</script>");
	}	
	
	Competition compe = new CompetitionDAO().getCompetition(compeNum);
	/*if(!UserID.equals(compe.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'compeschedule.jsp'");
		script.println("</script>");
	}*/        //아이디 맞는지 확인하고 틀리면 권한이 없다는 말을 띄운다.
	
	%>
	
	<div class = "container">
	<div class = "row">
	<form method = "post" action = "updateAction.jsp?CompeNum=<%=compeNum %>">
	
	<table style="text-align:center; border:1px solid #dddddd">
	<thead>
		<tr>
			<th style = "bacground-color : #eeeeee; text-align:center;">대회일정 추가 양식</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><input type = "text" placeholder = "글 제목" name = "CompeTitle" maxlength = "50" value = "<%=compe.getCompeTitle() %>" ></td>
			</tr>
			
			<tr>
			<td><textarea  placeholder = "글 내용" name = "CompeContent" maxlength = "2048" style = "height:350px;" ><%=compe.getCompeContent()%></textarea></td>
		</tr>
	
	</tbody>
	</table>
	<input type = "submit" value = "수정">
	</form>
	</div>
</div>
</body>
</html>