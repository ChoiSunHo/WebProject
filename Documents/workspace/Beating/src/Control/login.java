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
 * Servlet implementation class login
 */
@WebServlet("/login.do")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession session;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("main.do");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 로그인 인증과정 
		String id = request.getParameter("_id");
		String pw = request.getParameter("_pw");
		
		System.out.println(id + pw);
		MemberDAO memberDao = new MemberDAO();
		MemberDTO memberDto = memberDao.compareMember(id, pw);
		
		
		//아이디가 없을 경우 
		if(memberDto.getMemberId().equals("noid")){
			response.sendRedirect("needlogin.jsp?stat=noid");
			
		//패스워드가 틀렸을 경우 
		}else if(memberDto.getMemberId().equals("incorrectpw")){
			response.sendRedirect("needlogin.jsp?stat=incorrectpw");
		}else{
			// 로그인 성공할 경우 세션 넣어줄 것. 아이디, 이름, 
			session = request.getSession();
			session.setAttribute("memberId", memberDto.getMemberId());
			session.setAttribute("memberName", memberDto.getMemberName());
			
			RequestDispatcher rd = request.getRequestDispatcher("main2.jsp");
			rd.forward(request,response);
		}
	}

}
