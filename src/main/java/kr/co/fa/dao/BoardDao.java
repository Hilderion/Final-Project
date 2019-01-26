package kr.co.fa.dao;

import java.util.List;

import kr.co.fa.vo.Board;
import kr.co.fa.vo.BoardMedia;
import kr.co.fa.vo.Criteria;
import kr.co.fa.vo.Like;
import kr.co.fa.vo.Reply;
import kr.co.fa.vo.Tag;
import kr.co.fa.vo.User;

public interface BoardDao {

	//게시글의 댓글을 쓴 유저의 정보 조회
	List<Reply> getReplyInfoByBoardNo (int boardNo);
	//게시글의 좋아요 누른 유저의정보 조회
	List<Like> getLikeInfoByBoardNo (int boardNo);
	//게시글에 태그 추가
	void addTag (Tag tag);
	//게시글에 미디어 추가
	void addMedia (BoardMedia boardMedia);
	//게시글 추가
	void addBoard (Board board);
	//로그인한 유저의 게시글 미디어 조회
	List<BoardMedia> getUserMedias (int userNo);
	//로그인한 유저의 메인게시글 조회
	List<Board> getUserMainBoards (int userNo);
	// 로그인한 유저의 모든게시글 조회
	List<Board> getUserBoards (int userNo);
	// 로그인한 유저의 게시글 추가
	void addUserBoards (Board board);
	// 게시글번호에맞는 글 정보 조회
	Board getBoardByNo (int boardNo);
	// 유저,친구 테이블 조인
	List<User> getFriendOfUser (Criteria criteria);
	// 유저가 팔로잉하는사람 조회
	List<User> getFollowingOfUser (Criteria criteria);
	// 나를 팔로워하는사람 조회
	List<User> getFollowerOfUser (Criteria criteria);
	// 유저의 게시글 공개범위 모두 업데이트
	void updateAllUserBoardOpenRange (Criteria criteria);
	// 유저가 선택한 게시글만 공개범위 업데이트
	void updateSelectedUserBoardOpenRange (Criteria criteria);
	// 검색어로 유저, 페이지, 게시글 찾는 메소드 3개
	List<User> getUserInfoByKeyword (Criteria criteria);
	List<User> getPageInfoByKeyword (Criteria criteria);
	List<Board> getBoardInfoByKeyword (Criteria criteria);
	// 좋아요 누를시 insert
	void addLike (Like like);
	// 좋아요 누른사람이 다시 누를시 delete
	void deleteLike (Like like);
	// 좋아요 누를시 해당 게시글의 좋아요 수 update
	void updateBoardLike (Board board);
	// 프로필에서 좋아요한 페이지 조회
	List<User> getLikePageOfUser (int UserNo);
	// 유저의 정보 갱신
	void updateUserInfo(User user);
	// 게시글의 댓글 가져오기
	List<Board> getReplyOfBoard(int boardNo);
	// 댓글 추가
	void addReplyOfBoard(Reply reply);
	// 대댓글 추가
	void addReplyOfReply (Reply reply);
	// reply_sequence 최대값 가져오기
	int maxSequenceOfReply (int parentNo);
	// 방금 적은 댓글가져오는 용도의 메소드
	Reply getNewReply (int boardNo);
	// 유저 번호로 미디어 정보들 조회
	BoardMedia getMediaDetailByBoardNo(int id);
	// 댓글의 댓글 가져오기
	List<Reply> getReplyOfReplyByReplyNo(Reply reply);
	List<BoardMedia> getBoardMedia(int userNo);
	List<User> getFriendBirthInfoByUser(int userNo);
	
	// 게시글번호로 미디어만가져오기
	List<BoardMedia> getBoardMediasByBoardNo (int boardNo);
}
