package fileDown;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDown
 */
@WebServlet("/FileDown")
public class FileDown extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("get ��� �Դϴ�.");
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		//System.out.println("post ��� �Դϴ�.");
		
		String fileName = request.getParameter("fileName");
		
		String saveDir = super.getServletContext().getRealPath("fileUpDown");
		
		File file = new File(saveDir+"/"+fileName);
		System.out.println("���ϸ� : "+fileName);
		
		String mimeType = getServletContext().getMimeType(file.toString());
		System.out.println("mimeType : "+mimeType);
		if(mimeType==null) {
			response.setContentType("application/octet-stream");
			System.out.println("���� ������ �𸦶� ���� ��.");
		}
		
		String downName = null;
		System.out.println("request.getHeader : "+request.getHeader("user-agent"));
		
		if(request.getHeader("user-agent").indexOf("Trident")==-1) {
			downName = new String(fileName.getBytes("UTF-8"),"8859_1");
			System.out.println("�ͽ��÷η� �� ����");
			
		}else {
			downName = new String(fileName.getBytes("euc-kr"),"8859_1");
			System.out.println("�ͽ��÷η� ����");
		}
		
		
		response.setHeader("Content-Disposition", "attachment;filename=\""+downName+"\";");
		
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream servletOutputStream = response.getOutputStream();
		
		byte b[] = new byte[1024];
		int data =0;
		
		while((data=(fileInputStream.read(b,0,b.length)))!=-1) {
			servletOutputStream.write(b, 0, data);
		}
		
		servletOutputStream.close();
		fileInputStream.close();
		System.out.println("������ ����");
		
		
	}

}
