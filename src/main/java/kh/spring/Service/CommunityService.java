package kh.spring.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.DAO.CommunityDAO;

@Service
public class CommunityService {
	@Autowired
	private CommunityDAO dao;
}
