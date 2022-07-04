package kh.spring.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.DAO.ImgDAO;

@Service
public class ImgService {
	@Autowired
	private ImgDAO dao;
}
