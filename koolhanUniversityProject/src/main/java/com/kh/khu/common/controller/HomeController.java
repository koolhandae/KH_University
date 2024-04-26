package com.kh.khu.common.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.common.model.vo.ProfilePicture;
import com.kh.khu.common.recaptcha.VerifyRecaptcha;
import com.kh.khu.common.template.Pagination;
import com.kh.khu.common.template.SaveFile;
import com.kh.khu.member.model.service.MemberServiceImpl;
import com.kh.khu.member.model.vo.Member;
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
	@RequestMapping(value = "shuttleBus.do", produces = "text/xml; charset=utf-8")
	public String BusRealTime() throws IOException {

		String url = "http://apis.data.go.kr/1613000/BusLcInfoInqireService/getRouteAcctoBusLcList";
		url += "?serviceKey="
				+ "JIkT3%2BUOMXlT8X3XWzwz5XxB%2FwhH3Z8Z7wKvvM1XSqlMlvY2UGJbQXGF%2F69KXoiOOQ9N7Q%2Fo2aVJHbcB8wNznA%3D%3D";
		url += "&cityCode=25";
		url += "&routeId=DJB30300052";
		url += "&numOfRows=10";
		url += "&pageNo=1";
		url += "&_type=xml";

		// System.out.println(url);

		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection) requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");

		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));

		String responseText = "";
		String line;
		while ((line = br.readLine()) != null) {
			responseText += line;
		}

		br.close();
		urlConnection.disconnect();
		
		// System.out.println(responseText);
		return responseText;
		
	}

	@RequestMapping(value = "busApiForm.do")
	public String busApi(HttpSession session) {
		return "common/busMapApi";
	}

	@ResponseBody
	@RequestMapping(value = "VerifyRecaptcha", method = RequestMethod.POST)
	public int VerifyRecaptcha(HttpServletRequest request) {

		VerifyRecaptcha.setSecretKey("6LemhLwpAAAAAGXxw7GsPmlVyrJfVx8ewQ5KR-7V");
		String gRecaptchaResponse = request.getParameter("recaptcha");

		try {
			if (VerifyRecaptcha.verify(gRecaptchaResponse))
				return 0; // 성공
			else
				return 1; // 실패
		} catch (Exception e) {
			e.printStackTrace();
			return -1; // 에러
		}

	}

	@ResponseBody
	@RequestMapping("chkmail.st")
	public Student chkMailSt(String email, HttpSession session) {

		System.out.println(email);

		Student s = new Student();
		s = sService.selectChkStudent(email);

		System.out.println(s);

		if (s != null) {
			/* 해당이메일에 해당하는 Id를 세션값에 올려서 사용해줌 */
			session.setAttribute("targetId", s.getStudentId());
		}

		return s;
	}

	@ResponseBody
	@RequestMapping("chkmail.me")
	public Member chkMailMe(String email, HttpSession session) {

		Member m = new Member();

		m = mService.selectChkMember(email);

		if (m != null) {
			/* 해당이메일에 해당하는 Id를 세션값에 올려서 사용해줌 */
			session.setAttribute("targetId", m.getMemberId());
		}

		return m;

	}

	@ResponseBody
	@RequestMapping("sendmail.do")
	public ResponseEntity<Map<String, Object>> sendmail(String email, String userId, HttpSession session) {

		Map<String, Object> resultMap = new HashMap();
		// System.out.println(email);
		System.out.println("sendmailcontroll" + userId);

		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("인증번호" + checkNum);

		String url = "http://localhost:8808/khu/changePwdForm.me?checkNum=" + checkNum;

		// 이메일 보낼 양식
		String setFrom = "koolhandae@gmail.com"; // 2단계 인증 x, 메일 설정에서 POP/IMAP 사용 설정에서 POP/SMTP 사용함으로 설정o
		String toMail = email;
		String title = "쿨한대학교 학사정보시스템 비밀번호 재설정 인증 메일 입니다.";
		String content = "<h1 style='color:#1c4587'>임시 비밀번호 안내입니다.</h1>" + "<br>" + "<h4>안녕하세요.</h4>"
				+ "<h4>아래 링크를 통해 비밀번호 재설정이 가능합니다.</h4>" + "<h3><a href='" + url
				+ "' style='color:#1c4587; text-decoration:none;'>'링크확인'</a>" + "</h4>"
				+ "<h4> ↑ 클릭 후, 비밀번호 재설정이 가능합니다.</h4><br>" + "<h5>감사합니다😀</h5><br><br>";
		try {
			MimeMessage message = mailSender.createMimeMessage(); // Spring에서 제공하는 mail API
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}

		resultMap.put("userId", userId);
		resultMap.put("checkNum", checkNum);

		return ResponseEntity.ok().body(resultMap);

	}

	@RequestMapping("changePwdForm.me")
	public ModelAndView changePwdForm(String memberId, String checkNum, ModelAndView mv, HttpSession session) {

		// 페이지뒤에 난수가 없을경우에는 못바꾸게 막음!
		if (checkNum != "") {
			System.out.println("changePwdForm" + memberId);
			mv.addObject("memberId", memberId);
			mv.setViewName("common/findPassword");

		} else {
			session.setAttribute("errorMsg", "잘못된 경로로 접근하셨습니다");
			mv.setViewName("common/errorPage404");
		}
		return mv;

	}

	@RequestMapping("changePwd.me")
	public String changePwd(String memberId, String userPwd, HttpSession session, Model model) {

		// System.out.println("changeCON" + memberId);
		// System.out.println("changeCON" + userPwd);

		String encPwd = bcryptPasswordEncoder.encode(userPwd);
		System.out.println(encPwd);

		int result = 0;
		int mresult = 0;

		if (memberId.startsWith("kh")) {
			result = sService.changePwd(memberId, encPwd);
		} else {
			mresult = mService.changemPwd(memberId, encPwd);
		}

		/* tagetId를 더이상 사용할 필요가없으므로 session 값을 지워줌 */
		session.removeAttribute("targetId");

		if (result > 0 || mresult > 0) {
			HashMap<String, Object> alertMsg = new HashMap<String, Object>();
			alertMsg.put("icon", "success");
			alertMsg.put("title", "비밀번호 변경 완료");
			alertMsg.put("text", "성공적으로 비밀번호를 변경하였습니다!");
			session.setAttribute("alertMsg", alertMsg);

		} else {
			model.addAttribute("errorMsg", "비밀번호 변경에 실패하였습니다");
			return "common/errorPage404";
		}
		return "redirect:/";

	}

	@RequestMapping("library.go")
	public String goLibrary() {
		return "student/librarySearchView";
	}

	@RequestMapping("search.lib")
	public ModelAndView librarySearchApi(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			String keyWord, String condition, ModelAndView mv) throws IOException {
		String libraryServiceKey = "906401d0194b3fa7e7e67e2a8287d63fa7bb118f60ec1241a32751cc6d211f6a";
		String url = "https://www.nl.go.kr/NL/search/openApi/search.do";

		// url parameters
		url += "?key=" + libraryServiceKey;
		url += "&srchTarget=" + condition;
		url += "&kwd=" + URLEncoder.encode(keyWord, "UTF-8");
		url += "&pageNum=" + pageNum;
		url += "&pageSize=20";
		url += "&apiType=json";

		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection) requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");

		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String responseText = "";
		String line;
		while ((line = br.readLine()) != null) {
			responseText += line;
		}

		JsonObject jObj = JsonParser.parseString(responseText).getAsJsonObject();

		int listCount = jObj.get("total").getAsInt();

		PageInfo pi = Pagination.getPageInfo(listCount, pageNum, 5, 20);

		mv.addObject("list", jObj).addObject("pi", pi).addObject("keyWord", keyWord).addObject("condition", condition)
				.setViewName("student/librarySearchList");

		return mv;
	}

	@RequestMapping("mypage.go")
	public String goMypage() {
		return "common/mypage";
	}

	@RequestMapping("userList.go")
	public ModelAndView selectAllUser(ModelAndView mv) {

		int studentListCount = sService.selectStudentListCount();
		PageInfo spi = Pagination.getPageInfo(studentListCount, 1, 3, 2);
		ArrayList<Student> sList = sService.selectAllStudent(spi);
		for (Student s : sList) {
			switch (s.getStStatus()) {
			case "Y":
				s.setStStatus("재학");
				break;
			case "N":
				s.setStStatus("자퇴");
				break;
			case "H":
				s.setStStatus("휴학");
				break;
			case "Z":
				s.setStStatus("제적");
				break;
			case "J":
				s.setStStatus("졸업");
				break;
			}
		}

		int memberListCount = mService.selectMemberListCount();
		PageInfo mpi = Pagination.getPageInfo(memberListCount, 1, 3, 2);
		ArrayList<Member> mList = mService.selectAllMember(mpi);
		for (Member m : mList) {
			if (m.getMeType().equals("A")) {
				m.setMeType("교직원");
			} else {
				m.setMeType("교수");
			}
			if (m.getMeStatus().equals("Y")) {
				m.setMeStatus("재직");
			} else {
				m.setMeStatus("퇴직");
			}
		}
		mv.addObject("sList", sList).addObject("mList", mList).addObject("spi", spi).addObject("mpi", mpi)
				.setViewName("admin/userListView");
		return mv;
	}

	@ResponseBody
	@RequestMapping("profile.img")
	public HashMap<String,Object> updateProfilePicutre(@RequestParam("profileImage") MultipartFile upfile, HttpSession session) {
		Member m = (Member) session.getAttribute("loginUser");
		Student s = (Student) session.getAttribute("loginStudent");
		int result = 0;
		String changeName = SaveFile.saveFile(upfile, session);
		ProfilePicture pp = new ProfilePicture();
		pp.setOriginName(upfile.getOriginalFilename());
		pp.setChangeName("resources/uploadFiles/" + changeName);
		if (s == null) {
			pp.setRefMemberNo(m.getMemberNo());
			if (m.getChangeName() != null) {
				new File(session.getServletContext().getRealPath(m.getChangeName())).delete();
				result = mService.updateProfilePicture(pp);
			}else {
				result = mService.insertProfilePicture(pp);
			}
			session.setAttribute("loginUser", mService.loginMember(m));
		} else {
			pp.setRefStudentNo(s.getStudentNo());
			if (s.getChangeName() != null) {
				new File(session.getServletContext().getRealPath(s.getChangeName())).delete();
				result = sService.updateProfilePicture(pp);
			}else {
				result = sService.insertProfilePicture(pp);
			}
			session.setAttribute("loginStudent", sService.loginStudent(s));
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		if (result > 0) {
			map.put("title", "프로필 사진 변경 성공");
			map.put("text", "성공적으로 프로필 사진을 변경했습니다.");
			map.put("icon", "success");
			map.put("imgLocation", "/resources/uploadFiles/" + changeName);
		}else {
			map.put("title", "프로필 사진 변경 실패");
			map.put("text", "프로필 사진에 실패했습니다.");
			map.put("icon", "error");
			map.put("imgLocation", "failed");
		}
		return map;
	}
}
