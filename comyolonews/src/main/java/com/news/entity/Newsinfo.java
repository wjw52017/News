package com.news.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;

/**
 * Created by 果壳包子 on 2017/4/14.
 */
@Entity
public class Newsinfo {
    private int id;
    private String title;
    private String author;
    private Timestamp createDate;
    private String content;
    private String summary;
    private int tid;

    @Id
    @Column(name = "Id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "Title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "Author")
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Basic
    @Column(name = "CreateDate")
    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    @Basic
    @Column(name = "Content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "Summary")
    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    @Basic
    @Column(name = "Tid")
    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Newsinfo newsinfo = (Newsinfo) o;

        if (id != newsinfo.id) return false;
        if (tid != newsinfo.tid) return false;
        if (title != null ? !title.equals(newsinfo.title) : newsinfo.title != null) return false;
        if (author != null ? !author.equals(newsinfo.author) : newsinfo.author != null) return false;
        if (createDate != null ? !createDate.equals(newsinfo.createDate) : newsinfo.createDate != null) return false;
        if (content != null ? !content.equals(newsinfo.content) : newsinfo.content != null) return false;
        if (summary != null ? !summary.equals(newsinfo.summary) : newsinfo.summary != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (author != null ? author.hashCode() : 0);
        result = 31 * result + (createDate != null ? createDate.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (summary != null ? summary.hashCode() : 0);
        result = 31 * result + tid;
        return result;
    }
}
