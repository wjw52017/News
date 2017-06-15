package com.news.dao.impl;

import com.news.dao.TopicDAO;
import com.news.entity.Topic;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import java.util.List;

/**
 * Created by 果壳包子 on 2017/4/14.
 */
public class TopicDAOImpl implements TopicDAO{
    SessionFactory sessionFactory;
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    //获取所有主题
    public List getAllTopics() {
        Session session=sessionFactory.getCurrentSession();
        Criteria c=session.createCriteria(Topic.class);
        return c.list();
    }

    //通过名称获取主题
    public List getTopicByName(String name) {
        Session session=sessionFactory.getCurrentSession();
        Criteria c=session.createCriteria(Topic.class);
        c.add(Restrictions.eq("name", name).ignoreCase());
        return c.list();
    }

    //通过编号获取主题
    public Topic getTopicById(int id) {
        Session session=sessionFactory.getCurrentSession();
        Topic topic=(Topic)session.get(Topic.class, id);
        return topic;
    }

    //删除主题
    public void deleteTopic(Topic topic) {
        Session session=sessionFactory.getCurrentSession();
        session.delete(topic);
    }

    public int countTopics() {
        // TODO Auto-generated method stub
        return 0;
    }


    //修改主题
    public void updateTopic(Topic topic) {
        Session session=sessionFactory.getCurrentSession();
        session.saveOrUpdate(topic);
    }

    //添加主题
    public void addTopic(Topic topic) {
        Session session=sessionFactory.getCurrentSession();
        session.saveOrUpdate(topic);
    }
}
