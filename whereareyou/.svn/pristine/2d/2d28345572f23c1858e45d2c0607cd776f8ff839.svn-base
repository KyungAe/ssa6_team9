package myproject.domain;

import java.io.Serializable;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "BOARD_MASTER", catalog = "PUBLIC")
public class BoardMaster implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer boardMasterId;
    private String title;
    private Integer displayOrder;
    private Integer moderated;
    private Set<Board> boards = new HashSet<Board>(0);

    @Id
    @Column(name = "BOARD_MASTER_ID", unique = true, nullable = false)
    public Integer getBoardMasterId() {
        return this.boardMasterId;
    }

    public void setBoardMasterId(Integer boardMasterId) {
        this.boardMasterId = boardMasterId;
    }

    @Column(name = "TITLE", nullable = false, length = 100)
    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "DISPLAY_ORDER", nullable = false)
    public Integer getDisplayOrder() {
        return this.displayOrder;
    }

    public void setDisplayOrder(Integer displayOrder) {
        this.displayOrder = displayOrder;
    }

    @Column(name = "MODERATED")
    public Integer getModerated() {
        return this.moderated;
    }

    public void setModerated(Integer moderated) {
        this.moderated = moderated;
    }

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "boardMaster")
    public Set<Board> getBoards() {
        return this.boards;
    }

    public void setBoards(Set<Board> boards) {
        this.boards = boards;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer(getClass().getSimpleName());

        sb.append(" [");
        sb.append("boardMasterId").append("='").append(getBoardMasterId())
          .append("', ");
        sb.append("title").append("='").append(getTitle()).append("', ");
        sb.append("displayOrder").append("='").append(getDisplayOrder())
          .append("', ");
        sb.append("moderated").append("='").append(getModerated()).append("', ");

        sb.append("]");

        return sb.toString();
    }
}
