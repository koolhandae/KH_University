package com.kh.khu.certificate;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CertificateController {
	
	@RequestMapping("grad.certificate")
	public String gradCertificate() {
		return "certificate/graduationCertificateTemplate";
	}
	
	@RequestMapping("transcript.certificate")
	public String transcript () {
		return "certificate/transcriptTemplate";
	}
	@RequestMapping("tuition.notice")
	public String tuitionNotice () {
		return "certificate/tuitionPaymentNotice";
	}
	@RequestMapping("tuition.reciept")
	public String tuitionReciept () {
		return "certificate/proofOfPayment";
	}
	@RequestMapping("attending.certificate")
	public String attendingCertificate () {
		return "certificate/attendingCertificate";
	}
	
}
