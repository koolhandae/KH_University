package com.kh.khu.certificate;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class CertificateController {
	
	@RequestMapping("grad.certificate")
	public String pdfPrint() {
		return "certificate/graduationCertificateTemplate";
	}
	
}
