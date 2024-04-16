package com.kh.khu.common.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.CglibSubclassingInstantiationStrategy;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.khu.common.recaptcha.VerifyRecaptcha;
import com.kh.khu.member.model.service.MemberServiceImpl;
import com.kh.khu.member.model.vo.Member;
import com.kh.khu.student.model.service.StudentService;
import com.kh.khu.student.model.service.StudentServiceImpl;
import com.kh.khu.student.model.vo.Student;

@Controller
public class HomeController {
	
	@Autowired
	JavaMailSenderImpl mailSender;
	
	@Autowired
	private StudentServiceImpl sService;
	
	@Autowired
	private MemberServiceImpl mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	

	@RequestMapping("mainPage.me")
	public String mainPage() {
		return "common/mmain";
	}
	
	
	@ResponseBody
	@RequestMapping(value="VerifyRecaptcha", method = RequestMethod.POST)
	public int VerifyRecaptcha(HttpServletRequest request) {
		
		VerifyRecaptcha.setSecretKey("6LemhLwpAAAAAGXxw7GsPmlVyrJfVx8ewQ5KR-7V");
	    String gRecaptchaResponse = request.getParameter("recaptcha");
	    
	    try {
		       if(VerifyRecaptcha.verify(gRecaptchaResponse))
		          return 0; // 성공
		       else return 1; // 실패
		    } catch (Exception e) {
		        e.printStackTrace();
		        return -1; //에러
		    }
	    
	}
	
	
	@ResponseBody
	@RequestMapping("chkmail.me")
	public String chkMail(String memberType, String email, HttpSession session) {
		
		Student s = new Student();
		Member m = new Member();
		
		System.out.println(memberType);
		
		if(memberType.equals("s")) {
			s = sService.selectChkStudent(email);			
		}else if(memberType.equals("m")){
			m = mService.selectChkMember(email);			
		}else {
			s=null; m=null;
		}
		
		System.out.println(s == null);
		System.out.println(s);
		System.out.println(m);
		
		if(s != null) {
			/* 해당이메일에 해당하는 Id를 세션값에 올려서 사용해줌 */
			session.setAttribute("targetId", s.getStudentId());	
			return "NNNNY";
			
		}else if(m != null){
			session.setAttribute("targetId", m.getMemberId());		
			return "NNNNY";
		}else {
			return "NNNNN";
		}
		
//		return (s != null || m != null) ? "NNNNY" : "NNNNN";
	}
	
	@ResponseBody
	@RequestMapping("sendmail.do")
	public ResponseEntity<Map<String, Object>> sendmail(String email, String userId, HttpSession session) {
				
			Map<String, Object> resultMap = new HashMap();
			// System.out.println(email);
			 System.out.println("sendmailcontroll" + userId);

				//난수의 범위 111111 ~ 999999 (6자리 난수)
				Random random = new Random();
				int checkNum = random.nextInt(888888)+111111;
				System.out.println("인증번호" + checkNum);
				
				String url = "http://localhost:8808/khu/changePwdForm.me?checkNum=" + checkNum;
				
				//이메일 보낼 양식
				String setFrom = "koolhandae@gmail.com"; //2단계 인증 x, 메일 설정에서 POP/IMAP 사용 설정에서 POP/SMTP 사용함으로 설정o
				String toMail = email;
				String title = "쿨한대학교 학사정보시스템 비밀번호 재설정 인증 메일 입니다.";
				String content = "<h1 style='color:#1c4587'>임시 비밀번호 안내입니다.</h1>"
								+ "<br>"
								+ "<h4>안녕하세요.</h4>"
								+ "<h4>아래 링크를 통해 비밀번호 재설정이 가능합니다.</h4>"
								+ "<h3><a href='" + url + "' style='color:#1c4587; text-decoration:none;'>'링크확인'</a>" +"</h4>" 
								+ "<h4> ↑ 클릭 후, 비밀번호 재설정이 가능합니다.</h4><br>"
								+ "<h5>감사합니다😀</h5><br><br>";	
				try {
					MimeMessage message = mailSender.createMimeMessage(); //Spring에서 제공하는 mail API
		            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		            
		            helper.setFrom(setFrom);
		            helper.setTo(toMail);
		            helper.setSubject(title);
		            helper.setText(content, true);
		            mailSender.send(message);
				} catch (Exception e) {
					e.printStackTrace();
				}
			
				//resultMap.put("userId", userId);
				resultMap.put("checkNum", checkNum);
				
				
				return ResponseEntity.ok().body(resultMap);
		
	}
	
	@RequestMapping("changePwdForm.me")
	public ModelAndView changePwdForm(String memberId, String checkNum, ModelAndView mv, HttpSession session) {
		
		// 페이지뒤에 난수가 없을경우에는 못바꾸게 막음!
		if(checkNum != "") {
			System.out.println("changePwdForm" + memberId);
			mv.addObject("memberId", memberId);
			mv.setViewName("common/findPassword"); 
			
		}else {
			session.setAttribute("errorMsg", "잘못된 경로로 접근하셨습니다");
			mv.setViewName("common/errorPage404");
		}
		return mv;
		
	}
	
	@RequestMapping("changePwd.me")
 	public String changePwd(String memberId, String userPwd, HttpSession session) {
		
		//System.out.println("changeCON" + memberId);
		//System.out.println("changeCON" + userPwd);
		
		String encPwd = bcryptPasswordEncoder.encode(userPwd);
		System.out.println(encPwd);
		
		int result = 0;
		int mresult = 0;
		
		if(memberId.startsWith("kh")) {
			result = sService.changePwd(memberId, encPwd);			
		}else {
			mresult = mService.changemPwd(memberId, encPwd);			
		}
		
		/*tagetId를 더이상 사용할 필요가없으므로 session 값을 지워줌*/
		session.removeAttribute("targetId");
		
		if(result>0 || mresult >0) {
			session.setAttribute("alertMsg", "비밀번호를 변경하였습니다!");
			return "redirect:/";
			
		}else {
			session.setAttribute("alertMsg", "비밀번호 변경에 실패하였습니다");
		}
		return "redirect:/";
		
	}
}
