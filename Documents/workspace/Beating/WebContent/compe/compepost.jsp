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
<h1>��ȸ���� �ڼ��� �����ִ� ������</h1>
<% 
    /* String UserID = null;  
	if(session.getAttribute("UserID") != null) { 
		UserID = (String)session.getAttribute("UserID");
	}	*/     //�α��� ����
	
	int compeNum = 0;
	if(request.getParameter("compeNum") != null){
		compeNum = Integer.parseInt(request.getParameter("compeNum"));
	}
	/*if(CompeNum == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('��ȿ���� ���� ���Դϴ�.')");
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
			<th colspan = "3" style = "bacground-color : #eeeeee; text-align:center;">�Խ��� �� ����</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td style = "width : 20%;">�� ����</td>
			<td colspan = "2"><%= Competition.getCompeTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&lt;").replaceAll("\n","<br>") %></td>
			</tr>
			
			<tr>
			<td>�ۼ���</td>
			<td colspan = "2"><%= Competition.getUserID() %></td>
			</tr>
			
			<tr>
			<td>�ۼ�����</td>
			<td colspan = "2"><%= Competition.getCompeDate().substring(0,11) + Competition.getCompeDate().substring(11,13) + "��" + Competition.getCompeDate().substring(14,16) + "��" %></td>
			</tr>
			
			<tr>
			<td>�� ����</td>
			<td colspan = "2" style = "min-height:200px; text-align:left;"><%= Competition.getCompeContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&lt;").replaceAll("\n","<br>") %></td>
			</tr>
			
			
		
	</tbody>
	</table>
	<a href = "compeschedule.jsp" >���</a>
	<%
	/*if(UserID != null && session.getAttribute("UserID") == "admin" ){*/  //�������̵� ���ΰ� ���ٸ� a�±� ���Ͷ�
		%>
		<a href = "compeupdate.jsp?compeNum=<%=compeNum %>">����</a>
		<a onclick = "return confirm('������ �����Ͻðڽ��ϱ�?')" href = "deleteAction.jsp?compeNum=<%=compeNum %>">����</a>
	<% /*}*/%>
	</div>
</div>
</body>
</html>