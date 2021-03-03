package com.mycompany.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.dto.ClilocaDTO;
import com.mycompany.dto.SensorDTO;
import com.mycompany.service.ClilocaServiceimpl;
import com.mycompany.service.SensorServiceImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/grid")
public class MapController {

	@Autowired
	private SensorServiceImpl SensorServiceImpl;
	@Autowired
	private ClilocaServiceimpl ClilocaServiceimpl;

	@RequestMapping(method = RequestMethod.GET)
	public String grid(ModelMap model) {
		return "jqxgrid";
	}
	
	
	@RequestMapping(value = "chart", method = RequestMethod.GET)
	public String chart(ModelMap model) {
		return "chart";
	}
	
	@RequestMapping(value = "toggleScreen", method = RequestMethod.GET)
	public String toggleScreen(ModelMap model) {
		return "toggleScreen";
	}

	// 센서 목록 조회
	@RequestMapping(value = "sensor", method = RequestMethod.GET)
	public @ResponseBody JSONArray Sensor() throws Exception {
		JSONArray json = new JSONArray();
		
		List<Map<String, Object>> sensor = SensorServiceImpl.getSensor();
		for (Map<String, Object> map : sensor) {
			json.add(map);
		}
		return json;
	}
	
	// 센서 생성
	@RequestMapping(value = "insertSensor", method = RequestMethod.POST)
	public @ResponseBody JSONArray insertSensor(@RequestBody Map<String, Object> param) throws Exception {
		
		JSONArray json = new JSONArray();
		SensorDTO sensorDTO = new SensorDTO();
		sensorDTO.setLOCA_CD("");
		sensorDTO.setUP_LOCA_CD(param.get("LOCA_CD").toString());
		
		SensorServiceImpl.insertSensor(sensorDTO);
		
		sensorDTO.setLOCA_CD(param.get("LOCA_CD").toString());
		List<Map<String, Object>> sensor = SensorServiceImpl.getSensorDtl(sensorDTO);
		for (Map<String, Object> map : sensor) {
			json.add(map);
		}
		
		return json;
	}
	
	// 센서 삭제
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public @ResponseBody JSONArray delete(@RequestBody Map<String, Object> params) throws Exception {

		SensorDTO sensorDTO = new SensorDTO();
		JSONArray json = new JSONArray();
		sensorDTO.setLOCA_CD(params.get("LOCA_CD").toString());
		
		/*sensorDTO.setSENSOR_CD(params.get("SENSOR_CD").toString());*/
		
		SensorServiceImpl.deleteSensor(sensorDTO);
		sensorDTO.setLOCA_CD(params.get("UP_LOCA_CD").toString());
		List<Map<String, Object>> sensor = SensorServiceImpl.getSensorDtl(sensorDTO);
		for (Map<String, Object> map : sensor) {
			json.add(map);
		}
		return json;
	}
	
	// 센서 수정
	@RequestMapping(value = "updateSensor", method = RequestMethod.POST)
	public @ResponseBody JSONArray updateSensor(@RequestBody Map<String, Object> params) throws Exception {
		JSONArray json = new JSONArray();
		SensorDTO sensorDTO = new SensorDTO();
		
		sensorDTO.setSENSOR_CD(params.get("SENSOR_CD").toString());
		sensorDTO.setSENSOR_NM(params.get("SENSOR_NM").toString());
		sensorDTO.setSENSOR_TYPE(params.get("SENSOR_TYPE").toString());
		sensorDTO.setALARM_IMPRT(params.get("ALARM_IMPRT").toString());
		sensorDTO.setALARM_YN(params.get("ALARM_YN").toString());
		sensorDTO.setLOCA_CD(params.get("LOCA_CD").toString());
		sensorDTO.setFNL_MDFC_DTM(params.get("FNL_MDFC_DTM").toString());
		
		System.out.println(params.get("LOCA_CD").toString());
		SensorServiceImpl.updateSensor(sensorDTO);
		
		sensorDTO.setLOCA_CD(params.get("UP_LOCA_CD").toString());
		List<Map<String, Object>> sensor = SensorServiceImpl.getSensorDtl(sensorDTO);
		for (Map<String, Object> map : sensor) {
			json.add(map);
		}
		return json;
	}
	
