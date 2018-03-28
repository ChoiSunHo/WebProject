<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "java.sql.*"%>
    <%@page import = "java.io.PrintWriter" %>
    <%@page import = "Competition.CompetitionDAO" %>
    <%@page import = "Competition.Competition" %>
    <%@page import = "java.util.ArrayList" %>
    <%request.setCharacterEncoding("euc-kr"); %>
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
		/*String UserID = null;
		if (session.getAttribute("UserID") != null){
			UserID = (String)session.getAttribute("UserID");
		}*/ //로그인 유지
		int pageNumber = 1; //기본페이지
		if (request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	
	
	
	%>

<div class = "container">
	<div class = "row">
	<table style="text-align:center; border:1px solid #dddddd">
	<thead>
		<tr>
			<th style = "background-color : #FFFFFF; text-align:center;"><img src="https://i.imgur.com/0Z7LoL7.png" height="30px" /></th>
			<th style = "background-color : #FFFFFF; text-align:center;"><img src="https://i.imgur.com/ql9z5T0.png" height="30px" /></th>
			<th style = "background-color : #FFFFFF; text-align:center;"><img src="https://i.imgur.com/23O0EuV.png" height="30px" /></th>
			<th style = "background-color : #FFFFFF; text-align:center;"><img src="https://i.imgur.com/UGYzB3g.png" height="30px" /></th>
		</tr>
	</thead>
	<tbody>
	<%
		CompetitionDAO compeDAO = new CompetitionDAO();
	ArrayList<Competition> list = compeDAO.getList(pageNumber);
	for(int i = 0; i < list.size(); i ++){
		%>
	<tr>
		<td bgcolor="#FFFFFF" > <%=list.get(i).getCompeNum() %></td> 
		<td bgcolor="#FFFFFF"><a href = "compepost.jsp?compeNum=<%= list.get(i).getCompeNum()%>"><%=list.get(i).getCompeTitle() %></a></td>
		<td bgcolor="#FFFFFF"> <%=list.get(i).getCompeID() %></td>
		<td bgcolor="#FFFFFF"> <%=list.get(i).getCompeDate().substring(0,11) + list.get(i).getCompeDate().substring(11,13) + "시" + list.get(i).getCompeDate().substring(14,16) + "분" %></td>
		</tr>
	<% 
	}
	%>
		
	</tbody>
	</table>
	<%
		if(pageNumber != 1){
			%>
			<a href = "compeschedule.jsp?pageNumber=<%=pageNumber - 1%>" class = "btn btn-success btn-arrow-Left"><img src="https://i.imgur.com/seDFj2Y.png" height="30px" /></a>
		
		<%} if(compeDAO.nextPage(pageNumber + 1)) { %>
		
			<a href = "compeschedule.jsp?pageNumber=<%=pageNumber + 1%>" class = "btn btn-success btn-arrow-Left"><img src="https://i.imgur.com/IkaNgff.png" height="30px"  /></a>
		<%} %>
		
		
		
	<a href = "addcompepost.jsp" ><img src="https://i.imgur.com/HbkwncN.png" height="40px"  /></a>
	
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