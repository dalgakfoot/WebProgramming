package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bettingDB.bettingDAO;
import bettingDB.bettingDTO;

/**
 * Servlet implementation class Submoney
 */
@WebServlet("/Submoney")
public class Submoney extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		
		bettingDAO dao = new bettingDAO();
		
		String temp = request.getParameter("id");
		System.out.println("id : "+temp);
		int id = Integer.parseInt(temp);
		
		String win = request.getParameter("win");
		System.out.println("win : "+win);
		
		ArrayList<bettingDTO> arr = dao.winner(id, win);
		int sum = dao.sum(id);
		int size = arr.size();
		
		int foo = sum/size;
		System.out.println("배팅 총액 : "+sum);
		System.out.println("이긴 사람 수 : "+size);
		System.out.println("올라갈 돈 : "+foo);
		
		for(int i =0;i<arr.size();i++) {
		dao.give(id, size, sum, arr.get(i).getUserid());
		}
		
		
		
		
		response.sendRedirect("/may10th/adminPage.jsp");
		
		
	}

}
