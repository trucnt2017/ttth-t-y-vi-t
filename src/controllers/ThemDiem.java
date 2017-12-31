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


@WebServlet("/ThemDiem")
public class ThemDiem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private CallableStatement cst;
    
    public ThemDiem() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String md =  request.getParameter("mDiem");
		String mhv = request.getParameter("mHV");		
		String ml = request.getParameter("mLop");
		String mnv = request.getParameter("mNV");
		String d = request.getParameter("d");
		String gc = request.getParameter("gChu");
		String update=request.getParameter("diemUpdate");
		conn = dataAccess.DBConnector.getConnection();
	
		try
		{
			
			if(update.contains("true"))
			{
				//System.out.println("update " + update);
				cst = (CallableStatement) conn.prepareCall("{call csdlwebthtv2.spCapNhatDiem(?, ?, ?, ?,?,?)}");
				cst.setString(1,  md);    
				cst.setString(2,  mhv);
				cst.setString(3,  ml);
				cst.setString(4, mnv);
				cst.setString(5,  d);
				cst.setString(6,  gc);
				cst.executeUpdate();
				response.sendRedirect("/TinHocTayViet/QuanLiDiem");
				
				
			}else
			{
				//System.out.println(update);
				conn = dataAccess.DBConnector.getConnection();
				cst = (CallableStatement) conn.prepareCall("{call csdlwebthtv2.spThemDiem(?,?,?,?,?,?)}");
				cst.setString(1,  md);
				cst.setString(2,  mhv);
				cst.setString(3,  ml);
				cst.setString(4, mnv);
				cst.setString(5,  d);
				cst.setString(6,  gc);
				cst.executeUpdate();
				response.sendRedirect("/TinHocTayViet/QuanLiDiem");
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	}
	}
}
