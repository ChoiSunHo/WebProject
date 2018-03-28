<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "java.io.PrintWriter"%>
    <%@page import = "Competition.CompetitionDAO" %>
    <%@page import = "Competition.Competition" %>
    <%request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>대회일정 추가하는 부분 뒷배경</h1>

<%
	String userID = null;
	
	/*if(session.getAttribute("CompeID") != null){
		UserID = (String)session.getAttribute("CompeID");
	}
	if(UserID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요!')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}*/ 
	
	int compeNum = 0;
	if(request.getParameter("compeNum") != null){
		compeNum = Integer.parseInt(request.getParameter("CompeNum"));
	}
	if(compeNum == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'compeschedule.jsp'");
		script.println("</script>");
	}	
	
	/*Competition compe = new CompetitionDAO().getCompetition(CompeNum);
	if(!UserID.equals(compe.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'compeschedule.jsp'");
		script.println("</script>");
	}   */     //아이디 맞는지 확인하고 틀리면 권한이 없다는 말을 띄운다.
	else  {  
			CompetitionDAO compeDAO = new CompetitionDAO();
			int result = compeDAO.delete(compeNum);
			
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글삭제 실패')");
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
%>
</body>
</html>