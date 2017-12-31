package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.CallableStatement;

/**
 * Servlet implementation class LuuTaiKhoan
 */
@WebServlet("/LuuTaiKhoan")
public class LuuTaiKhoan extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private CallableStatement cst;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LuuTaiKhoan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tk =  request.getParameter("tKhoan");
		String tht = request.getParameter("tHienThi");		
		String mk = request.getParameter("mKhau");
		String q = request.getParameter("pQuyen");
		String update=request.getParameter("taiKhoanUpdate");
		conn = dataAccess.DBConnector.getConnection();
	
		try
		{
			
			if(update.contains("true"))
			{
				//System.out.println("update " + update);
				cst = (CallableStatement) conn.prepareCall("{call csdlwebthtv2.spCapNhatTaiKhoan(?,?,?,?)}");
				cst.setString(1,  tk);
				cst.setString(2,  tht);
				cst.setString(3,  mk);
				cst.setString(4, q);
				cst.executeUpdate();
				response.sendRedirect("/TinHocTayViet/TaiQuanLyTaiKhoan");
				
				
			}else
			{
				//System.out.println(update);
				conn = dataAccess.DBConnector.getConnection();
				cst = (CallableStatement) conn.prepareCall("{call csdlwebthtv2.spThemTaiKhoan(?,?,?,?)}");
				cst.setString(1,  tk);
				cst.setString(2,  tht);
				cst.setString(3,  mk);
				cst.setString(4, q);
				cst.executeUpdate();
				response.sendRedirect("/TinHocTayViet/TaiQuanLyTaiKhoan");
				
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
