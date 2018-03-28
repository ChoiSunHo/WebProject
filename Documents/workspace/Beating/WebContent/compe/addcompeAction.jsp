<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "java.io.PrintWriter"%>
    <%@page import = "Competition.CompetitionDAO" %>
    <%request.setCharacterEncoding("euc-kr"); %>
    <jsp:useBean id = "competition" class = "Competition.Competition" scope = "page"/>
    <jsp:setProperty name ="competition" property="compeTitle"/>
    <jsp:setProperty name ="competition" property="compeContent"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>대회일정 추가하는 부분 뒷배경</h1>

<%
	String UserID = null;
	/*if(session.getAttribute("UserID") != null){
		UserID = (String)session.getAttribute("UserID");
	}
	if(UserID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요!')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}else  { //대회일정이니 관리자만 글을 작성할 수 있게 하고싶었음 (되는지 안되는지 잘 모름...)
		//admin은 임의로 정한 것! */
		if(competition.getCompeTitle()==null || competition.getCompeContent()==null )
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			CompetitionDAO compeDAO = new CompetitionDAO();
			int result = compeDAO.write(competition.getCompeTitle(), UserID,competition.getCompeContent());
			
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기 실패')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'compeschedule.jsp'");
				script.println("</script>");
			}
		}
	//}
%>
</body>
</html>