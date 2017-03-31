package com.yike.dbservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yike.json.JsonOperation;

/**
 * Servlet implementation class GetAccMenu
 */
@WebServlet("/GetAccMenu")
public class GetAccMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAccMenu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		JsonOperation jop = new JsonOperation();
		response.setContentType("text/JavaScript; charset=utf-8");
		String ispbx = request.getParameter("ispbx");
		//System.out.println(ispbx.equals("true")?true:false);
		response.getWriter().print(jop.tojson("accmenu","true".equals(ispbx)?true:false));
	}

}
