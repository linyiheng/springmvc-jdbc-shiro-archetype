package ${package}.service;



import ${package}.entity.User;

import java.util.Set;

public interface UserService {
	User findOne(Long userId);
	public User findByUsername(String username);
	public Set<String> findRoles(String username);
	public Set<String> findPermissions(String username);
}
