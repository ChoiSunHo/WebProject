<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "meeting.Meeting" %>
<%@ page import = "meeting.MeetingDAO" %>
<%@ page import = "java.util.ArrayList" %>
<% request.setCharacterEncoding("euc-kr"); %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

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
    	 
<%
	int pageNumber = 1;
	if(request.getParameter("pageNumber") !=null){
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}
	
%>
<div >
	<div >
		<table  style="text-align: center;border:1px soid #dddddd"> <%--게시판글 테이블 색상변경 1/2 --%>
			<thead> <%--테이블 제목--%>
			 	<tr>
		 			<th style = "background-color:#FFFFFF; text=align: center;"><img src="https://i.imgur.com/0Z7LoL7.png" height="30px"  /></th>
		 			<th style = "background-color:#FFFFFF; text=align: center;"><img src="https://i.imgur.com/ql9z5T0.png" height="30px"  /></th>
		 			<th style = "background-color:#FFFFFF; text=align: center;"><img src="https://i.imgur.com/23O0EuV.png"  height="30px" /></th>
		 			<th style = "background-color:#FFFFFF; text=align: center;"><img src="https://i.imgur.com/UGYzB3g.png" height="30px"  /></th>
		 		</tr>
			</thead>
			<tbody>
				<%
					MeetingDAO meetingDAO = new MeetingDAO();
					ArrayList<Meeting> list = meetingDAO.getList(pageNumber);
					meetingDAO.delete1();
					for(int i=0; i<list.size();i++){
				%>
				<tr>
					<td bgcolor="#FFFFFF"><%= list.get(i).getMeetingID() %></td>
					<td bgcolor="#FFFFFF"><a href="view.jsp?meetingID=<%=list.get(i).getMeetingID() %>">
						<%= list.get(i).getMeetingTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;")
					.replaceAll(">","&gt;").replaceAll("\n","<br>")%></a></td> <%-- 스크립트 공격 예외처리 --%>
					<td bgcolor="#FFFFFF"><%= list.get(i).getUserID() %></td>
					<td bgcolor="#FFFFFF"><%= list.get(i).getMeetingDate().substring(0,11) + 
							list.get(i).getMeetingDate().substring(11,13)+ "시"+
							list.get(i).getMeetingDate().substring(14,16)+"분" %></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
				<%
					if(pageNumber != 1){
				%>
					<a href="meetingboard.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arraw-left"><img src="https://i.imgur.com/seDFj2Y.png" height="30px" /></a>
				<%
					}if(meetingDAO.nextPage(pageNumber+1)){
				%>
					<a href="meetingboard.jsp?pageNumber=<%=pageNumber +1 %>" class="btn btn-success btn-arraw-left"><img src="https://i.imgur.com/IkaNgff.png" height="30px"  /></a>
				<%
					}
				%>
		<a href="addmeetingpost.jsp"><img src="https://i.imgur.com/HbkwncN.png" height="40px"  /></a>
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