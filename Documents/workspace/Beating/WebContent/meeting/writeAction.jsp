<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="meeting.MeetingDAO"  %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("euc-kr"); %> 
<jsp:useBean id="meeting" class="meeting.Meeting" scope="page"/>
<jsp:setProperty name ="meeting" property="meetingTitle"/>
<jsp:setProperty name ="meeting" property="meetingContent"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String userID =null;
	if(session.getAttribute("memberId") != null){
		userID = (String)session.getAttribute("memberId");
	}else{
		userID="noid";
	}
	//if(userID == null){
	//	PrintWriter script = response.getWriter();
	//	script.println("<script>");
	//	script.println("alert('로그인 하세요.')");
	//	script.println("location.herf = 'login.jsp'"); //로그인 페이지 이동
	//	script.println("</script>");}else{
		if(meeting.getMeetingTitle() == null || meeting.getMeetingContent() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back");
			script.println("</script>");
		}else{
			MeetingDAO meetingDAO = new MeetingDAO();
			int result = meetingDAO.write(meeting.getMeetingTitle(),userID,meeting.getMeetingContent());
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다.')");
				script.println("history.back");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href ='meetingboard.jsp'");
				script.println("</script>");
			}
		}
	
	
%>
</body>
</html>