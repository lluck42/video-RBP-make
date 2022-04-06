package hnsjb.videoRBPmake.dao.form;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;


@Mapper
public interface reduceRecordMapper {
    
    @Insert("insert into reduce_record(company_id,company_name,form_id,form_name,description) values(#{company_id},#{company_name},#{form_id},#{form_name},#{description})")
    @Options(useGeneratedKeys=true, keyProperty="id")
    int add(reduceRecord one);

}
