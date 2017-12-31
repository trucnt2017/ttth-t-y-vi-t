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
 * Servlet implementation class LuuThoiKhoaBieu
 */
@WebServlet("/LuuThoiKhoaBieu")
public class LuuThoiKhoaBieu extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private CallableStatement cst;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LuuThoiKhoaBieu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ml =  request.getParameter("namemalop");
		String mk = request.getParameter("namemakhoa");		
		String mp = request.getParameter("namemaphong");
		String mgv = request.getParameter("namemagiaovien");
		String tgh =  request.getParameter("namethoigianhoc");
		String flat=request.getParameter("update");
		conn = dataAccess.DBConnector.getConnection();
		try
		{
			if(flat.contains("true"))
			{
				cst = (CallableStatement) conn.prepareCall("{call csdlwebthtv2.spCapNhatTKB(?, ?, ?, ?, ?)}");
				cst.setString(1,ml);
				cst.setString(2,mk);
				cst.setString(3,mp);
				cst.setString(4,mgv);
				cst.setString(5,tgh);
				cst.executeUpdate();
				response.sendRedirect("/TinHocTayViet/TaiQLyThoiKhoaBieu");
				
				
			}else
			{
				cst = (CallableStatement) conn.prepareCall("{call csdlwebthtv2.spThemTKB(?, ?, ?, ?, ?)}");
				cst.setString(1,ml);
				cst.setString(2,mk);
				cst.setString(3,mp);
				cst.setString(4,mgv);
				cst.setString(5,tgh);
				cst.executeUpdate();
				response.sendRedirect("/TinHocTayViet/TaiQLyThoiKhoaBieu");	
			}			
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}
}
