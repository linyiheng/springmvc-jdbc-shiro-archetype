package ${package}.dao;

import ${package}.entity.Resource;

/**
 * Created by leo on 2017/3/27.
 */
public interface ResourceDao {
    Resource findOne(Long resourceId);
}
