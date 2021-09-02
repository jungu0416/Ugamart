package com.jg.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jg.dto.CeoEachOrderDto;
import com.jg.dto.CeoProductDto;
import com.jg.dto.CeoRegisterProductDto;
import com.jg.dto.CeoReviewDto;
import com.jg.dto.CustomerDto;
import com.jg.dto.CustomerEachOrderDto;
import com.jg.dto.CustomerReviewDto;
import com.jg.dto.CustomerStoreDto;
import com.jg.dto.ProductByCategoryDto;
import com.jg.dto.ProductDto;
import com.jg.dto.ProductReviewDto;
import com.jg.dto.RiderDto;
import com.jg.dto.RiderEachOrderDto;
import com.jg.service.CeoService;
import com.jg.service.CustomerService;
import com.jg.service.ProductService;
import com.jg.service.RiderService;

@Controller
public class HomeController {
	@Autowired
	CeoService service;
	@Autowired
	CustomerService customerService;
	@Autowired
	ProductService productService;
	@Autowired
	RiderService riderService;
	
	
	//토탈 메인페이지
	@RequestMapping(value = "/")
	public String home() {
		return "total_Mainpage";
	}
	
	//----------------------------------------------------------------------
	//소비자 메인페이지
	@RequestMapping(value = "/customerMainPage")
	public String customerMainPage(Model model) {
		List<CustomerStoreDto> list = customerService.showAllStore();
		
		model.addAttribute("list",list);
		return "customer_mainPage";
	}
	
	//소비자 로그인
	@RequestMapping(value = "/customerLogin")
	public String customerLogin() {
		return "customer_login";
	}
	//소비자 로그인 액션
	@RequestMapping(value = "/customerLoginAction")
	public String customerLoginAction(HttpServletRequest request,String id, String pw) {
		int result= customerService.checkLogin(id, pw);
		String str = "";
		
		
		if(result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("login_id", id);
			
			//여기에 회원과 근처인 리스트들 담아서 메서드 실행시켜야댐
			List<CustomerStoreDto> list = customerService.showAllStore();
			request.setAttribute("list",list);
			
			str = "customer_mainPage";
		}else {
			request.setAttribute("msg","아이디/비밀번호가 틀립니다");
			str = "customer_login";
		}
		return str;
	}
	//소비자 로그아웃 페이지
	@RequestMapping(value = "/customerLogout")
	public String customerLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		
		List<CustomerStoreDto> list = customerService.showAllStore();
		
