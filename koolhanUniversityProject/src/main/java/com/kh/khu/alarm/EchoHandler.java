package com.kh.khu.alarm;

/*
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.api.client.util.Data;

public class EchoHandler extends TextWebSocketHandler{
	
	List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	//로그인한 전체 session 리스트
	
	//private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	//현재 로그인중인 개별유저
	
	@Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	System.out.println("afterConnectionEstablished"+session);
    	// 커넥션이 연결됐을때 클라이언트가 접속이 성공했을때 Established-> 확립되다 수립되다
    	sessionList.add(session);
    	
    	
    	String senderId = getMemberId(session); //접속한 유저의 http세션을 조회하여 id를 얻는 함수
    	if(senderId!=null) {
    		log(senderId + " 연결 됨");
    		users.put(senderId, session);//로그인중 개별유저 저장
    	}
    	
    	
    }
	@Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 클라이언트가 메시지를 보냈을 때 실행되는 로직
		System.out.println("handleTextMessage"+session+":"+message);
	}
	
	@Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // 클라이언트와 연결이 종료될 때 실행되는 로직
    	System.out.println("afterConnectionClosed"+session+":"+status);
    	
    }
	
	//로그 메세지
	private void log(String logmsg) {
		System.out.println(new Data() + " : " + logmsg);
	}
	
	private String getMemberId(WebSocketSession session) {R
		//웹소켓에 아이디 가져오기
		// 접속한 유저의 http세션을 조회하여 id를 얻는 함수
		Map<String, Object> httpSession = session.getAttributes();
		String memberId = (String)httpSession.get("loginUser");
		//Object loginUserObject = httpSession.get("loginUser");
		
		System.out.println("memberId : " + memberId);
		//System.out.println("loginUserObject : " + loginUserObject);
		return memberId==null? null : memberId;
		
		
	}
	
	
	
	
}
*/







import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.khu.common.interceptor.SessionNames;
import com.kh.khu.member.model.vo.Member;

//import com.kh.khu.common.interceptor.LoginInterceptor;

@Component
public class EchoHandler extends TextWebSocketHandler {
	
	List<WebSocketSession> sessions = new ArrayList<>();
	//이 arrayList에 접속되어있는 세션들을 전부 담을거임
	//시크릿창 하나 그냥 창 하나 열어서 서버?에 둘다 올라가는지 ?..암튼 테스트 하느라 쓴거임
	// 지금은 array로 했지만 map으로 해야됨
	// 로그인한 user의 ID를 알아야됨
	//아이디를 받는 부분을 먼저 해볼거임
	// 현재 로그인한 유저는 httpSession에 있음 웹소켓세션에 있는게 아니라
	
	Map<String, WebSocketSession> userSessions = new HashMap<>();//여기에는 현재 접속중인 값이 들어감ㄴ
	
	
	
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	System.out.println("afterConnectionEstablished"+session);
    	// 커넥션이 연결됐을때 클라이언트가 접속이 성공했을때 Established-> 확립되다 수립되다
    		sessions.add(session);
    		//session값:StandardWebSocketSession[id=99967481-d588-ffe5-8cfa-96b222bc8a71, uri=ws://localhost:8808/khu/echo]
    	// 그러면 접속하는 유저들은 여기안에 들어감
    	// key value쌍으로 하고 싶으면 map으로 하면 됨 
    		String senderId = getId(session);
    		if(senderId !=null) {    			
    			System.out.println(senderId + " 연결 됨");// bdc04ed1-2ed5-9058-a027-0b048eada88
    			userSessions.put(senderId, session);
    		}
    		// System.out.println("userSession에는 뭐가있어?" + userSessions);
    		//{bdc04ed1-2ed5-9058-a027-0b048eada888=StandardWebSocketSession[id=bdc04ed1-2ed5-9058-a027-0b048eada888, uri=ws://localhost:8808/khu/echo]}
    		//userSession에는 접속중인 유저들의 정보가 들어감

    }



	@Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // 클라이언트가 메시지를 보냈을 때 실행되는 로직
    	System.out.println("handleTextMessage "+session+":"+message);
    	// 접속되어있는 모든 사람들에게 메세지를 보낼거임
    	//ex)게임에서 접속되어있는 유저들에게 전체공지 날리는거~ 확성기
    	/*
    	if (session.isOpen()) { // 세션이 열려있는지 확인
            System.out.println("handleTextMessage" + session + ":" + message);
            
            // 메시지 보내는 로직
            session.sendMessage(message);
            
        } else {
            System.out.println("세션이 이미 닫혀있습니다.");
        }
        */
    	  
    	  
    	String senderId = session.getId(); //이렇게 하면 웹소켓세션session의 아이디 보내는사람의 아이디
    	System.out.println("senderId : "+senderId);

    	// 로그인하면 로그인한 유저의 아이디를 줄거고 로그인안했으면 소켓의 아이디를 줍시다
    	
    		//for(WebSocketSession sess : sessions) {  //sessions에 있는 놈들한테 한번씩 날리면 됨
    		//array에 묶여있는 모든세션 loop돌면서 
    		//sess.sendMessage(message);
    		//여기서 보면 메세지를 String형태로 안받고 TextMessage형태로 받음
    		//왜? 우리는 TextWebsockekHandler기 때문에
    		//바이너리?면 바이너리로 들어올거고
    		//message를 받을건데 그대로 받지 말고 가공을 해볼거임
    		//sess.sendMessage(new TextMessage(senderId+" : "+message.getPayload())); //여기서 id는 뭐냐면 세션의 아이디 누가 보냈다! senderId
    		//정확하게 말하자면 그냥 message로 뿌리면 안되고 message.getPayload()라는게 있음 이게 실제로 보낸 내용임 // .getPayloadLength()는 메세지길이 byte수
    		//내가 받은 메세지의 내용을 senderId : 해서 보낼거임~ 이렇게하면 view단에서 onmessage이 부분을 탈거임 
    		
    	//	}
    	
    	//protocol: cmd,댓글작성자,게시글 작성자,bno (User1의 게시글에 User2가 댓글을 달았다면,234)
    	//(ex reply,user2,user1,1234)
    	String msg = message.getPayload();
