package fileDown;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import pagingtestBoard.TestDAO;
import pagingtestBoard.TestDTO;

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
		
		System.out.println("저장 될 파일 이름 : "+multi.getFilesystemName("filename"));
		System.out.println("실제 파일 이름 : "+multi.getOriginalFileName("filename"));
		
		TestDAO dao = new TestDAO();
		TestDTO dto = new TestDTO();
		
		dto.setId(multi.getParameter("id"));
		System.out.println("id : "+dto.getId());
		dto.setTitle(multi.getParameter("title"));
		System.out.println("title : "+dto.getTitle());
		dto.setContent(multi.getParameter("content"));
		System.out.println("content : "+dto.getContent());
		dto.setFilename(multi.getFilesystemName("filename"));
		System.out.println("filename : "+dto.getFilename());
		
		dao.insert(dto);
		
		response.sendRedirect("/may7th/Exam_board/list.jsp?start=1");
		
		
		
	}

}
