<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "meeting.Meeting" %>
<%@ page import = "meeting.MeetingDAO" %>
<% request.setCharacterEncoding("euc-kr"); %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	String userID = null;
	//if(session.getAttribute("userID") != null){
	//	userID = (String)session.getAttribute("userID");
	//}
	//if(userID == null){
	//	PrintWriter script = response.getWriter();
	//	script.println("<script>");
	//	script.println("alert('�α��� �ϼ���.')");
	//	script.println("location.herf = 'login.jsp'"); //�α��� ������ �̵�
	//	script.println("</script>");
	//}
	
	int meetingID = 0; //�Խù� ��ȣ
	if(request.getParameter("meetingID") !=null){
		meetingID = Integer.parseInt(request.getParameter("meetingID"));
	}
	if(meetingID ==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('��ȿ���� ���� ���Դϴ�.')");
		script.println("location.herf = 'meetingboard.jsp'");
		script.println("</script>");
	}
	Meeting Meeting = new MeetingDAO().getMeeting(meetingID);
	//if(!userID.equals(Meeting.getUserID())){
	//	PrintWriter script = response.getWriter();
	//	script.println("<script>");
	//	script.println("alert('������ �����ϴ�.')");
	//	script.println("location.herf = 'meetingboard.jsp'");
	//	script.println("</script>");
	//}
	
%>

<style>
html { 
 background: url('https://i.imgur.com/vdYQpnY.png') no-repeat center center fixed; 
 -webkit-background-size: cover;
 -moz-background-size: cover;
 -o-background-size: cover;
 background-size: cover;
}

</style>
<style>
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;}
.tg .tg-yw4l{vertical-align:top}
</style>
<table class="tg" align=center>
 <tr>
    <th class="tg-yw4l"><img src="https://i.imgur.com/38ZsHJb.png"  /></th>
    <th class="tg-yw4l"><img src="https://i.imgur.com/rycWgQL.png"  /></th>
    <th class="tg-yw4l"><img src="https://i.imgur.com/R4uf9BY.png"  /></th>
    <th class="tg-yw4l" colspan="8"><a href="/Beating/main.do"><img src="https://i.imgur.com/DvzYV4i.png"  /></th>
    <th class="tg-yw4l"><a href="/Beating/main.do"><img src="https://i.imgur.com/zytes9n.png"  /></th>
    <th class="tg-yw4l"><a href="/Beating/needlogin.do"><img src="https://i.imgur.com/Szsl4SW.png"  /></th>
    <th class="tg-yw4l"><a href="/Beating/addmember.do"><img src="https://i.imgur.com/NV2Zicg.png"  /></th>
    </tr>
  <tr>
    <td class="tg-yw4l" colspan="14"></td>
  </tr>
  <tr>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l" colspan="2"><a href="/Beating/intro/introclimbing.jsp"><img src="https://i.imgur.com/mEDnwE3.png"  /></td>
    <td class="tg-yw4l" colspan="2"><a href="/Beating/meeting/meetingboard.jsp"><img src="https://i.imgur.com/2p7avXr.png"  /></td>
    <td class="tg-yw4l" colspan="2"><a href="/Beating/video/ski.jsp"><img src="https://i.imgur.com/63wbZdw.png"  /></td>
    <td class="tg-yw4l" colspan="2"><a href="/Beating/compe/compeschedule.jsp"><img src="https://i.imgur.com/mF8cNdM.png"  /></td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l"></td>
    <td class="tg-yw4l"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="14"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="14"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="14" rowspan="3">
    	<div >
	<div >
	<form method ="post" action="updateAction.jsp?meetingID=<%=meetingID%>">
		<table  style="text-align: center;border:1px soid #dddddd"> <%--�Խ��Ǳ� ���̺� ���󺯰� 1/2 --%>
			<thead> <%--���̺� ����--%>
			 	<tr>
		 			<th colspan ="2" style = "background-color:#eeeee; text=align: center;">�Խ��� �� ���� ���</th>
		
		 		</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text"  placeholder="�� ����" name="meetingTitle" 
					maxlength="50" value="<%=Meeting.getMeetingTitle()%>"></td><%--���� ���� �������� --%>
				</tr>
				<tr>
				<td><textarea  placeholder="�� ����" name="meetingContent" maxlength="2048" 
				style="height: 350px;"><%=Meeting.getMeetingContent()%></textarea></td><%--���� ���� �������� --%>
				</tr>
			</tbody>
		</table>
		<input type="image" name="submit" src="https://i.imgur.com/jhY1tbV.png"  />
		</form>
	</div>
</div>
    </td>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  </table>
 
</body>
</html>