//    	System.out.println("msg핸들러ㅓㅓ"+msg);
    	
    	
    	
    	if(StringUtils.isNotEmpty(msg)) {	
    		String[] strs = msg.split(","); //ㅁ메세지가 없으면 클라이언트에서는 안보내줘야함 null값이 뜨니까 null처리도 해줄것
//    		System.out.println("strs: " + Arrays.toString(strs)); // 배열 값 뽑는방법

    		if(strs != null && strs.length <= 4) {
    			String cmd = strs[0]; // 공백을 제거하여 프로토콜을 추출
//    			System.out.println("cmd : "+cmd);
    			//cmd 종류 
    			//NT-공지사항
    			//PJ-과제
    			String replyWriter = strs[1]; 
//    			System.out.println("replyWriter : " + replyWriter);
    			String boardWriter = strs[2];
//    			System.out.println("boardWriter : " + boardWriter);
    			String bno = strs[3];
//    			System.out.println("bno : " + bno);
    			
    			//게시글 작성자가 온라인일때만!
    			WebSocketSession boardWriterSession =  userSessions.get(boardWriter);//게시글 작성자가 있으면
//    			System.out.println("sessions : "+sessions);
//    			System.out.println("userSessions :"+userSessions);
//    			System.out.println("boardWriter : "+boardWriter);
//    			System.out.println("boardWriterSession : "+boardWriterSession);
    			
    			
    			if("PJ".equals(cmd)) {
    				// && boardWriterSession != null
    				TextMessage tmpMsg = new TextMessage("과목 '"+bno + "'의 과제가 등록되었습니다");
//    				System.out.println("tmpMsg" + tmpMsg);
    				boardWriterSession.sendMessage(tmpMsg);
    				
    			}else if("NT".equals(cmd)) {// 공지사항 등록됐을때
    				TextMessage tmpMsg = new TextMessage("공지사항 :" + replyWriter + " (이)가 등록되었습니다.");
//    				System.out.println("tmpMsg" + tmpMsg);
    				// 모든 로그인한 사용자에게 메시지를 보냄
    		        for (WebSocketSession userSession : userSessions.values()) {
    		            userSession.sendMessage(tmpMsg);
    		        }
    				
//    				System.out.println("session : " + session);
    			}
    		}
    	}
    	
    }

    
    

    
    
    private String getId(WebSocketSession session) {
        // 웹 소켓 세션에서 로그인 사용자 정보를 가져옴
    	Map<String, Object> httpSession = session.getAttributes();
    	Object loginUserObject = httpSession.get(SessionNames.LOGIN);
//    	System.out.println("loginUserObject : "+loginUserObject);
//    	System.out.println("httpSession : " + httpSession);
    	
    	
    	
        if (loginUserObject != null) {
            // 로그인한 사용자인 경우
            Member loginUser = (Member) loginUserObject;
//            System.out.println("loginUser" + loginUser);
            return loginUser.getMemberId(); // 사용자의 아이디를 반환
        } else {
            // 로그인하지 않은 경우 또는 로그인 정보가 올바르지 않은 경우
//        	System.out.println("session.getId()" + session.getId());
            return session.getId(); // 웹 소켓 세션의 ID를 반환
        }
    
    
}

    
	@Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // 클라이언트와 연결이 종료될 때 실행되는 로직
//    	System.out.println("afterConnectionClosed"+session+":"+status);
    	
    }
}

    
	 


   