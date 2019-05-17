package board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/reply2")
public class reply2 extends HttpServlet {
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doPost(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		totoDAO dao = new totoDAO();
		String num = request.getParameter("id");		
		int foo = Integer.parseInt(num);
		int chk = 1;
		
		String replyId = request.getParameter("replyId");
		String userId = request.getParameter("userId");
		String content = request.getParameter("content");
		
		dao.reply(foo, replyId, content);
		System.out.println("µÉ±î?");
		
		response.sendRedirect("content_view2.jsp?id="+num+"&userId="+userId+ "&chk=" + chk);
	}

}
