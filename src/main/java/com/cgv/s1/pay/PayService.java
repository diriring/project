package com.cgv.s1.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PayService {
	
	@Autowired
	private PayDAO payDAO;
	
	public int add(PayDTO payDTO) throws Exception {
		return payDAO.add(payDTO);
	}

}
