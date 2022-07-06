package kh.spring.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.DAO.AdminDAO;
import kh.spring.DTO.MemberDTO;


@Service
public class AdminService {

	@Autowired
	AdminDAO adao;
	
	public List<MemberDTO> selectAllMember(){
		System.out.println("서비스");
		return adao.selectAllMember();
	}

}
