package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.NhanVien;

/**
 * Servlet implementation class TaiQuanLyNhanVien
 */
@WebServlet("/TaiQuanLyNhanVien")
public class TaiQuanLyNhanVien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaiQuanLyNhanVien() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		String JDBC_DRIVER ="com.mysql.jdbc.Driver";
		try	{Class.forName(JDBC_DRIVER);}
		catch (ClassNotFoundException e)
		{throw new ServletException(e);}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		List<NhanVien> entries=new ArrayList<NhanVien>();
		Connection conn=null;
		PrintWriter out= response.getWriter();
		try
		{
			conn=dataAccess.DBConnector.getConnection();
		       try
		       {
		       Statement stmt = conn.createStatement();
			   ResultSet rs = stmt.executeQuery("SELECT * FROM csdlwebthtv2.nhanvien");
			   while(rs.next())
			   {
				   NhanVien entry = new NhanVien
						   ( 
				             rs.getString("MaNV"),
				             rs.getString("HoNV"),
				             rs.getString("TenNV"),
				             rs.getString("Phai"),
				             rs.getString("NgaySinh"),
				             rs.getString("NoiSinh"),
				             rs.getString("SoDT"),
				             rs.getString("Email"),
				             rs.getString("Facebook"),
				             rs.getString("ChucVu"),
				             rs.getFloat("LuongCB"));
				  entries.add(entry);
			   }
		       }
		       catch(SQLException e) {  throw new ServletException(e); }
		}
		finally
		{
			try
			{if(conn!=null) conn.close();}
			catch(SQLException e){throw new ServletException(e);}
		}
		request.setAttribute("entries", entries);
		request.getRequestDispatcher("QuanLyNhanVien.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
