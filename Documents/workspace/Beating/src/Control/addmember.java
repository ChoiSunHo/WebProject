package Control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.MemberDAO;
import Member.MemberDTO;

/**
 * Servlet implementation class addmember
 */

@WebServlet("/addmember.do")
public class addmember extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession session;
	MemberDAO memberDao;
	MemberDTO memberDto;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addmember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("addmember.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 로그인 인증과정 
				String id = request.getParameter("_id");
				String pw = request.getParameter("_pw");
				String name = request.getParameter("_name");
				String phone = request.getParameter("_phone");
				String addr = request.getParameter("_addr");
				
				System.out.println(id + pw + name + phone + addr);
				
				memberDao = new MemberDAO();
				memberDto = memberDao.compareMember(id, pw);
				
				//아이디가 없을 경우 회원 가입이 가능하다 
				if(memberDto.getMemberId().equals("noid")){
					
					memberDto.setMemberId(id);
					memberDto.setMemberPw(pw);
					memberDto.setMemberName(name);
					memberDto.setMemberPhone(phone);
					memberDto.setMemberAddr(addr);
					memberDto.setMemberPower(0);
					
					memberDao.addMember(memberDto);
					
					session = request.getSession();
					session.setAttribute("memberId", memberDto.getMemberId());
					session.setAttribute("memberName", memberDto.getMemberName());
					
					response.sendRedirect("main2.jsp");
				}else{
					RequestDispatcher rd = request.getRequestDispatcher("addmember.jsp?stat=alreadyid&id="+id+
							"&pw="+pw+"&name="+name+"&phone="+phone+"&addr="+addr);
					rd.forward(request,response);
				}
	}

}
