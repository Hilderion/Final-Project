package kr.co.fa.dao;

import java.util.List;
import java.util.Map;

import kr.co.fa.vo.ExcFriends;
import kr.co.fa.vo.Follow;
import kr.co.fa.vo.Friend;
import kr.co.fa.vo.FriendEvent;
import kr.co.fa.vo.User;

public interface FriendDao {

	//현재 로그인 유저가 받은 친구 요청 조회
	int getFriendRequestCount (int userNo);
	//현재 로그인 유저의 친구 조회
	List<User> getFriendsByUserNo (int no);
	//친구 신청 이벤트 조회
	List<FriendEvent> getFriendApply (int no);
	//친구 요청 이벤트 조회
	List<FriendEvent> getFriendRequest (int no);
	//친구 추가이벤트 취소
	void cancelAddFriendEvent (FriendEvent friendEvent);
	//친구 추가이벤트 추가
	void addFriendEvent (FriendEvent friendEvent);
	//친구 추가
	void addFriend (Friend friend);
	//친구 끊기
	void delFriend (Friend friend);
	//allim 업데이트
	void updateFriend (Friend friend);
	//follow 추가
	void addFollow (Follow follow);
	//follow 삭제
	void delFollow (Follow follow);
	//친구 끊기 시 follow 삭제
	void delFriendFollow (Follow follow);
	//follow 조회
	Follow getFollow (Follow follow);
	// 친구추천 제외한 친구 빼고 목록 조회
	// 제외할 (제외신청한 사람 / 제외 요청 리스트) 친구 목록과 추천 친구목록을 를 넣어 조회
	List<User> getComplexFriends (ExcFriends friend);
	List<User> getComplexFriends2 (ExcFriends friend);
	// 검색에서 제외할 친구 목록을 DB에서 조회
	List<ExcFriends> getExcFriendsByUserNo (int userNo);
	User getUserByNo (int userNo);
	void addExcFriend (ExcFriends friend);
	List<Map<String, Object>> getRecFriendsByUserNo (int userNo);
}
