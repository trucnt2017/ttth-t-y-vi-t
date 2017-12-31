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

@WebServlet("/ThemLopHoc")
public class ThemLopHoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private CallableStatement cst;

    public ThemLopHoc() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ml = request.getParameter("maLop");
		String mk = request.getParameter("maKhoa");
		String mnv = request.getParameter("maNV");
		String tl = request.getParameter("tenLop");
		Float tgh = Float.parseFloat(request.getParameter("thoiGianHoc"));
		String cdk = request.getParameter("caDK");
		String nkg = request.getParameter("ngayKhaiGiang");
		String update=request.getParameter("lopHocUpdate");
		conn = dataAccess.DBConnector.getConnection();
		try
		{
			
			if(update.contains("true"))
			{
				//System.out.println("update " + update);
				cst = (CallableStatement) conn.prepareCall("{call csdlwebthtv2.spCapNhatLopHoc(?,?,?,?,?,?,?)}");
				cst.setString(1,  ml);
				cst.setString(2,  mk);
				cst.setString(3,  mnv);
				cst.setString(4, tl);
				cst.setFloat(5,  tgh);
				cst.setString(6,  cdk);
				cst.setString(7, nkg);
				cst.executeUpdate();
				response.sendRedirect("/TinHocTayViet/LoadQuanLyLopHoc");
				
				
			}else
			{
				//System.out.println(update);
				conn = dataAccess.DBConnector.getConnection();
				cst = (CallableStatement) conn.prepareCall("{call csdlwebthtv2.spThemLopHoc(?,?,?,?,?,?,?)}");
				cst.setString(1,  ml);
				cst.setString(2,  mk);
				cst.setString(3,  mnv);
				cst.setString(4, tl);
				cst.setFloat(5,  tgh);
				cst.setString(6,  cdk);
				cst.setString(7, nkg);
				cst.executeUpdate();
				response.sendRedirect("/TinHocTayViet/LoadQuanLyLopHoc");
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
