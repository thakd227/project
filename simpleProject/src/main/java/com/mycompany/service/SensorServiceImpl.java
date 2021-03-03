package com.mycompany.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.SensorDao;
import com.mycompany.dto.SensorDTO;

@Service
public class SensorServiceImpl implements SensorService{
	
	@Autowired
	private SensorDao SensorDao;

	@Override
	public List<Map<String, Object>> getSensor() throws Exception {
		return SensorDao.select();
	}

	@Override
	public void deleteSensor(SensorDTO sensorDTO) throws Exception {
		SensorDao.delete(sensorDTO);
	}

	@Override
	public List<Map<String, Object>> getSensorDtl(SensorDTO sensorDTO) throws Exception {
		return SensorDao.getSensorDtl(sensorDTO);
	}

	@Override
	public Map<String, Object> mapInfo(SensorDTO sensorDTO) throws Exception {
		return SensorDao.mapInfo(sensorDTO);
	}

	@Override
	public void insertSensor(SensorDTO sensorDTO) throws Exception {
		SensorDao.insertSensor(sensorDTO);
	}

	@Override
	public void saveCoordinates(SensorDTO sensorDTO) throws Exception {
		SensorDao.saveCoordinates(sensorDTO);
	}

	@Override
	public void updateSensor(SensorDTO sensorDTO) throws Exception {
		SensorDao.updateSensor(sensorDTO);
	}

}
