package com.yike.dbservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yike.DAO.AccBase;
import com.yike.json.JsonOperation;

/**
 * Servlet implementation class update
 */
@WebServlet("/update")
public class update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update() {
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
		//response.setContentType("text/plain;charset=UTF-8");
		String accordion_id =  request.getParameter("accordion_id");
		if(accordion_id!=null&&accordion_id!=""){
			String accordion_name = request.getParameter("accordion_name");
			String lever = request.getParameter("level");
			String index = request.getParameter("index");
			String icon = request.getParameter("icon");
			String system_module = request.getParameter("system_module");
			String url = request.getParameter("url");
			String group = request.getParameter("group");
			String status = request.getParameter("status");
			String lastmodifier = request.getParameter("lastmodifier");
			String creator = request.getParameter("creator");
			AccBase content = new AccBase(lever, index, accordion_id, group, accordion_name, icon, system_module, url, status, lastmodifier, creator, null, null,0,"",null,null);
			response.getWriter().print(jop.tojsontext(content,"true"));
		}
	}
}
