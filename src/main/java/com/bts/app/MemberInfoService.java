package com.bts.app;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

@Service
public class MemberInfoService implements MemberService {
	@Autowired
	MemberDAO dao;
	@Autowired
	JavaMailSender mailSender;


	@Override
	public int login(String[] inf) {
		
		return dao.loginMember(inf);
	}

	
	
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
		if (session.getAttribute("id") == null) {// �α��� �� �� ����

			String id = email.split("@")[0];

			if (checkID(id) == 0) { // ������ �ȵ� ����
				MemberVO vo = new MemberVO();
				vo.setId(id);
				

				// response���� email, name �Ľ�
				vo.setEmail(email.split("_")[1]);
				vo.setName(name);
				int result = joinMember(vo);
				if (result == 1) {// db�۾� ����
					System.out.println("���� ���� -" + id);
				}
			}

			session.setAttribute("id", id); // ���� ����
			
		}
	}

	// ��й�ȣ ã�� 
	@Override
	public List<String> checkPw(String[] list) {
		 return dao.checkPw(list);
		
	}

	//���� ��ȸ
	@Override
	public List<String> checkMail(String[] list) {
	
		return dao.checkMail(list);
	}


	@Override
	public void logout(HttpSession session) {
		session.invalidate();
		
	}

	
	@Override
	public void updatemember(MemberVO vo) {
		dao.updatemember(vo);
	}



	@Override
	public String findname(String id) {
		return dao.findname(id);
	}






}
