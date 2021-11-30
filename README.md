# LOVEDATA
데이트 장소 &amp; 코스 사이트


- [LOVEDATA 사이트](https://lovedata.duckdns.org/)

# 개발 인원

- [dorumamu](https://github.com/dorumamu/)
- [mon0mon](https://github.com/mon0mon/)
- [GyeongNam](https://github.com/GyeongNam/)

## 개발 환경
- 운영체제: Linux (CentOS 7)<br>
- WAS:      Tomcat 9.0<br>
- framework:Spring boot 2.44<br>
- DB:       MySQL 5.4<br>

<어드민 페이지 SMS 전송 controller>
```java
@ResponseBody
	@PostMapping(value = "/admin_send_sms")
	public Map<String, String> adminsms(
			@RequestParam("list[]") String[] list,
			@RequestParam("smscontent")String smscontent) {
		Map<String, String> map = new HashMap<String, String>();
		for(int i = 0 ; i< list.length; i++){
			if(!list[i].equals("on")) {
				User user = userService.select(Long.parseLong(list[i]));
				if (user != null) {
					smsService.managersendSMS(user.getUser_phone(), smscontent);
				}
			}
		}

//		log.info("list : "+ list.length);
//		log.info("smstestcontent: "+ smscontent);
		map.put("msg", "sms 성공");
		return map;
	}
  ```
  

<어드민 페이지 email 전송 controller>
```java
	//email
	@ResponseBody
	@PostMapping(value = "/admin_send_email")
	public Map<String, String> adminemail(
			@RequestParam("list[]") String[] list,
			@RequestParam("smscontent")String smscontent) {
		Map<String, String> map = new HashMap<String, String>();
		for(int i = 0 ; i< list.length; i++){
			if(!list[i].equals("on")){
				User user = userService.select(Long.parseLong(list[i]));
				if(user != null) {
					mailService.adminmailSend(user.getUser_email(), smscontent);
				}
			}
		}

//		log.info("list : "+ list.length);
//		log.info("smstestcontent: "+ smscontent);
		map.put("msg", "이메일 성공");
		return map;
	}
  ```
