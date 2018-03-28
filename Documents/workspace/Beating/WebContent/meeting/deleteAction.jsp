<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="meeting.MeetingDAO"  %>
<%@ page import ="meeting.Meeting"  %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("euc-kr"); %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String userID =null;
	//if(session.getAttribute("userID") != null){
	//	userID = (String)session.getAttribute("userID");
	//}
	//if(userID == null){
	//	PrintWriter script = response.getWriter();
	//	script.println("<script>");
	//	script.println("alert('로그인 하세요.')");
	//	script.println("location.herf = 'login.jsp'"); //로그인 페이지 이동
	//	script.println("</script>");}
	
	
	int meetingID =0; //게시물 번호
	if(request.getParameter("meetingID") !=null){
		meetingID = Integer.parseInt(request.getParameter("meetingID"));
	}
	if(meetingID==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.herf = 'meetingboard.jsp'");
		script.println("</script>");
	}
		//Meeting Meeting = new MeetingDAO().getMeeting(meetingID);
		//if(!userID.equals(Meeting.getUserID())){
		//PrintWriter script = response.getWriter();
		//script.println("<script>");
		//script.println("alert('권한이 없습니다.')");
		//script.println("location.herf = 'meetingboard.jsp'");
		//script.println("</script>");
		//}
		
	else{
			MeetingDAO meetingDAO = new MeetingDAO();
			int result = meetingDAO.delete(meetingID);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제에 실패했습니다.')");
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