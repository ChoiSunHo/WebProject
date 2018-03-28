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
 * Servlet implementation class updatemember
 */
@WebServlet("/updatemember.do")
public class updatemember extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession session;
	private MemberDAO memberDao;
	private MemberDTO memberDto;
	private String pw;
	private String name;
	private String phone;
	private String addr;
	private int check;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatemember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    // 회원정보 수정 jsp로 가기 전 단계 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		session = request.getSession();
		System.out.println("session "+(String)session.getAttribute("memberId"));
		
		if( session.getAttribute("memberId") != null ){
			memberDao = new MemberDAO();
			memberDto = memberDao.selectMember((String)session.getAttribute("memberId"));
			
			RequestDispatcher rd = request.getRequestDispatcher("updatemember.jsp?id="+memberDto.getMemberId()+
					"&name="+memberDto.getMemberName()
					+"&phone="+memberDto.getMemberPhone()+"&addr="+memberDto.getMemberAddr());
			rd.forward(request,response);
		} else {
			response.sendRedirect("main.do");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//회원정보 수정 jsp에서 날라옴 업데이트 해야함 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		session = request.getSession();
		pw = request.getParameter("_pw");
		name = request.getParameter("_name");
		phone = request.getParameter("_phone");
		addr = request.getParameter("_addr");
		
		memberDao = new MemberDAO();
		memberDto = new MemberDTO();
		memberDto.setMemberId((String)session.getAttribute("memberId"));
		memberDto.setMemberPw(pw);
		memberDto.setMemberName(name);
		memberDto.setMemberPhone(phone);
		memberDto.setMemberAddr(addr);
		
		check = memberDao.updateMember(memberDto);
		
		if (check==1){
			RequestDispatcher rd = request.getRequestDispatcher("updatemember.jsp?id="+memberDto.getMemberId()+"&stat=updateok"+
					"&name="+memberDto.getMemberName()+"&phone="+memberDto.getMemberPhone()+"&addr="+memberDto.getMemberAddr());
			rd.forward(request,response);
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("updatemember.jsp?stat=updatefalse"+
					"&name="+memberDto.getMemberName()+"&phone="+memberDto.getMemberPhone()+"&addr="+memberDto.getMemberAddr());
			rd.forward(request,response);
		}
	}

}
