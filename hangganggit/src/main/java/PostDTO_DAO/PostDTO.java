package PostDTO_DAO;

import java.sql.Timestamp;

public class PostDTO {
    private int num;             // 게시물 번호
    private String writer;      // 작성자
    private String title;       // 제목
    private String content;     // 내용
    private Timestamp regtime;  // 등록 시간
    private int hits;           // 조회수
    private int recommend;      // 추천 수
    private int disrecommend;   // 비추천 수
    private String comments;    // 댓글
    private String type;        // 공지사항 타입

    // 생성자
    public PostDTO(int num, String writer, String title, String content, Timestamp regtime, int hits, int recommend, int disrecommend, String comments, String type) {
        this.num = num;
        this.writer = writer;
        this.title = title;
        this.content = content;
        this.regtime = regtime;
        this.hits = hits;
        this.recommend = recommend;
        this.disrecommend = disrecommend;
        this.comments = comments;
        this.type = type;
    }

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegtime() {
		return regtime;
	}

	public void setRegtime(Timestamp regtime) {
		this.regtime = regtime;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public int getDisrecommend() {
		return disrecommend;
	}

	public void setDisrecommend(int disrecommend) {
		this.disrecommend = disrecommend;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "PostDTO [num=" + num + ", writer=" + writer + ", title=" + title + ", content=" + content + ", regtime="
				+ regtime + ", hits=" + hits + ", recommend=" + recommend + ", disrecommend=" + disrecommend
				+ ", comments=" + comments + ", type=" + type + "]";
	}

}
