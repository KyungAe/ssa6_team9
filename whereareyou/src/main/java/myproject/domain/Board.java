package myproject.domain;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import java.io.Serializable;

import java.util.Date;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "BOARD", catalog = "PUBLIC")
public class Board implements Serializable {
    private static final long serialVersionUID = 1L;
    private BoardId id = new BoardId();
    private BoardMaster boardMaster;
    private String boardName;
    private String boardDesc;
    private Integer boardOrder;
    private Integer boardTopics;
    @DateTimeFormat(iso = ISO.DATE)
    private Date regDate;

    @EmbeddedId
    @AttributeOverrides({@AttributeOverride(name = "boardId",column = @Column(name = "BOARD_ID",nullable = false)
        )
        , @AttributeOverride(name = "boardMasterId",column = @Column(name = "BOARD_MASTER_ID",nullable = false)
        )
    })
    public BoardId getId() {
        return this.id;
    }

    public void setId(BoardId id) {
        this.id = id;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "BOARD_MASTER_ID", nullable = false, insertable = false, updatable = false)
    public BoardMaster getBoardMaster() {
        return this.boardMaster;
    }

    public void setBoardMaster(BoardMaster boardMaster) {
        this.boardMaster = boardMaster;
    }

    @Column(name = "BOARD_NAME", nullable = false, length = 150)
    public String getBoardName() {
        return this.boardName;
    }

    public void setBoardName(String boardName) {
        this.boardName = boardName;
    }

    @Column(name = "BOARD_DESC")
    public String getBoardDesc() {
        return this.boardDesc;
    }

    public void setBoardDesc(String boardDesc) {
        this.boardDesc = boardDesc;
    }

    @Column(name = "BOARD_ORDER")
    public Integer getBoardOrder() {
        return this.boardOrder;
    }

    public void setBoardOrder(Integer boardOrder) {
        this.boardOrder = boardOrder;
    }

    @Column(name = "BOARD_TOPICS", nullable = false)
    public Integer getBoardTopics() {
        return this.boardTopics;
    }

    public void setBoardTopics(Integer boardTopics) {
        this.boardTopics = boardTopics;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "REG_DATE", length = 10)
    public Date getRegDate() {
        return this.regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer(getClass().getSimpleName());

        sb.append(" [");
        sb.append("id").append("='").append(getId()).append("', ");

        sb.append("boardName").append("='").append(getBoardName()).append("', ");
        sb.append("boardDesc").append("='").append(getBoardDesc()).append("', ");
        sb.append("boardOrder").append("='").append(getBoardOrder())
          .append("', ");
        sb.append("boardTopics").append("='").append(getBoardTopics())
          .append("', ");
        sb.append("regDate").append("='").append(getRegDate()).append("'");
        sb.append("]");

        return sb.toString();
    }
}