		request.setAttribute("list",list);
		request.setAttribute("msg", "로그아웃 되었습니다");
		return "customer_mainPage";
	}
	
	//소비자 회원가입
	@RequestMapping(value = "/customerRegisterPage")
	public String customer_registerPage() {
		return "customer_registerPage";
	}
	
	//소비자 회원가입 액션
	@RequestMapping(value = "/customerRegisterPageAction")
	public String customerRegisterPageAction(HttpServletRequest request,String id, String pw, String name,String addressFirst, String addressLast, String phone,String emailFirst,String emailLast) {
		String address = addressFirst + " " + addressLast;
		String email = emailFirst + " " + emailLast; 
		
		int result = customerService.registerAction(new CustomerDto(id,pw,name,phone,address,email));
		
		if(result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("login_id", id);
			request.setAttribute("msg", "회원가입이 완료되었습니다.");
		}else {
			request.setAttribute("msg", "회원가입 실패!");
		}
		
		return "customer_mainPage";
	}
	
	//소비자 리뷰작성
	@RequestMapping("/writeReview")
	public String writeReview(Model model,String customer_id, String ceo_number, String product_number ,String rating,String customer_content) {
		
		int result = customerService.writeReview(customer_id, ceo_number, product_number, rating, customer_content);
		System.out.println("리뷰작성 서비스에 대한 result : " + result);
		if(result==1) {
			model.addAttribute("리뷰가 성공적으로 작성되었습니다");
		}else {
			model.addAttribute("msg","이미 작성된 리뷰입니다 마이페이지에서 수정이나 삭제를 해주세요");
		}
		
		ProductDto dto = productService.eachProduct(ceo_number, product_number);
		List<ProductReviewDto> list = productService.productReview(ceo_number, product_number);
		
		model.addAttribute("dto",dto);
		model.addAttribute("list",list);
		
		return "customer_eachproduct";
	}
	
	
	//소비자 마이페이지 회원정보 [이게 메인]
	@RequestMapping(value = "/mypage")
	public String mypage(Model model,HttpSession session) {
		String id = (String) session.getAttribute("login_id");
		
		CustomerDto dto = customerService.myPage(id);
		model.addAttribute("dto",dto);
		return "customer_myPageMemberInfo";
	}
	
	//소비자 마이페이지 폰번호 변경
	@RequestMapping(value="/modifyPhoneNumber")
	public String modifyPhoneNumber(Model model, HttpSession session,String phone) {
		String id = (String)session.getAttribute("login_id");
		String str = "";
		
		int result = customerService.modifyPhone(id, phone);
		if(result == 1) {
			CustomerDto dto = customerService.myPage(id);
			model.addAttribute("dto",dto);
			
			model.addAttribute("msg","폰 번호 변경 완료!");
			str = "customer_myPageMemberInfo";
		}else {
			CustomerDto dto = customerService.myPage(id);
			model.addAttribute("dto",dto);
			
			model.addAttribute("msg","폰 번호 변경 실패 ");
			str = "customer_myPageMemberInfo";
		}
		return str;
	}
	
	//소비자 마이페이지 이메일 변경
	@RequestMapping(value="/modifyEmail")
	public String modifyEmail(Model model, HttpSession session,String emailFront, String emailBack) {
		String id = (String)session.getAttribute("login_id");
		String email = emailFront + "@" + emailBack;
		String str = "";
		
		int result = customerService.modifyEmail(id, email);
		if(result == 1 ) {
			CustomerDto dto = customerService.myPage(id);
			model.addAttribute("dto",dto);
			
			model.addAttribute("msg","이메일 변경완료");
			str = "customer_myPageMemberInfo";
		}else {
			CustomerDto dto = customerService.myPage(id);
			model.addAttribute("dto",dto);
			
			model.addAttribute("msg","이메일 변경 실패");
			str = "customer_myPageMemberInfo";
		}
		return str;
	}
	
	//소비자 마이페이지 비밀번호 변경
	@RequestMapping(value = "/customer_myPagePassword")
	public String customer_myPagePassword() {
		return "customer_myPagePassword";
	}
	
	//소비자 마이페이지 비밀번호 변경액션
	@RequestMapping(value="customer_myPagePasswordAction")
	public String customer_myPagePasswordAction(Model model, HttpSession session,String pw) {
		String id = (String) session.getAttribute("login_id");
		String str = "";
		
		int result = customerService.changPW(id, pw);
		
		if(result ==1) {
			List<CustomerStoreDto> list = customerService.showAllStore();

			model.addAttribute("list",list);
			model.addAttribute("msg","비밀번호 변경 완료");
			
			str = "customer_mainPage";
		}else {
			model.addAttribute("msg","비밀번호 변경 실패 !");
			str = "customer_myPagePassword";
		}
		return str;
	}
	
	//소비자 마이페이지 이벤트
	@RequestMapping(value = "/customer_myPageEvent")
	public String customer_myPageEvent() {
		return "customer_myPageEvent";
	}
	
	//소비자 마이페이지 탈퇴
	@RequestMapping(value = "/customer_myPageDrop")
	public String customer_myPageDrop() {
		return "customer_myPageDrop";
	}
	
	//소비자 마이페이지 탈퇴액션
	@RequestMapping(value = "/customer_myPageDropAction")
	public String customer_myPageDropAction(Model model, HttpSession session) {
		String id = (String)session.getAttribute("login_id");
		String str = "";
		
		int result = customerService.dropMember(id);
		
		if(result==1) {
			model.addAttribute("msg","회원삭제 성공!");
			session.invalidate();
			
			List<CustomerStoreDto> list = customerService.showAllStore();
			model.addAttribute("list",list);
			
			str = "customer_mainPage";
		}else {
			model.addAttribute("msg","회원삭제 실패!");
			str = "customer_myPageDrop";
		}
		return str;
	}
	
	//소비자 마이페이지 취소/반품/교환내역
	@RequestMapping("/customer_myPageReturn")
	public String customer_myPageReturn() {
		return "customer_myPageReturn";
	}
	
	
	//소비자 마이페이지 주문 배송
	@RequestMapping("/customer_myPageOrder")
	public String customer_myPageOrder(Model model,HttpSession session) {
		String id = (String)session.getAttribute("login_id");
		
		List<CustomerEachOrderDto> list = customerService.getOrderList(id);
		
		if(list!=null) {model.addAttribute("list",list);}
		return "customer_myPageOrder";
	}
	
	//소비자 마이페이지 상품 후기 [만들어야함]
	@RequestMapping("/customer_myPageReview")
	public String customer_myPageReview(Model model,HttpSession session) {
		String id = (String) session.getAttribute("login_id");
	
		List<CustomerReviewDto> list = customerService.getReviewList(id);
		model.addAttribute("list",list);
		return "customer_myPageReview";
	}
	
	//소비자 eachProduct
	@RequestMapping(value="/eachProduct")
	public String eachProduct(Model model,String ceo_number, String product_number,String login_id) {
		
		ProductDto dto = productService.eachProduct(ceo_number, product_number);
		List<ProductReviewDto> list = productService.productReview(ceo_number, product_number);
		Map<String,String> map1 = productService.findAddress(login_id, ceo_number);
		
		model.addAttribute("dto",dto); //프로덕트 정보
		model.addAttribute("list",list); //리뷰정보
		model.addAttribute("map1",map1); //소비자와 사용자 주소 
		
		return "customer_eachproduct";
	}
	
	//소비자 카테고리별 페이지
	@RequestMapping(value="/productByCategory")
	public String productByCategory(Model model,String category) {
		List<ProductByCategoryDto> list = productService.productByCategory(category);
		
		model.addAttribute("list",list);
		return "customer_productCategory";
	}
	
	//----------------------------------------------------------------------
	//라이더 로그인페이지
	@RequestMapping(value = "/riderLogin")
	public String riderLogin() {
		return "rider_login";
	}
	
	//라이더 로그인액션
	@RequestMapping(value = "/riderLoginAction")
	public String riderLoginAction(Model model,String id,String pw,HttpSession session) {
		int result = riderService.loginAction(id, pw);
		String str = "";
		if(result == 1) {
			session.setAttribute("login_id", id);
			
			List<RiderEachOrderDto> list = riderService.orderList();
			model.addAttribute("list",list);
			str ="rider_find_orderList";
		}else {
			model.addAttribute("msg","아이디/비밀번호를 확인해주세요");
			str ="rider_login";
		}
		
		return str;
	}
	
	//라이더 로그아웃
	@RequestMapping(value = "/riderLogout")
	public String riderLogout(Model model,HttpSession session) {
		session.invalidate();
		model.addAttribute("msg","로그아웃 되었습니다");
		
		return "rider_login";
	}
	
	//라이더 회원가입
	@RequestMapping(value = "/riderRegister")
	public String riderRegister() {
		return "rider_register";
	}
	
	//라이더 회원가입 액션
	@RequestMapping(value = "/riderRegisterAction")
	public String riderRegisterAction(Model model,HttpSession session,String id, String pw, String name,String phone,String addressFirst, String addressLast) {
		String address = addressFirst + " " + addressLast;
		String str = "";
		
		int result = riderService.registerAction(new RiderDto(id,pw,name,phone,address));
		if(result == 1) {
			session.setAttribute("login_id", id);
			
			List<RiderEachOrderDto> list = riderService.orderList();
			model.addAttribute("list",list);
			str = "rider_find_orderList";
		}else {
			model.addAttribute("msg","회원가입 실패");
			str = "riderRegister";
		}
		
		return str;
	}
	
	//라이더 주문접수
	@RequestMapping("/pickOrderList")
	public String pickOrderList(Model model,String login_id,String order_number) {
		
		int result = riderService.pickOrder(login_id, order_number);
		if(result == 1) {
			model.addAttribute("msg","주문접수 완료!");
		}else {
			model.addAttribute("msg","주문접수 실패!");
		}
		
		List<RiderEachOrderDto> list = riderService.orderList();
		model.addAttribute("list",list);
		return "rider_find_orderList";
	}
	
	//라이더 메인페이지 - 주문찾기
	@RequestMapping(value="/findOrderList")
	public String findOrderList(Model model) {
		List<RiderEachOrderDto> list = riderService.orderList();
		model.addAttribute("list",list);
		
		return "rider_find_orderList";
	}
	
	
	//라이더 주문중인사항
	@RequestMapping("/deliveryWhether")
	public String deliveryWhether(Model model,String login_id) {
		
		List<RiderEachOrderDto> list = riderService.riderDeliveryList(login_id);
		model.addAttribute("list",list);
		return "rider_delivery";
	}
	
	
	//라이더 픽업완료 버튼
	@RequestMapping("/pickupDone")
	public String pickupDone(Model model, String rider_id, String order_number) {
		
		int result = riderService.updateDelivery(order_number);

		if(result == 1) {
			model.addAttribute("msg","픽업완료!");
		}else {
			model.addAttribute("msg","오류발생!");
		}
		
		List<RiderEachOrderDto> list = riderService.riderDeliveryList(rider_id);
		model.addAttribute("list",list);
		return "rider_delivery";
	}
	
	//라이더 배달완료 버튼
	@RequestMapping("/deliveryDone")
	public String deliveryDone(Model model,String rider_id,String order_number) {
		int result = riderService.deliveryDone(order_number);
		
		if(result == 1) {
			model.addAttribute("msg","배달완료!");
		}else {
			model.addAttribute("msg","오류발생!");
		}
		
		List<RiderEachOrderDto> list = riderService.riderDeliveryList(rider_id);
		model.addAttribute("list",list);
		return "rider_delivery";
		
	}
	//라이더 배달완료 리스트들 보기
	@RequestMapping("deliveryDoneList")
	public String deliveryDoneList(Model model,String login_id) {
		List<RiderEachOrderDto> list = riderService.deliveryDoneList(login_id);
		
		model.addAttribute("list",list);
		return "rider_delivery_done_list";
	}
	//라이더 회원탈퇴
	
	//만들어야함
	
	
	
	
	//-----------------------------------------------------------------------
	//사장님 로그인페이지
	@RequestMapping(value = "/ceoLogin")
	public String ceoPageMain() {
		return "ceo_loginpage";
	}
	//사장님 로그아웃 페이지
	@RequestMapping(value = "/ceoLogout")
	public String ceoLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		request.setAttribute("msg", "로그아웃 되었습니다");
		return "ceo_loginpage";
	}
	
	//사장님 회원가입 첫번째
	@RequestMapping(value = "/registerFirst")
	public String registerFirst() {
		return "ceo_registerPage1";
	}
	//사장님 회원가입 두번째
	@RequestMapping(value = "/registerSecond")
	public String registerSecond() {
		return "ceo_registerPage2";
	}
	//사장님 회원가입 세번째
	@RequestMapping(value = "/registerThird")
	public String registerThird(HttpServletRequest request,String id,String pw,String name,String phoneFirst,String phoneSecond,String address,String addressDetail) {
		
		service.register(id, pw, name, phoneFirst+phoneSecond, address+" "+addressDetail);
		
		MultipartHttpServletRequest mtf = (MultipartHttpServletRequest) request; // 다중파일 업로드

		if(mtf.getFile("profile").getOriginalFilename() != ""){
			MultipartFile file = mtf.getFile("profile");
			
			String fileName = id+"_"+ file.getOriginalFilename();
			String filePath = "C:\\SpringWorkSpace\\ugaMart\\src\\main\\webapp\\resources\\img\\ceoProfile\\";
			
			try {
				file.transferTo(new File(filePath+fileName));}
			catch(Exception e){
				e.printStackTrace();
				System.out.println("업로드 오류"); 
			}
		}else {
			System.out.println("기본이미지 선택함 ");
		}
		
		return "ceo_registerPage3";
	}
	
	//사장님 로그인 액션
	@RequestMapping(value="/ceoLoginAction")
	public String ceoLoginAction(HttpServletRequest request,String id, String pw) {
		String ceo_number = service.login(id, pw);
		String ret = "";
		
		if(ceo_number!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("ceo_number", ceo_number);
			
			//ceo page main에 필요한 정보들 넘겨줘야함
			String orderAmount = service.orderAmount(ceo_number);
			int priceAmount = service.priceAmount(ceo_number);
			int deliveryReady = service.deliveryAmount(ceo_number, 0);
			int delivering = service.deliveryAmount(ceo_number, 1);
			int deliveryDone = service.deliveryAmount(ceo_number, 2);
			
			request.setAttribute("orderAmount", orderAmount);
			request.setAttribute("priceAmount", priceAmount);
			request.setAttribute("deliveryReady", deliveryReady);
			request.setAttribute("delivering", delivering);
			request.setAttribute("deliveryDone", deliveryDone);
			
			ret = "ceo_page_main";
		}else {
			request.setAttribute("msg", "아이디/비밀번호를 다시 확인해주세요");
			ret = "ceo_loginpage";
		}
		return  ret;
	}
	
	//사장님 상품 등록 페이지
	@RequestMapping(value = "/ceoRegisterProduct")
	public String ceoRegisterProduct() {
		return "ceo_page_register_product";
	}
	
	//사장님 상품 등록 form
	@RequestMapping(value = "/ceoRegisterProductAction")
	public String ceoRegisterProductAction(HttpServletRequest request,CeoRegisterProductDto dto) {
		int result = service.registerProduct(dto);
		System.out.println(result); 

		//이제 사진 저장해야됨 for문 3번 돌리면됨
		MultipartHttpServletRequest mtf = (MultipartHttpServletRequest) request; // 다중파일 업로드
		for(int i=1; i<=3; i++) {
			MultipartFile file = mtf.getFile("product"+i);
			
			String fileName = file.getOriginalFilename();
			int num = fileName.lastIndexOf(".");
	
			fileName = fileName.substring(num);
			fileName = dto.getCeo_number()+"_" +dto.getProduct_number()+"_"+i+fileName;

			String filePath = "C:\\SpringWorkSpace\\ugaMart\\src\\main\\webapp\\resources\\img\\ceoProductPic\\";
			  
			try {
				file.transferTo(new File(filePath+fileName));
			}catch(Exception e){
				e.printStackTrace(); System.out.println("업로드 오류");
			}
		}
		
		request.setAttribute("msg", "상품이 성공적으로 등록되었습니다");
		return "ceo_page_register_product";
	}
	
	//사장님 상품 리스트들 보기
	@RequestMapping(value = "/ceoProductList")
	public String ceoProductList() {
		return "ceo_page_product_list";
	}
	
	//사장님 상품 리스트들 보기 액션
	@RequestMapping(value = "/ceoProductListAction")
	public String ceoProductListAction(Model model,String ceo_number, String category, String categoryValue) {
		List<CeoProductDto> productList = null;
		
		if(category.equals("product_k_name")) {productList = service.searchProductByName(ceo_number, categoryValue);}
		else {productList = service.searchProductByNumber(ceo_number, categoryValue);}
		
		if(productList.size() == 0) {model.addAttribute("msg","해당 상품이 없습니다");}
		else {model.addAttribute("productList",productList);}
		
		return "ceo_page_product_list";
	}
	
	//사장님 주문 리스트들 보기
	@RequestMapping(value = "/ceoOrderList")
	public String ceoOrderList() {
		return "ceo_page_order_list";
	}
	
	//사장님 주문 리스트들 보기 액션
	@RequestMapping(value = "/ceoOrderListAction")
	public String ceoOrderListAction(Model model,String ceo_number,String category,String categoryValue) {
		List<CeoEachOrderDto> list = null;
		
		if(category.equals("customer_id")) {
			list = service.orderEachListByCustomerID(ceo_number, categoryValue);
			
			if(list.size()==0) model.addAttribute("msg","해당 고객의 주문목록이 업습니다.");
			else {
				model.addAttribute("list",list);
			}
		}
		
		return "ceo_page_order_list";
	}
	
	//사장님 리뷰 페이지
	@RequestMapping(value = "/ceoReview")
	public String ceoReview(Model model,String ceo_number) {
		List<CeoReviewDto> list = service.reviewList(ceo_number);
		model.addAttribute("list",list);
		return "ceo_page_review";
	}
	
	
	
}
