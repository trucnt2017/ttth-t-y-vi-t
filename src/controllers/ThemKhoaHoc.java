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
@WebServlet("/ThemKhoaHoc")
public class ThemKhoaHoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private CallableStatement cst;

    public ThemKhoaHoc() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mk = request.getParameter("maKhoa");
		String tk = request.getParameter("tenKhoaHoc");
		String nmk = request.getParameter("ngayMoKhoa");
		String nd = request.getParameter("noiDung");
		String update=request.getParameter("khoaHocUpdate");
		conn = dataAccess.DBConnector.getConnection();
		try
		{
			
			if(update.contains("true"))
			{
				//System.out.println("update " + update);
				cst = (CallableStatement) conn.prepareCall("{call csdlwebthtv2.spCapNhatKhoaHoc(?,?,?,?)}");
				cst.setString(1,  mk);
				cst.setString(2,  tk);
				cst.setString(3,  nmk);
				cst.setString(4, nd);
				cst.executeUpdate();
				response.sendRedirect("/TinHocTayViet/LoadQuanLyKhoaHoc");
				
				
			}else
			{
				//System.out.println(update);
				conn = dataAccess.DBConnector.getConnection();
				cst = (CallableStatement) conn.prepareCall("{call csdlwebthtv2.spThemKhoaHoc(?,?,?,?)}");
				cst.setString(1,  mk);
				cst.setString(2,  tk);
				cst.setString(3,  nmk);
				cst.setString(4, nd);
				cst.executeUpdate();
				response.sendRedirect("/TinHocTayViet/LoadQuanLyKhoaHoc");
				
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
