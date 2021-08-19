package com.mall.user;

import java.util.Date;
import java.util.Map;

public interface UserMapper {

	public void register(Map<String, Object> paramMap) throws Exception;

	public void updateUser(Map<String, Object> paramMap) throws Exception;

	public void insertMember(Map<String, Object> paramMap) throws Exception;

	public Map<String, Object> login(Map<String, Object> paramMap) throws Exception;

	public Map<String, Object> memberInfo(Map<String, Object> paramMap) throws Exception;

	public void keepLogin(Map<String, Object> paramMap) throws Exception;
//	public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception;

	public Map<String, Object> checkUserWithSessionKey(String value) throws Exception;
}