	// 트리 조회
	@RequestMapping(value = "clioca", method = RequestMethod.GET)
	public @ResponseBody JSONArray cliloca() throws Exception {
		
		JSONArray json = new JSONArray();
		List<Map<String, Object>> clioca = ClilocaServiceimpl.getClioca();
		for (Map<String, Object> map : clioca) {
			json.add(map);
		}
		
		System.out.println("\n" + "json is" + json + "\n");
		return json;
	}
	
	// Update or Insert 화면 
	@RequestMapping(value = "selectClioca", method = RequestMethod.GET)
	public ModelAndView selectClioca(@RequestParam("LOCA_CD") String LOCA_CD, Model model) throws Exception {
		
		ClilocaDTO clilocaDTO = new ClilocaDTO();
		clilocaDTO.setLOCA_CD(LOCA_CD);
		Map<String, Object> cliloca = ClilocaServiceimpl.selectOne(clilocaDTO);
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/cru/updateClioca");
		mv.addObject("LOCA_CD", cliloca.get("LOCA_CD"));	
		mv.addObject("LOCA_NM", cliloca.get("LOCA_NM"));	
		mv.addObject("ARYL_ORD", cliloca.get("ARYL_ORD"));	
		mv.addObject("USE_YN", cliloca.get("USE_YN"));	
		
		return mv;
	}
	
	
	// 좌표 등록
	@RequestMapping(value = "saveCoordinates", method = RequestMethod.POST)
	public @ResponseBody JSONArray saveCoordinates(@RequestBody Map<String, Object> saveCoordinates) throws Exception {
		
		SensorDTO sensorDTO = new SensorDTO();
		JSONArray json = new JSONArray();
		sensorDTO.setLOCA_CD(saveCoordinates.get("LOCA_CD").toString());
		sensorDTO.setCOORDINATES(saveCoordinates.get("COORDINATE").toString());
		
		
		SensorServiceImpl.insertSensor(sensorDTO);
		
/*		List<Map<String, Object>> sensor = SensorServiceImpl.getSensorDtl(sensorDTO);
		for (Map<String, Object> map : sensor) {
			json.add(map);
		}*/
		return json;
	}
	
	
	
