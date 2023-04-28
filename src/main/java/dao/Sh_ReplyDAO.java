package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Sh_CommentsDTO;

public class Sh_ReplyDAO {
	private Sh_ReplyDAO() {}
	private static Sh_ReplyDAO instance = null;
	public synchronized static Sh_ReplyDAO getInstance() {
		if(instance == null) {
			instance = new Sh_ReplyDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context iCtx = new InitialContext();
		DataSource ds = (DataSource)iCtx.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
	public int insertReply(Sh_CommentsDTO dto) throws Exception{
		String sql = "insert into sh_comments values(sh_com_seq.nextval, ?, ?, default, ?, ?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getCom_writer());
			pstat.setString(2, dto.getCom_contents());
			pstat.setInt(3, dto.getBoard_seq());
			pstat.setInt(4, dto.getParent_seq());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
}
