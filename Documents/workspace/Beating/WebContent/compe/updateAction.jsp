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
<h1>��ȸ���� �߰��ϴ� �κ� �޹��</h1>

<%
	String UserID = null;
	/*if(session.getAttribute("UserID") != null){
		UserID = (String)session.getAttribute("UserID");
	}
	if(UserID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�α����� �ϼ���!')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}*/
	int CompeNum = 0;
	if(request.getParameter("CompeNum") != null){
		CompeNum = Integer.parseInt(request.getParameter("CompeNum"));
	}
	if(CompeNum == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('��ȿ���� ���� ���Դϴ�.')");
		script.println("location.href = 'compeschedule.jsp'");
		script.println("</script>");
	}	
	
	/*Competition compe = new CompetitionDAO().getCompetition(CompeNum);
	if(!UserID.equals(compe.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('������ �����ϴ�.')");
		script.println("location.href = 'compeschedule.jsp'");
		script.println("</script>");
	}        //���̵� �´��� Ȯ���ϰ� Ʋ���� ������ ���ٴ� ���� ����.
	*/
	else  {  
		if(request.getParameter("CompeTitle")==null || request.getParameter("CompeContent")==null 
		|| request.getParameter("CompeTitle").equals("") || request.getParameter("CompeContent").equals(""))
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�Է��� �� �� ������ �ִ�.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			CompetitionDAO compeDAO = new CompetitionDAO();
			int result = compeDAO.update(CompeNum, request.getParameter("CompeTitle"), request.getParameter("CompeContent"));
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�ۼ��� ����')");
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
	}
%>
</body>
</html>