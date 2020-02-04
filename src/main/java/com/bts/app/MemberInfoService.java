package com.bts.app;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberInfoService implements MemberService {
	@Autowired
	MemberDAO dao;

	@Override
	public int joinMember(MemberVO vo) {

		return dao.joinMember(vo);
	}

	@Override
	public int checkID(String id) {
		return dao.checkID(id);
	}
	
	@Override
	public void membercheck(HttpSession session, String email, String name) {
		if (session.getAttribute("loginID") == null) {// 로그인 안 된 상태

			String id = email.split("@")[0];

			if (checkID(id) == 0) { // 가입이 안된 상태
				MemberVO vo = new MemberVO();
				vo.setId(id);

				// response에서 email, name 파싱
				vo.setEmail(email);
				vo.setName(name);
				int result = joinMember(vo);
				if (result == 1) {// db작업 성공
					System.out.println("가입 성공 -" + id);
				}
			}

			session.setAttribute("loginID", email); // 세션 생성
		}
	}

}
