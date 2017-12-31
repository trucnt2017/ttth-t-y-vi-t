package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataAccess.DataProvider;

/**
 * Servlet implementation class XoaTaiKhoan
 */
@WebServlet("/XoaTaiKhoan")
public class XoaTaiKhoan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XoaTaiKhoan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DataProvider dataProvider = new DataProvider("jdbc:mysql://localhost/csdlwebthtv2?useUnicode=true&characterEncoding=utf-8", "root", "123456789");
		
		dataProvider.executeUpdate("call csdlwebthtv2.spXoaTaiKhoan(?)", request.getParameter("tenDN"));
		
		response.sendRedirect("/TinHocTayViet/TaiQuanLyTaiKhoan");
		return;
	}

}
