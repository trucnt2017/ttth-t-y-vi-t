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
 * Servlet implementation class LuuPhong
 */
@WebServlet("/LuuPhong")
public class LuuPhong extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private CallableStatement cst;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LuuPhong() {
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
		String mp =  request.getParameter("namemaphong");
		String tp = request.getParameter("nametenphong");		
		int sc = Integer.parseInt(request.getParameter("namesucchua"));
		String mnv = request.getParameter("namemanhanvien");
		String flat=request.getParameter("update");
		conn = dataAccess.DBConnector.getConnection();
		try
		{
			if(flat.contains("true"))
			{
				cst = (CallableStatement) conn.prepareCall("{call csdlwebthtv2.spCapNhatPhong(?,?,?,?)}");
				cst.setString(1,mp);
				cst.setString(2,tp);
				cst.setInt(3,sc);
				cst.setString(4,mnv);
				cst.executeUpdate();
				response.sendRedirect("/TinHocTayViet/TaiQuanLyPhong");
				
			}else
			{
				cst = (CallableStatement) conn.prepareCall("{call csdlwebthtv2.spThemPhong(?, ?, ?, ?)}");
				cst.setString(1,mp);
				cst.setString(2,tp);
				cst.setInt(3,sc);
				cst.setString(4,mnv);
				cst.executeUpdate();
				response.sendRedirect("/TinHocTayViet/TaiQuanLyPhong");
				
			}
			
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}
}
