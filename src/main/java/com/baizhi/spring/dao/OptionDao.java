package com.baizhi.spring.dao;

import java.util.List;

import com.baizhi.spring.entity.Option;

public interface OptionDao {
      public void insert(List<Option> list);
      public List<Option> selectByid(int sid);
      public void update(int[] ids);
      public int maxOrder(int sid);
}
