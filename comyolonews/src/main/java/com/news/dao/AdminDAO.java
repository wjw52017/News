package com.news.dao;

import java.util.List;

import com.news.entity.Admin;

/**
 * Created by 果壳包子 on 2017/4/15.
 */


public interface AdminDAO {
    public List search(Admin condition);
}
