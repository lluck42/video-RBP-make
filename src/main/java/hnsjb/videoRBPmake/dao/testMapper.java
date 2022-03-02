package hnsjb.videoRBPmake.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface testMapper {
    @Select("SELECT * FROM test WHERE id = #{id}")
    test findById(@Param("id") int id);

    int update(@Param("id") test test);

    List<test> list(Map<String,Object>map);
    int count(Map<String,Object>map);



    // @Update("SELECT * FROM test WHERE id = #{id}")
    // Map<String, Object> findById(@Param("id") int id);

}
