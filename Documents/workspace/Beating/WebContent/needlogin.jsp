<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <th class="tg-yw4l"><a href="/Beating/addmember.do"><img src="https://i.imgur.com/NV2Zicg.png"  /></th></tr>
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
    <td class="tg-yw4l" colspan="2"><a href="/Beating/compe/compeschedule.jsp"><img src="https://i.imgur.com/mF8cNdM.png"  /></td><td class="tg-yw4l"></td>
    <td class="tg-yw4l"></td>
  </tr>
    <tr>
    <td class="tg-yw4l" colspan="14"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="14"></td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="7" rowspan="3" align="right">
	<!-- 아이디 패스워드 입력받는 부분 -->
<form action="login.do" method="post">
	<table border="0">
		<tr>
			<td>
				<img src="https://i.imgur.com/6mM1t2Y.png" align="right" />			</td>
			<td>
				<input type="text" name="_id" style="text-align:center; width:200px; height:40px;">
			</td>
			<td>
				<input type="image" name="submit" src="https://i.imgur.com/SIDJRRb.png" height:"40px" />
			</td>
		</tr>
		<tr>
			<td>
				<img src="https://i.imgur.com/i4tILKC.png" align="right" />			</td>
			<td>
				<input type="password" name="_pw" style="text-align:center; width:200px; height:40px;">
			</td>
			<td>
							</td>
		</tr>
	</table>
</form>

<%
	String stat = request.getParameter("stat");
	if (stat.equals("noid")){
		out.println("아이디가 존재하지 않습니다");
	}else if (stat.equals("incorrectpw")){
		out.println("패스워드가 일치하지 않습니다.");
	}
	%>
	</td>
    <td class="tg-yw4l" colspan="7" rowspan="3"><a href="addmember.do"><img src="https://i.imgur.com/ZlLBWuu.png" height="150px" /></td>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  </table>
  

</body>
</html>