	// 이미지 클릭시 좌표 출력
	@RequestMapping(value = "coordinates", method = RequestMethod.GET)
	public ModelAndView coordinates(@RequestParam("LOCA_CD") String loca_Cd, Model model) throws Exception {
		
		SensorDTO sensorDTO =new SensorDTO();
		sensorDTO.setLOCA_CD(loca_Cd);   
		Map<String, Object> mapInfo = SensorServiceImpl.mapInfo(sensorDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("coordinates");
		mv.addObject("coordinates", mapInfo.get("COORDINATES"));	
		mv.addObject("sensor_Cd", mapInfo.get("SENSOR_CD"));	
		mv.addObject("loca_Cd", mapInfo.get("LOCA_CD"));	
		mv.addObject("sensor_Nm", mapInfo.get("SENSOR_NM"));	
		mv.addObject("alarm_Yn", mapInfo.get("ALARM_YN"));	
		
		return mv;
	}
	

	// 트리 항목 클릭시 관련  데이터 전달 & 상세 팝업
	@RequestMapping(value = "cliocaDtl", method = RequestMethod.POST)
	public @ResponseBody JSONObject cliocaUpdate(@RequestBody Map<String, Object> param) throws Exception {
		
		ClilocaDTO clilocaDTO = new ClilocaDTO();
		JSONObject object1 = new JSONObject();
		JSONObject object2 = new JSONObject();
		
		clilocaDTO.setLOCA_CD(param.get("LOCA_CD").toString());
		Map<String, Object> cliloca = ClilocaServiceimpl.selectOne(clilocaDTO);
		
		object1.put("LOCA_CD", cliloca.get("LOCA_CD"));
		object1.put("LOCA_NM", cliloca.get("LOCA_NM"));
		object1.put("ARYL_ORD", cliloca.get("ARYL_ORD"));
		object1.put("USE_YN", cliloca.get("USE_YN"));
		
		return object1;
	}
	
	
	
	// 관련 sensor
	@RequestMapping(value = "sesnsorDtl", method = RequestMethod.POST)
	public @ResponseBody JSONArray SesnsorDtl(@RequestBody Map<String, Object> param) throws Exception {
		
		JSONArray json = new JSONArray();
		SensorDTO sensorDTO = new SensorDTO();
		sensorDTO.setLOCA_CD(param.get("LOCA_CD").toString());
		List<Map<String, Object>> sensor = SensorServiceImpl.getSensorDtl(sensorDTO);
		for (Map<String, Object> map : sensor) {
			json.add(map);
		}
		
		return json;
	}
	
	// 하위 신규 화면
	@RequestMapping(value = "nCliocaScreen", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView nCliocaScreen(@RequestParam("LOCA_CD") String LOCA_CD, Model model) throws Exception {
		
		ClilocaDTO clilocaDTO = new ClilocaDTO();
		clilocaDTO.setLOCA_CD(LOCA_CD);
		Map<String, Object> cliloca = ClilocaServiceimpl.selectOne(clilocaDTO);
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/cru/newClioca");
		mv.addObject("UP_LOCA_CD", cliloca.get("LOCA_CD"));	
		mv.addObject("LOCA_LVL", cliloca.get("LOCA_LVL"));	
		
		return mv;
		
		
	}
	// 상위 신규 화면
	@RequestMapping(value = "aNewCliocaScreen", method = {RequestMethod.GET, RequestMethod.POST})
	public String aNewCliocaScreen() throws Exception {
		return "/cru/afterNewClioca";
	}
	
	// 수정 화면 
	@RequestMapping(value = "mClilocaScreen", method = RequestMethod.GET)
	public ModelAndView mClilocaScreen(@RequestParam("LOCA_CD") String LOCA_CD, Model model) throws Exception {
		
		ClilocaDTO clilocaDTO = new ClilocaDTO();
		clilocaDTO.setLOCA_CD(LOCA_CD);
		Map<String, Object> cliloca = ClilocaServiceimpl.selectOne(clilocaDTO);
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/cru/modifyCliloca");
		mv.addObject("LOCA_CD", cliloca.get("LOCA_CD"));	
		mv.addObject("LOCA_NM", cliloca.get("LOCA_NM"));	
		mv.addObject("ARYL_ORD", cliloca.get("ARYL_ORD"));	
		mv.addObject("USE_YN", cliloca.get("USE_YN"));	
		
		return mv;
	}
	
	// Clioca 데이터 수정 
	@RequestMapping(value = "modifyCliloca", method = RequestMethod.POST)
	public @ResponseBody JSONArray modifyCliloca(ClilocaDTO ClilocaDTO) throws Exception {

		System.out.println("ClilocaDTO is " + ClilocaDTO.getLOCA_CD());
		ClilocaServiceimpl.modifyCliloca(ClilocaDTO);
		
		JSONArray json = new JSONArray();
		SensorDTO sensorDTO = new SensorDTO();
/*		List<Map<String, Object>> sensor = SensorServiceImpl.getSensorDtl(sensorDTO);
		for (Map<String, Object> map : sensor) {
			json.add(map);
		}*/
		return json;
	}
	
	// Clioca 데이터 삭제 
	@RequestMapping(value = "deleteCliloca", method = RequestMethod.POST)
	public @ResponseBody JSONArray deleteCliloca(@RequestBody Map<String, Object> ClilocaDTO) throws Exception {
		ClilocaDTO clilocaDTO = new ClilocaDTO();
		System.out.println("ClilocaDTO is " + ClilocaDTO.get("LOCA_CD"));
		clilocaDTO.setLOCA_CD(ClilocaDTO.get("LOCA_CD").toString());
		JSONArray json = new JSONArray();
		
		ClilocaServiceimpl.deleteCliloca(clilocaDTO);
		
		List<Map<String, Object>> clioca = ClilocaServiceimpl.getClioca();
		for (Map<String, Object> map : clioca) {
			json.add(map);
		}
		
		System.out.println("\n" + "json is" + json + "\n");
		return json;
	}
	
	// Clioca 최상위 데이터 생성 
	@RequestMapping(value = "newClioca", method = RequestMethod.POST)
	public @ResponseBody boolean newClioca(ClilocaDTO ClilocaDTO) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();	
		// 중복이 아닐 경우
		if (ClilocaServiceimpl.cDuplicate_Check(ClilocaDTO.getLOCA_CD()) == false){
			
			System.out.println("중복이 아니다");
			
			ClilocaServiceimpl.modifyCliloca(ClilocaDTO);
			return false;
			// 중복일 경우
		}else {
			System.out.println("중복이다");
			return true;
		}
	}

	
	
	@RequestMapping(value = "chart2", method = RequestMethod.GET)
	public /*ResponseEntity<JSONObject>*/ @ResponseBody JSONObject chart() throws Exception {
		ResponseEntity<JSONObject>  entity=null;

		
		List<String> lists = new ArrayList<String>();
		ClilocaDTO clilocaDTO =new ClilocaDTO();
		List<Map<String, Object>> list=  ClilocaServiceimpl.selectLvl();
		List<ClilocaDTO> list2 = new ArrayList();
		
		
		for (int i=0; i< list.size(); i++)
		{
			System.out.println(list.get(i).get("LOCA_CD"));
			clilocaDTO.setLOCA_CD(list.get(i).get("LOCA_CD").toString());
			list2.addAll(i, ClilocaServiceimpl.selectLocaNm(clilocaDTO));
		}
		
		JSONObject data = new JSONObject();
		JSONObject col1 = new JSONObject();    //cols의 1번째 object를 담을 JSONObject
		JSONObject col2 = new JSONObject();    //cols의 2번째 object를 담을 JSONObject
		JSONArray title = new JSONArray();        //위의 두개의 JSONObject를 담을 JSONArray
		
		col1.put("label", "위치");
		col1.put("type", "string");
		col2.put("label", "개수");
		col2.put("type", "number");

		title.add(col1);
		title.add(col2);
		data.put("cols", title);
	
		
		JSONArray body = new JSONArray();
		
		for (int j = 0; j < list.size(); j++)
		{
			JSONObject count = new JSONObject();
			count.put("v", list2.get(j).getCOUNT()); // 상품이름 -> v 객체
			JSONObject location = new JSONObject();
			location.put("v", list2.get(j).getLOCA_NM()); // 상품이름 -> v 객체
			JSONObject loca_cd = new JSONObject();
			loca_cd.put("v", list2.get(j).getLOCA_NM() + "\n" + "(" + list2.get(j).getLOCA_CD() + ")"); // 상품이름 -> v 객체
			
			JSONArray row = new JSONArray();
			row.add(loca_cd);
			row.add(count);
			row.add(location);
			JSONObject c = new JSONObject();
			c.put("c", row);
			// c 객체를 배열 형태의 body 에 담는다.
			body.add(c);
		}

		data.put("rows", body);
		
		System.out.println("data is " + data);
		try{
			 entity =new ResponseEntity<JSONObject>(data, HttpStatus.OK);
		}catch (Exception e) {
			System.out.println(" 에러            -- ");
			entity =new ResponseEntity<JSONObject>(HttpStatus.BAD_REQUEST);
		}
		return data;
	}
}
