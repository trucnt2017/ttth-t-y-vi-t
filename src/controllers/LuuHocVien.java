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
 * Servlet implementation class LuuHocVien
 */
@WebServlet("/LuuHocVien")
public class LuuHocVien extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private CallableStatement cst;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LuuHocVien() {
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
		String mhv =  request.getParameter("namemahocvien");
		String hhv = request.getParameter("namehohocvien");		
		String thv = request.getParameter("nametenhocvien");
		String p = request.getParameter("namephai");
		String ns =  request.getParameter("namenoisinh");
		String fb = request.getParameter("namefacebook");		
		String ml = request.getParameter("namemalop");
		String sdt = request.getParameter("namesodienthoai");
		String e =  request.getParameter("nameemail");
		String ndk = request.getParameter("namengaydangki");		
		String tt = request.getParameter("nametinhtrang");
		String gc = request.getParameter("nameghichu");		
		String mnv = request.getParameter("namemanhanvien");
		String flat=request.getParameter("update");
		conn = dataAccess.DBConnector.getConnection();
		try
		{
			if(flat.contains("true"))
			{
				cst = (CallableStatement) conn.prepareCall("{call csdlwebthtv2.spCapNhatHocVien(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
				cst.setString(1,mhv);
				cst.setString(2,hhv);
				cst.setString(3,thv);
				cst.setString(4,p);
				cst.setString(5,ns);
				cst.setString(6,fb);
				cst.setString(7,ml);
				cst.setString(8,sdt);
				cst.setString(9,e);
				cst.setString(10,ndk);
				cst.setString(11,tt);
				cst.setString(12,gc);
				cst.setString(13,mnv);
				cst.executeUpdate();
				
				response.sendRedirect("/TinHocTayViet/TaiQuanLyHocVien");
				
			}else
			{
				cst = (CallableStatement) conn.prepareCall("{call csdlwebthtv2.spThemHocVien(?,?,?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?)}");
				cst.setString(1,mhv);
				cst.setString(2,hhv);
				cst.setString(3,thv);
				cst.setString(4,p);
				cst.setString(5,ns);
				cst.setString(6,fb);
				cst.setString(7,ml);
				cst.setString(8,sdt);
				cst.setString(9,e);
				cst.setString(10,ndk);
				cst.setString(11,tt);
				cst.setString(12,gc);
				cst.setString(13,mnv);
				cst.executeUpdate();
				response.sendRedirect("/TinHocTayViet/TaiQuanLyHocVien");				
			}
			
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}
}
