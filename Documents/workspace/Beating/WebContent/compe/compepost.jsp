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
<h1>대회일정 자세히 보여주는 페이지</h1>
<% 
    /* String UserID = null;  
	if(session.getAttribute("UserID") != null) { 
		UserID = (String)session.getAttribute("UserID");
	}	*/     //로그인 유지
	
	int compeNum = 0;
	if(request.getParameter("compeNum") != null){
		compeNum = Integer.parseInt(request.getParameter("compeNum"));
	}
	/*if(CompeNum == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'compeschedule.jsp'");
		script.println("</script>");
	}*/
	
	Competition Competition = new CompetitionDAO().getCompetition(compeNum);
%>
<div class = "container">
	<div class = "row">
	
	<table style="text-align:center; border:1px solid #dddddd">
	<thead>
		<tr>
			<th colspan = "3" style = "bacground-color : #eeeeee; text-align:center;">게시판 글 보기</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td style = "width : 20%;">글 제목</td>
			<td colspan = "2"><%= Competition.getCompeTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&lt;").replaceAll("\n","<br>") %></td>
			</tr>
			
			<tr>
			<td>작성자</td>
			<td colspan = "2"><%= Competition.getUserID() %></td>
			</tr>
			
			<tr>
			<td>작성일자</td>
			<td colspan = "2"><%= Competition.getCompeDate().substring(0,11) + Competition.getCompeDate().substring(11,13) + "시" + Competition.getCompeDate().substring(14,16) + "분" %></td>
			</tr>
			
			<tr>
			<td>글 내용</td>
			<td colspan = "2" style = "min-height:200px; text-align:left;"><%= Competition.getCompeContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&lt;").replaceAll("\n","<br>") %></td>
			</tr>
			
			
		
	</tbody>
	</table>
	<a href = "compeschedule.jsp" >목록</a>
	<%
	/*if(UserID != null && session.getAttribute("UserID") == "admin" ){*/  //유저아이디가 어드민과 같다면 a태그 나와라
		%>
		<a href = "compeupdate.jsp?compeNum=<%=compeNum %>">수정</a>
		<a onclick = "return confirm('정말로 삭제하시겠습니까?')" href = "deleteAction.jsp?compeNum=<%=compeNum %>">삭제</a>
	<% /*}*/%>
	</div>
</div>
</body>
</html>