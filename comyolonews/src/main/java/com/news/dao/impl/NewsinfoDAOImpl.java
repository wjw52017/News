package com.news.dao.impl;

import com.news.dao.NewsinfoDAO;
import com.news.entity.Newsinfo;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import java.util.List;

/**
 * Created by 果壳包子 on 2017/4/13.
 */
public class NewsinfoDAOImpl implements NewsinfoDAO {

    SessionFactory sessionFactory;
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    //获取所有新闻列表
    public List getAllNewsinfo() {
        Session session=sessionFactory.getCurrentSession();
        Criteria c=session.createCriteria(Newsinfo.class);
        return c.list();
    }

    //获取所有新闻数量
    public Integer getCountOfAllNewsinfo() {
        Session session=sessionFactory.getCurrentSession();
        Criteria c=session.createCriteria(Newsinfo.class);
        return c.list().size();
    }

    //根据指定页码获取新闻列表
    public List getAllNewsinfoByPage(int page,int pageSize) {
        Session session=sessionFactory.getCurrentSession();
        Criteria c=session.createCriteria(Newsinfo.class);
        c.setFirstResult(pageSize*(page-1));
        c.setMaxResults(pageSize);
        c.addOrder(Order.desc("createDate"));
        return c.list();
    }

    //根据新闻编号获取新闻
    public Newsinfo getNewsinfoById(int id) {
        Session session=sessionFactory.getCurrentSession();
        Newsinfo newsinfo=(Newsinfo) session.get(Newsinfo.class, id);
        return newsinfo;
    }


    //根据主题、新闻标题等条件获取所属新闻数量
    public Integer getCountOfNewsinfo(Newsinfo condition){
        Session session=sessionFactory.getCurrentSession();
        Criteria c=session.createCriteria(Newsinfo.class);
        if(condition!=null){
           if((condition.getTid() != 0))
                c.add(Restrictions.eq("tid", condition.getTid()));
            if((condition.getTitle()!=null) && !("".equals(condition.getTitle())))
                c.add(Restrictions.like("title", condition.getTitle(), MatchMode.ANYWHERE));
        }
        return c.list().size();
    }

    //根据主题编号、新闻标题等条件和指定页码获取新闻列表

    public List getNewsinfoByConditionAndPage(Newsinfo condition,int page,int pageSize) {
        Session session=sessionFactory.getCurrentSession();
        Criteria c=session.createCriteria(Newsinfo.class);
        if(condition!=null){
            if((condition.getTid()!=0))
               c.add(Restrictions.eq("tid", condition.getTid()));
            if((condition.getTitle()!=null) && !("".equals(condition.getTitle())))
               c.add(Restrictions.like("title", condition.getTitle(),MatchMode.ANYWHERE));
        }
        c.setFirstResult(pageSize*(page-1));
        c.setMaxResults(pageSize);
        c.addOrder(Order.desc("createDate"));
        return c.list();
    }

    //删除新闻

    public void deleteNewsinfo(Newsinfo newsinfo) {
        Session session=sessionFactory.getCurrentSession();
        session.delete(newsinfo);
    }

    //添加新闻
    public void addNews(Newsinfo newsinfo) {
        Session session=sessionFactory.getCurrentSession();
        session.saveOrUpdate(newsinfo);
    }

    //修改新闻
    public void updateNews(Newsinfo newsinfo) {
        Session session=sessionFactory.getCurrentSession();
        session.saveOrUpdate(newsinfo);
    }
}
