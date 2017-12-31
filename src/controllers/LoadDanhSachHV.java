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

import models.DanhSachHV;


@WebServlet("/LoadDanhSachHV")
public class LoadDanhSachHV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoadDanhSachHV() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		String JDBC_DRIVER ="com.mysql.jdbc.Driver";
		try	{Class.forName(JDBC_DRIVER);}
		catch (ClassNotFoundException e)
		{throw new ServletException(e);}
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		List<DanhSachHV> entries=new ArrayList<DanhSachHV>();
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
				   DanhSachHV entry = new DanhSachHV
						   (
							rs.getString("MaHV"),
							rs.getString("HoHV"),
							rs.getString("TenHV"),
							rs.getString("Phai"),
							rs.getString("NoiSinh"));
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
		request.getRequestDispatcher("GVXemDSHV.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
