<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "meeting.Meeting" %>
<%@ page import = "meeting.MeetingDAO" %>
<%@ page import = "meeting.BoardComment" %>
<%@ page import = "meeting.BoardCommentDAO" %>
<%@ page import = "java.util.ArrayList" %>
<% request.setCharacterEncoding("euc-kr"); %> 
<jsp:useBean id="meeting" class="meeting.Meeting" scope="page"/>
<jsp:setProperty name ="meeting" property="meetingTitle"/>
<jsp:setProperty name ="meeting" property="meetingContent"/>

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
		int pageNumber1 = 1;
		if(request.getParameter("pageNumber1") !=null){
		pageNumber1 = Integer.parseInt(request.getParameter("pageNumber1"));
		}
	

		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	
		int meetingID = 0;
		if(request.getParameter("meetingID") !=null){
			meetingID = Integer.parseInt(request.getParameter("meetingID"));
		}
		int commentID = 0;
		if(request.getParameter("commentID") !=null){
			meetingID = Integer.parseInt(request.getParameter("commentID"));
		}
		if(meetingID ==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.herf = 'meetingboard.jsp'");
			script.println("</script>");
		}
		Meeting Meeting = new MeetingDAO().getMeeting(meetingID);
		BoardComment Comment = new BoardCommentDAO().getBoardComment(commentID);
	%>
<div >
	<div >
		<table  style="text-align: center;border:1px soid #dddddd">
			<thead> <%--테이블 제목--%>
			 	<tr>
		 			<th colspan ="3" style = "background-color:#eeeee; text=align: center;">게시판 글 보기</th>
		 		</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 20%;">글 제목</td>
					<td colspan="2"><%=Meeting.getMeetingTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;")
					.replaceAll(">","&gt;").replaceAll("\n","<br>")%></td>  <%--스크립트 공격 막기위함 --%>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2"><%=Meeting.getUserID()%></td>
				</tr>
				<tr>
					<td>작성일자</td>
					<td colspan="2"><%= Meeting.getMeetingDate().substring(0,11)+
										Meeting.getMeetingDate().substring(11,13)+"시"+
										Meeting.getMeetingDate().substring(14,16)+"분"%></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="2" style="min-height:200px; text-align:left;">
					<%=Meeting.getMeetingContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;")
					.replaceAll(">","&gt;").replaceAll("\n","<br>")%></td>
				</tr>
			</tbody>
		</table>
		<a href="meetingboard.jsp" >목록</a>
		<%--
			if(userID != null && userID.equals(meeting.getUserID())){
		--%>
			<a href="update.jsp?meetingID=<%=meetingID%>">수정</a>
			<a href="deleteAction.jsp?meetingID=<%=meetingID%>">삭제</a>
		<%--
			}
		--%>
	</div>
	<div>
	<form method ="post" action="commentwriteAction.jsp?meetingID=<%=meetingID%>">
		<table>
			<thead>
				<tr> 
				<th colspan ="2" style = "background-color:#eeeee; text=align: center;">댓글</th>
				</tr>
				<tr>
					<td style = " text=align: center;">작성자</td>
					<td	style = " text=align: center;">내용</td>
					<td	style = " text=align: center;">작성일자</td>
				</tr>
			</thead>
			<tbody>
			<%
			BoardCommentDAO boardcommentDAO = new BoardCommentDAO();
			ArrayList<BoardComment> list = boardcommentDAO.getList(pageNumber1);
			boardcommentDAO.delete1();

			for(int i=0; i<list.size();i++){
			%>
			<tr>
					<td><%= list.get(i).getUserID()%></td>
					<td><%= list.get(i).getCommentContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;")
							.replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
					<td><%= list.get(i).getCommentDate().substring(0,11) + 
							list.get(i).getCommentDate().substring(11,13)+"시"+
							list.get(i).getCommentDate().substring(14,16)+"분" %></td>
					<td><a href="commentdeleteAction.jsp?meetingID=<%=meetingID%>&commentID=<%=list.get(i).getCommentID()%>">삭제</a></td>
			</tr>
			<%
				}
			%>
			</tbody>
				
		</table>
		<table>
			<%
					if(pageNumber1 != 1){
				%>
					<a href="view.jsp?meetingID=<%=meetingID%>&pageNumber1=<%=pageNumber1 -1 %>" class="btn btn-success btn-arraw-left">이전</a>
				<%
					}if(boardcommentDAO.nextPage(pageNumber1+1)){
				%>
					<a href="view.jsp?meetingID=<%=meetingID%>&pageNumber1=<%=pageNumber1 +1 %>" class="btn btn-success btn-arraw-left">다음</a>
				<%
					}
				%>
			<tr>
				<td><textarea  placeholder="댓글 내용" name="commentContent" maxlength="2048" style="height: 50px; width:500px;"></textarea></td>
				<td><input type="submit" value="댓글달기"></td>
			</tr>
		</table>
		</form>
	</div>
</div>

  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  </table>


</body>
</html>