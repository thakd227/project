package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mycompany.dto.ClilocaDTO;
import com.mycompany.dto.SensorDTO;

@Repository
public class ClilocaDao {
	
	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	public List<Map<String, Object>> getClioca() throws Exception {
		
		
		return sqlSession.selectList("CLIOCA.select");
	}

	public Map<String, Object> selectOne(ClilocaDTO clilocaDTO) {
		return sqlSession.selectOne("CLIOCA.selectOne", clilocaDTO);
	}

	public boolean cDuplicate_Check(String loca_CD) {
		String result = sqlSession.selectOne("CLIOCA.DupCheck", loca_CD);
		return (result == null) ? false : true;
	}
	
	public void modifyCliloca(ClilocaDTO clilocaDTO) {
		sqlSession.update("CLIOCA.modifyCliloca", clilocaDTO);
	}

	public void afterNewClioca(ClilocaDTO clilocaDTO) {
		sqlSession.insert("CLIOCA.afterNewClioca", clilocaDTO);		
	}

	public void deleteCliloca(ClilocaDTO clilocaDTO) {
		sqlSession.delete("CLIOCA.deleteCliloca", clilocaDTO);
		
	}

	public List<Map<String, Object>> selectLvl() {
		return sqlSession.selectList("CLIOCA.selectLvl");
	}

	public List<ClilocaDTO> selectLocaNm(ClilocaDTO clilocaDTO) {
		return sqlSession.selectList("CLIOCA.selectLocaNm", clilocaDTO);
	}
}
