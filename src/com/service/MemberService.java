package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dao.MySqlSessionFactory;
import com.entity.MemberDTO;
import com.exception.CommonException;

public class MemberService {
    private String namespace="com.MemberMapper.";
    
    
    public MemberDTO myPage(String userid)
    		throws CommonException{
    	SqlSession session = MySqlSessionFactory.openSession();
    	MemberDTO dto = null;
    	try{
			dto = session.selectOne(namespace+"myPage",userid);
		}catch(Exception e){
			e.printStackTrace();
			throw new CommonException("mypage 실패");
		}finally {
			session.close();
		}
    	return dto;
    }//end mypage
    
    
    public MemberDTO login(HashMap<String, String> map)
    		throws CommonException{
    	MemberDTO dto = null;
    	SqlSession session = MySqlSessionFactory.openSession();
		try{
    	 dto = session.selectOne(namespace+"login", map);
		}catch(Exception e){
			e.printStackTrace();
			throw new CommonException("로그인 실패");
		}finally {
			session.close();
		}
		return dto;
    }//end login
    
	public void addMember(MemberDTO dto)
	 throws CommonException{
		SqlSession session = MySqlSessionFactory.openSession();
		try{
			int n = session.insert(namespace+"addMember", dto);
        session.commit();
		}catch(Exception e){
			e.printStackTrace();
			throw new CommonException("회원가입 실패");
		}finally {
			session.close();
		}
	}//end addMember
	
	public void RemoveMember(String userid)
			 throws CommonException{
				SqlSession session = MySqlSessionFactory.openSession();
				try{
					int n = session.delete(namespace+"removeMember", userid);
		        session.commit();
				}catch(Exception e){
					e.printStackTrace();
					throw new CommonException("회원탈퇴 실패");
				}finally {
					session.close();
				}
			}//end RemoveMember

	public void upadteMember(HashMap<String, String> map)
			 throws CommonException{
				SqlSession session = MySqlSessionFactory.openSession();
				try{
					int n = session.update(namespace+"updateMember", map);
					session.commit();
				}catch(Exception e){
					e.printStackTrace();
					throw new CommonException("회원수정 실패");
				}finally {
					session.close();
				}
			}//end updateMember
	
}
