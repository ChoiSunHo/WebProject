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
	}else  { //��ȸ�����̴� �����ڸ� ���� �ۼ��� �� �ְ� �ϰ�;��� (�Ǵ��� �ȵǴ��� �� ��...)
		//admin�� ���Ƿ� ���� ��! */
		if(competition.getCompeTitle()==null || competition.getCompeContent()==null )
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�Է��� �� �� ������ �ִ�.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			CompetitionDAO compeDAO = new CompetitionDAO();
			int result = compeDAO.write(competition.getCompeTitle(), UserID,competition.getCompeContent());
			
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�۾��� ����')");
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