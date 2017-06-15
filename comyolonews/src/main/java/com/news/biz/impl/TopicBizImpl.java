package com.news.biz.impl;

import com.news.biz.TopicBiz;
import com.news.dao.TopicDAO;
import com.news.entity.Topic;

import java.util.List;

/**
 * Created by 果壳包子 on 2017/4/14.
 */
public class TopicBizImpl implements TopicBiz {
    TopicDAO topicDAO;
    public void setTopicDAO(TopicDAO topicDAO) {
        this.topicDAO = topicDAO;
    }

    //获取所有主题
    public List getAllTopics() {
        return topicDAO.getAllTopics();
    }

    //通过名称获取主题
    public List getTopicByName(String name) {
        return topicDAO.getTopicByName(name);
    }

    //通过编号删除主题
    public void deleteTopic(int id) {
        Topic topic=topicDAO.getTopicById(id);
        topicDAO.deleteTopic(topic);
    }


    public int countTopics() {
        // TODO Auto-generated method stub
        return 0;
    }

    //更改主题
    public void updateTopic(Topic topic) {
        topicDAO.updateTopic(topic);
    }

    //添加主题
    public void addTopic(Topic topic) {
        topicDAO.addTopic(topic);
    }

    //根据编号获取主题
    public Topic getTopicById(int id) {
        return topicDAO.getTopicById(id);
    }
}
