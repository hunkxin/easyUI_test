package com.yike.dbservlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yike.json.JsonOperation;

/**
 * Servlet implementation class delete
 */
@WebServlet("/delete")
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete() {
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
		Map<String, ?> menumap = request.getParameterMap();
		Iterator<String> iter = menumap.keySet().iterator();
        List<String> menuids = new ArrayList<String>();
        while (iter.hasNext()) {
            String key = iter.next();
            
            String[] value =  (String[]) menumap.get(key);
            for(String v:value){                
            	menuids.add(v);
            } 
        }
		System.out.println(menuids);
		response.getWriter().print(jop.tojsontext(menuids));
	}
}
