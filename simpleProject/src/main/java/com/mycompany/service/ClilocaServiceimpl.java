package com.mycompany.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.ClilocaDao;
import com.mycompany.dto.ClilocaDTO;

@Service
public class ClilocaServiceimpl implements ClilocaService{

	@Autowired
	private ClilocaDao clilocalDao; 


	public List<Map<String, Object>> getClioca() throws Exception {
		return clilocalDao.getClioca();
	}


	@Override
	public Map<String, Object> selectOne(ClilocaDTO clilocaDTO) throws Exception {
		return clilocalDao.selectOne(clilocaDTO);
	}


	@Override
	public boolean cDuplicate_Check(String loca_CD) {
		boolean result = clilocalDao.cDuplicate_Check(loca_CD);
		return result;
	}


	@Override
	public void modifyCliloca(ClilocaDTO clilocaDTO) throws Exception {
		clilocalDao.modifyCliloca(clilocaDTO);
	}


	@Override
	public void afterNewClioca(ClilocaDTO clilocaDTO) throws Exception {
		clilocalDao.afterNewClioca(clilocaDTO);
	}


	@Override
	public void deleteCliloca(ClilocaDTO clilocaDTO) throws Exception {
		clilocalDao.deleteCliloca(clilocaDTO);
	}


	@Override
	public List<Map<String, Object>> selectLvl() throws Exception {
		return clilocalDao.selectLvl();
	}


	@Override
	public List<ClilocaDTO> selectLocaNm(ClilocaDTO clilocaDTO) throws Exception {
		return clilocalDao.selectLocaNm(clilocaDTO);
	}

		
}