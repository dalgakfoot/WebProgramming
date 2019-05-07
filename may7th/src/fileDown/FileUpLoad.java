package fileDown;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FileUpLoad
 */
@WebServlet("/FileUpLoad")
public class FileUpLoad extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String path = getServletContext().getRealPath("fileUpDown");
		
		int size = 1024*1024*10;
		
		MultipartRequest multi = new MultipartRequest(request, path,size,"utf-8",new DefaultFileRenamePolicy());
		
		System.out.println("저장 될 파일 이름 : "+multi.getFilesystemName("file"));
		System.out.println("실제 파일 이름 : "+multi.getOriginalFileName("file"));
		
		response.sendRedirect("fileUpLoad.jsp");
		
		
		
	}

}
