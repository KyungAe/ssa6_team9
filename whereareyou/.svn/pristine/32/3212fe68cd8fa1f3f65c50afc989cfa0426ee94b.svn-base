package myproject.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;


@Embeddable
public class BoardId implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer boardId;
    private Integer boardMasterId;

    @Column(name = "BOARD_ID", nullable = false)
    public Integer getBoardId() {
        return this.boardId;
    }

    public void setBoardId(Integer boardId) {
        this.boardId = boardId;
    }

    @Column(name = "BOARD_MASTER_ID", nullable = false)
    public Integer getBoardMasterId() {
        return this.boardMasterId;
    }

    public void setBoardMasterId(Integer boardMasterId) {
        this.boardMasterId = boardMasterId;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer(getClass().getSimpleName());

        sb.append(" [");
        sb.append("boardId").append("='").append(getBoardId()).append("', ");
        sb.append("boardMasterId").append("='").append(getBoardMasterId())
          .append("'");
        sb.append("]");

        return sb.toString();
    }
}
