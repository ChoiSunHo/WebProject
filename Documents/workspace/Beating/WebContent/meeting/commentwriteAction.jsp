<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="meeting.BoardCommentDAO"  %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("euc-kr"); %> 
<jsp:useBean id="comment" class="meeting.BoardComment" scope="page"/>
<jsp:setProperty name ="comment" property="*"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int meetingID =0; //�Խù� ��ȣ
	if(request.getParameter("meetingID") !=null){
		meetingID = Integer.parseInt(request.getParameter("meetingID"));
	}
	String userID =null;
	//if(session.getAttribute("userID") != null){
	//	userID = (String)session.getAttribute("userID");
	//}
	//if(userID == null){
	//	PrintWriter script = response.getWriter();
	//	script.println("<script>");
	//	script.println("alert('�α��� �ϼ���.')");
	//	script.println("location.herf = 'login.jsp'"); //�α��� ������ �̵�
	//	script.println("</script>");}else{
		if(comment.getCommentContent() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�Է��� �� �� ������ �ֽ��ϴ�.')");
			script.println("history.back");
			script.println("</script>");
		}else{
			BoardCommentDAO boardcommentDAO = new BoardCommentDAO();
			int result = boardcommentDAO.commentwrite(userID,comment.getCommentContent());
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�۾��⿡ �����߽��ϴ�.')");
				script.println("history.back");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href ='view.jsp?meetingID="+meetingID+"'");
				script.println("</script>");
			}
		}
	
	
%>
</body>
</html>