package com.mycompany.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mycompany.dto.SensorDTO;

@Repository
public class SensorDao {
	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	public List<Map<String, Object>> select() throws Exception {
		SensorDTO SensorDTO = new SensorDTO();
		return sqlSession.selectList("SENSOR.checked");
	}

	public void delete(SensorDTO sensorDTO) throws Exception  {
		sqlSession.delete("SENSOR.delete", sensorDTO);
	}

	public List<Map<String, Object>> getSensorDtl(SensorDTO sensorDTO) {
		return sqlSession.selectList("SENSOR.sesnsorDtl", sensorDTO);
	}

	public Map<String, Object> mapInfo(SensorDTO sensorDTO) {
		return sqlSession.selectOne("SENSOR.mapInfo", sensorDTO);
	}

	public void insertSensor(SensorDTO sensorDTO) {
		sqlSession.insert("SENSOR.insertSensor", sensorDTO);
	}

	public void saveCoordinates(SensorDTO sensorDTO) {
		sqlSession.insert("SENSOR.saveCoordinates", sensorDTO);	
	}

	public void updateSensor(SensorDTO sensorDTO) {
		sqlSession.update("SENSOR.updateSensor", sensorDTO);
	}
}
