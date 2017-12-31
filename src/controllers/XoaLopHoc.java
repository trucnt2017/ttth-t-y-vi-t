package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataAccess.DataProvider;

@WebServlet("/XoaLopHoc")
public class XoaLopHoc extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public XoaLopHoc() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataProvider dataProvider = new DataProvider("jdbc:mysql://localhost/csdlwebthtv2?useUnicode=true&characterEncoding=utf-8", "root", "123456789");
		dataProvider.executeUpdate("call csdlwebthtv2.spXoaLopHoc(?)", request.getParameter("maLop"));
		response.sendRedirect("/TinHocTayViet/LoadQuanLyLopHoc");
		return;
	}

}
