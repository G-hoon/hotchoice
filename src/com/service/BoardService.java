package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.MySqlSessionFactory;
import com.entity.BoardDTO;
import com.entity.RecordDTO;
import com.entity.VoteDTO;

public class BoardService {

	String namespace = "com.acorn.BoardMapper.";
	 //전체 레코드 
	 private int totalRecord(){
		 SqlSession session = MySqlSessionFactory.openSession();
		 int count = 0;	
		 try{
         count = session.selectOne("totalRecord");
			}finally {
				session.close();
			}
		 return count;
	 }//end totalRecord
	
	//8. 페이징
	 /*
		public PageDTO boardPage(int curPage){
			PageDTO page = new PageDTO();
			
			SqlSession session = MySqlSessionFactory.openSession();
			List<BoardDTO> list = null;
			int skip = (curPage - 1) *page.getPerPage();
			try{
		list =
		session.selectList(namespace+"boardList",
				          null,new RowBounds(skip, page.getPerPage()) );		
			}finally {
				session.close();
			}
			//PageDTO에 4가지 정보 저장
			page.setList(list);
			page.setCurPage(curPage);
			page.setTotalRecord(totalRecord());

			return page;
		}//end 
	
	
	*/
	
	
	
	
	//7. 검색
	 public List<BoardDTO> boardSearch(HashMap<String, String> map){
			 SqlSession session = MySqlSessionFactory.openSession();
			 List<BoardDTO> list = null;
			 try{
				 list = session.selectList("boardSearch", map);
				}finally {
					session.close();
				}
			 return list;
		 }//end boardSearch
	
	//6. 수정
	public void boardUpdate(HashMap<String, String> map){
			 SqlSession session = MySqlSessionFactory.openSession();
				try{
					session.update(namespace+"boardUpdate", map);
					session.commit();
				}finally {
					session.close();
				}
		 }//end boardDelete
	
	
	 //5. 삭제
	 public void boardDelete(int num){
		 SqlSession session = MySqlSessionFactory.openSession();
			try{
				session.delete(namespace+"boardDelete", num);
				session.commit();
			}finally {
				session.close();
			}
	 }//end boardDelete
	
	
	
	 //4. 조회수 증가
	 public void boardReadcnt(int num){
		 SqlSession session = MySqlSessionFactory.openSession();
			try{
	   session.update(namespace+"boardReadcnt", num);
	   session.commit();
			}finally {
				session.close();
			}
	 }//end boardReadcnt
	
	
	//3.글자세히보기
	 public BoardDTO boardRetrieve(int num){
		 //조회수 증가
		 boardReadcnt(num);
		 SqlSession session = MySqlSessionFactory.openSession();
			BoardDTO dto = null;
		   try{
			   dto = session.selectOne(namespace+"boardRetrieve", num);
			}finally {
				session.close();
			}
		   return dto;
	 }//end boardRetrieve
	

	
	
	
	//2.글쓰기
	public void boardWrite(BoardDTO dto){
		SqlSession session = MySqlSessionFactory.openSession();
		try{
		 session.insert(namespace+"boardWrite", dto);
		 session.commit();
		}finally {
			session.close();
		}
		
	}//end boardWrite
	public void voteWrite(ArrayList<VoteDTO> xxx){
		
		SqlSession session = MySqlSessionFactory.openSession();
		try{
		  int n = session.insert("voteWrite", xxx);
		  session.commit();
		}finally{
			session.close();
		}
    }
	///투표하기
	public void Voting(RecordDTO dto){
		SqlSession session = MySqlSessionFactory.openSession();
		try{
		 session.insert(namespace+"voting", dto);
		 session.commit();
		}finally {
			session.close();
		}
	}
	///투표변경
	/*   <update id="Voting_Update" parameterType="hashmap">
    update vote_record
    set vote_num=#{b} where num = #{a}
 </update>

*/	public void Voting_Update(HashMap<String, String> map){
		 SqlSession session = MySqlSessionFactory.openSession();
			try{
				session.update(namespace+"Voting_Update", map);
				session.commit();
			}finally {
				session.close();
			}
	 }//end boardDelete

	//투표결과
	public RecordDTO Voting_result2(HashMap<String, String> map){
		SqlSession session = MySqlSessionFactory.openSession();
		RecordDTO rtd = null;
		try{
		 rtd = session.selectOne(namespace+"voting_result2", map);
		}finally {
			session.close();
		}
		return rtd;
	}
	//각각의 1~4번 투표 개수 출력
	public int Voting_result3(HashMap<String, String> map){
		SqlSession session = MySqlSessionFactory.openSession();
		int rtd = 0;
		try{
		 rtd = session.selectOne(namespace+"voting_result3", map);
		}finally {
			session.close();
		}
		return rtd;
	}
	//3.투표 보기
	 public VoteDTO voteRetrieve(int num){
		 SqlSession session = MySqlSessionFactory.openSession();
			VoteDTO vto = null;
		   try{
			   vto = session.selectOne(namespace+"voteRetrieve", num);
			}finally {
				session.close();
			}
		   return vto;
	 }
	 //
	 public List<VoteDTO> voteRetrieve2(){
		 SqlSession session = MySqlSessionFactory.openSession();
		 List<VoteDTO> list = null;
		   try{
			   list = session.selectList(namespace+"voteRetrieve2");
			}finally {
				session.close();
			}
		   return list;
	 }
	//1.목록보기
	public List<BoardDTO> boardList(){
		SqlSession session = MySqlSessionFactory.openSession();
		List<BoardDTO> list = null;
		try{
			list = session.selectList(namespace+"boardList");		
		}finally {
			session.close();
		}
		return list;
	}//end 
	
}
