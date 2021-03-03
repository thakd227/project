package com.mycompany.service;

import java.util.List;
import java.util.Map;

import com.mycompany.dto.SensorDTO;

public interface SensorService {

	// 센서 목록 조회
	List<Map<String, Object>> getSensor() throws Exception;
	
	// 센서 삭제
	void deleteSensor(SensorDTO sensorDTO) throws Exception;
	
	// 관련 항목 조회
	List<Map<String, Object>> getSensorDtl(SensorDTO sensorDTO) throws Exception;	
	
	// 센서 정보 전달 (Map에 표시)
	Map<String, Object> mapInfo(SensorDTO sensorDTO) throws Exception;	
	
	// 센서등록 or 수정
	void insertSensor(SensorDTO sensorDTO) throws Exception;	
	
	// 좌표등록
	void saveCoordinates(SensorDTO sensorDTO) throws Exception;	
	
	// 센서 업데이트
	void updateSensor(SensorDTO sensorDTO) throws Exception;	
	
	
	
}
