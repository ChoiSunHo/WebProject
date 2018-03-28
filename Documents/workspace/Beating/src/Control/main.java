package Control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class main
 */
@WebServlet("/main.do")
public class main extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession session;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public main() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		//request.getRequestDispatcher("main.jsp").forward(request, response);
			
		session = request.getSession();
		
		//세션이 없을 경우 main.jsp, 있을 경우 main2.jsp 
		if ((String)session.getAttribute("memberId")==null){
			response.sendRedirect("main.jsp");
		}else{
			response.sendRedirect("main2.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
