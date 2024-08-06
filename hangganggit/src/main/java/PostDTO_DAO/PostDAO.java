package PostDTO_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import util.MYSQLUtil;

public class PostDAO {
    // JDBC 관련 변수 
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;
    
    private String POST_LIST = "select * from HG_post_table";
    private String POST_ONE = "select * from HG_post_table where num = ?";
    private String POST_INSERT = "insert into HG_post_table(writer, title, content, regtime, hits, recommend, disrecommend, comments, type) values(?,?,?,?,?,?,?,?,?)";
    private String POST_UPDATE = "update HG_post_table set writer = ?, title = ?, content = ?, regtime = now(), hits = ?, recommend = ?, disrecommend = ?, comments = ?, type = ? where num = ?";
    private String POST_DELETE = "delete from HG_post_table where num = ?";
    private String POST_HITS = "update HG_post_table set hits = hits + 1 where num = ?";
    
    //게시판 조회수 증가
    public void increaseHits(int num) {
        conn = MYSQLUtil.getConnection();
        try {
            stmt = conn.prepareStatement(POST_HITS);
            stmt.setInt(1, num);
            stmt.executeUpdate();    
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MYSQLUtil.close(stmt, conn);
        }
    }
    
    //게시판 삭제
    public void deletePost(int num) {
        conn = MYSQLUtil.getConnection();
        try {
            stmt = conn.prepareStatement(POST_DELETE);
            stmt.setInt(1, num);
            stmt.executeUpdate();    
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MYSQLUtil.close(stmt, conn);
        }
    }
    
    //게시판 수정
    public void updatePost(PostDTO dto) {
        conn = MYSQLUtil.getConnection();
        try {
            stmt = conn.prepareStatement(POST_UPDATE);
            stmt.setString(1, dto.getWriter());
            stmt.setString(2, dto.getTitle());
            stmt.setString(3, dto.getContent());
            stmt.setInt(4, dto.getHits());
            stmt.setInt(5, dto.getRecommend());
            stmt.setInt(6, dto.getDisrecommend());
            stmt.setString(7, dto.getComments());
            stmt.setString(8, dto.getType());
            stmt.setInt(9, dto.getNum());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MYSQLUtil.close(stmt, conn);
        }
    }
    
    //게시판 등록
    public void insertPost(PostDTO dto) {
        conn = MYSQLUtil.getConnection();
        try {
            stmt = conn.prepareStatement(POST_INSERT);
            stmt.setString(1, dto.getWriter());
            stmt.setString(2, dto.getTitle());
            stmt.setString(3, dto.getContent());
            stmt.setTimestamp(4, dto.getRegtime());
            stmt.setInt(5, dto.getHits());
            stmt.setInt(6, dto.getRecommend());
            stmt.setInt(7, dto.getDisrecommend());
            stmt.setString(8, dto.getComments());
            stmt.setString(9, dto.getType());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MYSQLUtil.close(stmt, conn);
        }
    }
    
    // 게시판 1건 조회
    public PostDTO getOne(int num) {
        PostDTO dto = null;
        conn = MYSQLUtil.getConnection();
        try {
            stmt = conn.prepareStatement(POST_ONE);
            stmt.setInt(1, num);
            rs = stmt.executeQuery();
            if (rs.next()) {
                dto = new PostDTO(rs.getInt("num"), rs.getString("writer"),
                        rs.getString("title"), rs.getString("content"),
                        rs.getTimestamp("regtime"), rs.getInt("hits"),
                        rs.getInt("recommend"), rs.getInt("disrecommend"),
                        rs.getString("comments"), rs.getString("type"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MYSQLUtil.close(rs, stmt, conn);
        }
        return dto;
    }
    
    //게시판 목록 조회
    public List<PostDTO> getPostList() {
        List<PostDTO> list = new ArrayList<>();
        
        conn = MYSQLUtil.getConnection();
        try {
            stmt = conn.prepareStatement(POST_LIST);
            rs = stmt.executeQuery();
            while (rs.next()) {
                PostDTO dto = new PostDTO(rs.getInt("num"), rs.getString("writer"),
                        rs.getString("title"), rs.getString("content"),
                        rs.getTimestamp("regtime"), rs.getInt("hits"),
                        rs.getInt("recommend"), rs.getInt("disrecommend"),
                        rs.getString("comments"), rs.getString("type"));
                list.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            MYSQLUtil.close(rs, stmt, conn);
        }
        
        return list;
    }
    
    public boolean incrementRecommend(int num) {
        try (Connection conn = MYSQLUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("UPDATE HG_post_table SET recommend = recommend + 1 WHERE num = ?")) {
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean incrementDisrecommend(int num) {
        try (Connection conn = MYSQLUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("UPDATE HG_post_table SET disrecommend = disrecommend + 1 WHERE num = ?")) {
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean updatePost2(PostDTO dto) {
        try (Connection conn = MYSQLUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("UPDATE HG_post_table SET comments = ? WHERE num = ?")) {
            pstmt.setString(1, dto.getComments());
            pstmt.setInt(2, dto.getNum());
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

