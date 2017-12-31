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
 * Servlet implementation class LuuNhanVien
 */
@WebServlet("/LuuNhanVien")
public class LuuNhanVien extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private CallableStatement cst;
    public LuuNhanVien() {
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
		String mnv =  request.getParameter("Manv");
		String hnv = request.getParameter("Honv");		
		String tnv = request.getParameter("Tennv");
		String p = request.getParameter("Ph");
		String ngs =  request.getParameter("Ngs");
		String ns = request.getParameter("Ns");		
		String sdt = request.getParameter("Sodt");
		String e = request.getParameter("El");
		String f =  request.getParameter("Fb");
		String cv = request.getParameter("Cv");		
		Float lcb = Float.parseFloat(request.getParameter("Lcb"));
		String flat=request.getParameter("update");
		conn = dataAccess.DBConnector.getConnection();
		try
		{
			if(flat.contains("true"))
			{
				cst = (CallableStatement) conn.prepareCall("{call csdlwebthtv2.spCapNhatNhanVien(?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?)}");
				cst.setString(1,mnv);
				cst.setString(2,hnv);
				cst.setString(3,tnv);
				cst.setString(4,p);
				cst.setString(5,ngs);
				cst.setString(6,ns);
				cst.setString(7,sdt);
				cst.setString(8,e);
				cst.setString(9,f);
				cst.setString(10,cv);
				cst.setFloat(11,lcb);
				cst.executeUpdate();
				response.sendRedirect("/TinHocTayViet/TaiQuanLyNhanVien");
				
			}else
			{
				cst = (CallableStatement) conn.prepareCall("{call csdlwebthtv2.spThemNhanVien(?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?)}");
				cst.setString(1,mnv);
				cst.setString(2,hnv);
				cst.setString(3,tnv);
				cst.setString(4,p);
				cst.setString(5,ngs);
				cst.setString(6,ns);
				cst.setString(7,sdt);
				cst.setString(8,e);
				cst.setString(9,f);
				cst.setString(10,cv);
				cst.setFloat(11,lcb);
				cst.executeUpdate();
				response.sendRedirect("/TinHocTayViet/TaiQuanLyNhanVien");
				
			}
			
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}
}
