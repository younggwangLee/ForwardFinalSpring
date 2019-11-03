package com.lecto.forward.service;

import java.util.List;


public interface SignupFormService {
	public String createRegEx(String selectPattern, String cipher);
	public String createPwdReg(String selectPattern, String cipher);
	public boolean saveRegExData(String format);
	public List<String> loadRegExData();
}
