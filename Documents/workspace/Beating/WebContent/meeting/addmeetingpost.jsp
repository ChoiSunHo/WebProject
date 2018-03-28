<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.io.PrintWriter" %>

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
    	<div>
	<div>
	<form method ="post" action="writeAction.jsp">
		<table  style="text-align: center;border:1px soid #dddddd"> 
			<thead> <%--테이블 제목--%>
			 	<tr>
		 			<th colspan ="2" style = "background-color:#eeeee; text=align: center;">게시판 글쓰기 양식</th>
		
		 		</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text"  placeholder="글 제목" name="meetingTitle" maxlength="50"></td>
				</tr>
				<tr>
				<td><textarea  placeholder="글 내용" name="meetingContent" maxlength="2048" style="height: 350px;"></textarea></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="글쓰기">
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