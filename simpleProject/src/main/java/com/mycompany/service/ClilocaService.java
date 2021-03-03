package com.mycompany.service;

import java.util.List;
import java.util.Map;

import com.mycompany.dto.ClilocaDTO;

public interface ClilocaService {
	
	// 센서 목록 조회
	List<Map<String, Object>> getClioca() throws Exception;
	
	// lvl1 조회
	List<Map<String, Object>> selectLvl() throws Exception;
	
	List<ClilocaDTO> selectLocaNm(ClilocaDTO clilocaDTO) throws Exception;
	
	// 센서 조회
	Map<String, Object> selectOne(ClilocaDTO clilocaDTO) throws Exception;
	
	// 중복체크
	boolean cDuplicate_Check(String loca_CD);
	
	// 수정
	void modifyCliloca(ClilocaDTO clilocaDTO) throws Exception;
	
	
	void afterNewClioca(ClilocaDTO clilocaDTO) throws Exception;
	
	void deleteCliloca(ClilocaDTO clilocaDTO) throws Exception;
	
	
}
