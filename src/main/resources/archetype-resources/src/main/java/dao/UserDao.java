package ${package}.dao;

import ${package}.entity.User;

/**
 * Created by leo on 2017/3/27.
 */
public interface UserDao {
    User findByUsername(String username);
    User findOne(Long userId);
}
