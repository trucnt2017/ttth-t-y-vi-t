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

import models.HocVien;

/**
 * Servlet implementation class TaiQuanLyHocVien
 */
@WebServlet("/TaiQuanLyHocVien")
public class TaiQuanLyHocVien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaiQuanLyHocVien() {
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
		List<HocVien> entries=new ArrayList<HocVien>();
		Connection conn=null;
		PrintWriter out= response.getWriter();
		try
		{
			conn=dataAccess.DBConnector.getConnection();
		       try
		       {
		       Statement stmt = conn.createStatement();
			   ResultSet rs = stmt.executeQuery("SELECT * FROM csdlwebthtv2.hocvien");
			   while(rs.next())
			   {
				   HocVien entry = new HocVien
						   ( 
				             rs.getString("MaHV"),
				             rs.getString("HoHV"),
				             rs.getString("TenHV"),
				             rs.getString("Phai"),
				             rs.getString("NoiSinh"),
				             rs.getString("Facebook"),
				             rs.getString("MaLop"),
				             rs.getString("SoDT"),
				             rs.getString("Email"),
				             rs.getString("NgayDK"),
				             rs.getString("TinhTrang"),
				             rs.getString("GhiChu"),
				             rs.getString("MaNV"));
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
		request.getRequestDispatcher("NVQLyHV.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
