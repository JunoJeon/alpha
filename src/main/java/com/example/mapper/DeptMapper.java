package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.model.Dept;

@Mapper
public interface DeptMapper {
	
	@Select("select * from dept")
	List<Dept> selectAll();
	
	@Select("""
			select * 
				from dept
			   where dname like '%${search}%'	
			""")
	List<Dept> selectByDname(String search);
	
	@Insert("""
				insert into dept
				values (
					#{deptno}, #{dname}, #{loc}
				)
			""")
	int insert(Dept dept); // int는 인서트, 업데이트, 딜리트를했을때 갯수를 리턴한다.
	
	@Update("""
				update dept
				   set dname = #{dname},
				   	   loc 	 = #{loc}
				 where deptno = #{deptno}
			""")
	int update(Dept dept);
	
	@Delete("""
				delete from dept where deptno = #{deptno}
			""")
	int delete(Dept dept);
}
