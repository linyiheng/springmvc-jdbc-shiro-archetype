package ${package}.service.impl;


import ${package}.dao.UserDao;
import ${package}.entity.User;
import ${package}.service.RoleService;
import ${package}.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Autowired
	private RoleService roleService;



	    @Override
	    public User findOne(Long userId) {
	        return userDao.findOne(userId);
	    }



	    /**
	     * 根据用户名查找用户
	     * @param username
	     * @return
	     */
	    public User findByUsername(String username) {
	        return userDao.findByUsername(username);
	    }

	    /**
	     * 根据用户名查找其角色
	     * @param username
	     * @return
	     */
	    public Set<String> findRoles(String username) {
	        User user =findByUsername(username);
	        if(user == null) {
	            return Collections.EMPTY_SET;
	        }
	        return roleService.findRoles(user.getRoleIds().toArray(new Long[0]));
	    }

	    /**
	     * 根据用户名查找其权限
	     * @param username
	     * @return
	     */
	    public Set<String> findPermissions(String username) {
	        User user =findByUsername(username);
	        if(user == null) {
	            return Collections.EMPTY_SET;
	        }
	        return roleService.findPermissions(user.getRoleIds().toArray(new Long[0]));
	    }

	
}
