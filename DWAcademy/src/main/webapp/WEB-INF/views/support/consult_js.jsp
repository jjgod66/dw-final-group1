<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
let seq = 1;
let cb = $('#chatBox');
let customReq = '';
let thisTime = new Date();
let hour = thisTime.getHours();
let min = thisTime.getMinutes();
let locHref = '';
let locName = '';
let ansText = '';
let pm = '';
let id = '';

let dwProfile = '<div class="img" style="background: none; width: 40px; height: 40px; border-radius: 50px; border: 1px solid #ededed; background-image: url(\'../../resources/img/logo_ico.png\'); background-repeat: no-repeat; background-size: 20px; background-position: center;">="https://cgv.enomix.co.kr/proxy?ticketId=ETC&amp;fileInfo=KSxlWm0pYiZCN1hjNmtqSng7bC1DKWA4XERsbCYpLCMyJmxAXistYCE1bComRDldIU4zNDc6bGBr%0ANTMzN2szRTJqLTN4WWVqRGs0N1pNPV1BX0Ixait4OClETDEvMlluRDQ3fG46LTApRW5KK19iJjNf%0AWGUjKUNgfiRlMTcpXz1%2BbWVlXzNtWzYkY0wyISU9ITVlKntBNGEjMlgzTX42KDYkWGw3a2UjNk16%0AWEUjIzREe0BlK21LSzI3JTc4eCx4XyRjbl9ZLHgpO0p6Tn5uL11cekBLQDU%3D"></div>'

let preFirst = '<div><div class="txtNode system" style=""><div class="btngroup " style="margin-top: 0px;">';
// preFirst += '<span id="" class="btn sel back" sel="이전으로" seltype="PREV"><span class="txtBtn">이전으로</span></span>';
preFirst += '<span id="" class="btn sel first" sel="처음으로" seltype="HOME"><span class="txtBtn">처음으로</span></span>';
preFirst += '</div></div></div>';

let customerText = '<div class="scn customer text" seq="' + seq + '"notbot="N"><div class="txtNode user"><div class="txt">' + customReq + '<div class="time time-left space">' + pm + ' ' + hour + ':' + min;
customerText += '</div></div></div></div>';

let loading = '<div id="scnTyping" class="chatLoading"><div class="txtNode system">' + dwProfile + '<div class="txt"><div class="loading2"><p><em class="ico">로딩중</em></p></div></div></div></div>';



$(function(){
	
	cb.append(restartShow());
	
	$('#chatBox').on('click', '.List .sel', function(){
		id = $(this).prop('id');
		let chatText = '';
		seq++;
		thisTime = new Date();
		hour = thisTime.getHours();
		min = thisTime.getMinutes();
		if(hour < 10){
			hour = '0' + hour;
		}
		if(min < 10){
			min = '0' + min;
		}
		if(hour >= 12){
			pm = '오후';
		}else{
			pm = '오전';
		}
		customReq = $(this).text();
		customerText = '<div class="scn customer text" seq="' + seq + '"notbot="N"><div class="txtNode user"><div class="txt">' + customReq + '<div class="time time-left space">' + pm + ' ' + hour + ':' + min;
		customerText += '</div></div></div></div>';
		cb.append(customerText);
		$(this).parents('ul').children('li').addClass('disabled');
		console.log(id);
		cb.append(loading);
		setTimeout(listClick, 1000, id);
		$('#contents').scrollTop($('#contents')[0].scrollHeight);
	})
	
	$('#chatBox').on('click', '.btn.sel.back', function(){
		$(this).parents('.scn').find('li').addClass('disabled');
		customerText = customerTextFun('이전으로');
		cb.append(customerText);
		let seq = $(this).parents('.scn').attr('seq');
		console.log(seq);
		let preseq = seq - 2;
		let pre = $('.scn[seq="' + preseq + '"]');
		let preclone = pre.clone();
		preclone.find('li').removeClass('disabled');
		cb.append(loading);
		setTimeout(appendTarget, 1000, cb, preclone);
		$('#contents').scrollTop($('#contents')[0].scrollHeight);
// 		cb.append(preclone);
	})
	
	$('#chatBox').on('click', '.btn.sel.first', function(){
		seq++;
		$(this).parents('.scn').find('li').addClass('disabled');
		customerText = customerTextFun('처음으로');
		cb.append(customerText);
		cb.append(loading);
		setTimeout(firstCon, 1000, seq);
		$('#contents').scrollTop($('#contents')[0].scrollHeight);
	})
	
	$('.close').on('click', function(){
		if(confirm("상담을 종료하시겠습니까?")){
			let end = '<div class="line"><div class="end_txt"><div><span>상담이 종료되었습니다.</span></div></div></div>';
			end += '<div class="btn_end restart type2"><div id="" class="btn2 sel" sel="상담 재시작"><span class="btn">상담 재시작</span></div></div>';
			cb.append(end);
			
		}
	})
	
	$('#chatBox').on('click', '.restart', function(){
		$(this).css('display', 'none');
		seq = 1;
		cb.append(restartShow());
	})
})
function appendTarget(cd, preclone){
	$('.chatLoading').css('display', 'none'); 
	cb.append(preclone);
}

function listClick(id){
	$('.chatLoading').css('display', 'none');
	seq++;
	if(id == 'movieReservation'){
		chatText = listAll3(seq, 'movieInfo', '영화정보', 'creditMethod', '결제수단', 'discount', '할인혜택');
	}else if(id == 'eventBenefit'){
		chatText = listAll2(seq, 'theaterEvent', '극장별 이벤트', 'benefitInfo', '혜택 안내');
	}else if(id == 'theater'){
		chatText = listAll2(seq, 'faq', '자주 묻는 질문', 'theaterLoc', '극장 위치');
	}else if(id == 'movieInfo'){
		chatText = listAll3(seq, 'screenSchedual', '상영일정', 'boxOffice', '예매순위', 'comming', '상영예정');
	}else if(id == 'creditMethod'){
		chatText = listAll2(seq, 'simpleCredit', '간편결제(카카오페이)', 'giftCard', '기프트카드');
	}else if(id == 'discount'){
		chatText = listAll3(seq, 'oldDiscount', '경로할인', 'disabledDiscount', '장애인할인', 'meritDiscount', '국가유공자할인');
	}else if(id == 'theaterEvent'){
		locHref = '<%=request.getContextPath()%>/event/theater.do';
		locName = '극장별 이벤트 확인하기';
		chatText = locMove(seq, locHref, locName);
	}else if(id == 'benefitInfo'){
		locHref = '<%=request.getContextPath()%>/support/membership.do';
		locName = '혜택 확인하기';
		chatText = locMove(seq, locHref, locName);
	}else if(id == 'faq'){
		chatText = listFirst(seq);
		chatText += listLi('faq1', '영화예매') + listLi('faq2', '할인혜택') + listLi('faq3', '결제수단') + listLi('faq4', '멤버쉽') + listLi('faq5', 'VIP') + listLi('faq6', '극장') + listLi('faq7', '스토어');
		chatText += listLi('faq8', '홈페이지') + listLast();
	}else if(id == 'theaterLoc'){
		locHref = '<%=request.getContextPath()%>/theater/main.do';
		locName = '극장정보 확인하기';
		let theaterLoc = '<div class="scn scenario text" seq="' + seq + '"notbot="N"><div><div class="txtNode system">' + dwProfile + '</div><div class="List"><ul class="btntype type1">';
		theaterLoc += '<li class="card"><p><span style="font-size: 12px;">극장위치는<br>아래 링크로 접속 후<br>방문하실 지점을 선택하여<br>각 지점별 정보를 통해 확인 부탁드립니다.</span></p></li><li id="" class="link"><a href="' + locHref + '"class="btn" target="_blank">'
		theaterLoc += locName + '</a></li></ul></div></div>' + preFirst + '</div>'
		chatText = theaterLoc;
	}else if(id == 'screenSchedual'){
		locHref = '<%=request.getContextPath()%>/reservation/cinema.do';
		locName = '상영일정 확인하기';
		chatText = locMove(seq, locHref, locName);
	}else if(id == 'boxOffice'){
		locHref = '<%=request.getContextPath()%>/movie/allMovie.do';
		locName = '예매순위 확인하기';
		chatText = locMove(seq, locHref, locName);
	}else if(id == 'comming'){
		locHref = '<%=request.getContextPath()%>/movie/comingMovie.do';
		locName = '상영예정작 확인하기';
		chatText = locMove(seq, locHref, locName);
	}else if(id == 'simpleCredit'){
		ansText = '문의하신 내용 답변드릴게요.<br><br>- 전국 CGV 지점 또는 온라인에서 카카오페이 사용 가능<br><br>[매장]<br>- 카카오페이 결제 시 바코드 제시<br><br>[온라인]<br>- 결제수단 [카카오페이] 선택 후 결제인증 진행이 가능';
		chatText = ansTextApp(seq, ansText);
	}else if(id == 'giftCard'){
		chatText = listAll3(seq, 'giftCardBuy', '구매/선물', 'giftCardMethod', '사용방법', 'giftCardRefund', '기프트카드 환불');
	}else if(id == 'oldDiscount'){
		ansText = '문의하신 내용 답변드릴게요.<br><br>[대상]<br>- 만 65세 이상<br><br>[이용 금액]<br>- 일반 6천원 / 조조 4천원<br>※ 이 외 특별 컨텐츠는 할인이 제외될 수 있습니다.<br><br>[적용 방법]<br>- 오프라인 : 본인 신분증 제시<br>- 온라인 : 대상 인원만큼 우대/경로 예매 후 상영관 입장 시 신분증 확인';
		chatText = ansTextApp(seq, ansText);
	}else if(id == 'disabledDiscount'){
		ansText = '문의하신 내용 답변드릴게요.<br><br>[대상]<br>- 복지카드 소지자<br><br>[이용 금액]<br>- 일반 6천원 / 조조 4천원<br> ※ 이 외 특별 컨텐츠는 할인이 제외될 수 있습니다.<br><br>[적용 방법]<br>- 오프라인 : 본인 복지카드 제시 <br>- 온라인 : 대상 인원만큼 우대 예매 후 상영관 입장 시 복지카드 확인';
		chatText = ansTextApp(seq, ansText);
	}else if(id == 'meritDiscount'){
		ansText = '문의하신 내용 답변드릴게요.<br><br>[대상]<br>- 국가유공자증, 국가유공자 유족증, 국가유공상이자증 소지자(본인에 한함) <br><br>[이용 금액]<br>- 일반 6천원 / 조조 4천원 ※ 이 외 특별 컨텐츠는 할인이 제외될 수 있습니다.<br><br>[적용 방법]<br>- 오프라인 : 본인 유공자증, 유공자 유족증, 유공상이자증 제시 <br>- 온라인 : 대상 인원만큼 우대 예매 후 상영관 입장 시 유공자증, 유공자 유족증, 유공상이자증 확인';
		chatText = ansTextApp(seq, ansText);
	}else if(id == 'faq1'){
		locName = '영화예매 자주묻는질문 확인하기';
		faqName = '영화예매';
		locHref = '<%=request.getContextPath()%>/support/faq.do?searchType=' + faqName;
		chatText = locMoveFAQ(seq, locHref, faqName);
	}else if(id == 'faq2'){
		faqName = '할인혜택';
		locHref = '<%=request.getContextPath()%>/support/faq.do?searchType=' + faqName;
		chatText = locMoveFAQ(seq, locHref, faqName);
	}else if(id == 'faq3'){
		faqName = '결제수단';
		locHref = '<%=request.getContextPath()%>/support/faq.do?searchType=' + faqName;
		chatText = locMoveFAQ(seq, locHref, faqName);
	}else if(id == 'faq4'){
		faqName = '멤버쉽';
		locHref = '<%=request.getContextPath()%>/support/faq.do?searchType=' + faqName;
		chatText = locMoveFAQ(seq, locHref, faqName);
	}else if(id == 'faq5'){
		faqName = 'VIP';
		locHref = '<%=request.getContextPath()%>/support/faq.do?searchType=' + faqName;
		chatText = locMoveFAQ(seq, locHref, faqName);
	}else if(id == 'faq6'){
		faqName = '극장';
		locHref = '<%=request.getContextPath()%>/support/faq.do?searchType=' + faqName;
		chatText = locMoveFAQ(seq, locHref, faqName);
	}else if(id == 'faq7'){
		faqName = '스토어';
		locHref = '<%=request.getContextPath()%>/support/faq.do?searchType=' + faqName;
		chatText = locMoveFAQ(seq, locHref, faqName);
	}else if(id == 'faq8'){
		faqName = '홈페이지';
		locHref = '<%=request.getContextPath()%>/support/faq.do?searchType=' + faqName;
		chatText = locMoveFAQ(seq, locHref, faqName);
	}else if(id == 'giftCardBuy'){
		ansText = '문의하신 내용 답변드릴게요.<br><br>- 온라인(홈페이지/모바일)에서 로그인 후 구매 또는 선물 가능하며, 일일 구매 횟수 제한은 별도 없음';
		chatText = ansTextApp(seq, ansText);
	}else if(id == 'giftCardMethod'){
		ansText = '문의하신 내용 답변드릴게요.<br><br>마이페이지 > 포인트 이용내역 > 기프트카드 등록 > 상품코드 입력 후 포인트 적립<br>결제 시 포인트 사용 가능';
		chatText = ansTextApp(seq, ansText);
	}else if(id == 'giftCardRefund'){
		ansText = '문의하신 내용 답변드릴게요.<br><br>[취소/환불]<br>- 기프트 카드 등록 전 100% 환불 <br><br>[결제취소 방법]<br>마이페이지 > 구매내역 메뉴로 진입   <br>해당 기프트콘 주문 상세내역을 통해 결제취소 가능<br>※ 자세한 사항은 DW시네마고객센터(0000-0000) 또는 DW시네마홈페이지 고객센터 "1대1 문의"를 통해 문의 부탁드립니다.';
		chatText = ansTextApp(seq, ansText);
	}
	cb.append(chatText);
}

function listFirst(seq){
	return '<div class="scn scenario card" seq="' + seq + '" notbot="N"><div><div class="txtNode system">' + dwProfile + '</div><div class="List"><ul class="btntype type1">';
}

function listLi(id, text){
	return '<li id="' + id + '" class="sel" sel="' + text + '"><span class="btn">' + text + '</span></li>';
}

function listLast(){
	return '</ul></div></div>' + preFirst + '</div>';
}

function list3(id1, text1, id2, text2, id3, text3){
	return listLi(id1, text1) + listLi(id2, text2) + listLi(id3, text3);
}
function list2(id1, text1, id2, text2){
	return listLi(id1, text1) + listLi(id2, text2);
}

function listAll2(seq, id1, text1, id2, text2){
	return listFirst(seq) + list2(id1, text1, id2, text2) + listLast();
}
function listAll3(seq, id1, text1, id2, text2, id3, text3){
	return listFirst(seq) + list3(id1, text1, id2, text2, id3, text3) + listLast();
}
function locMove(seq, locHref, locName){
	let result = '<div class="scn scenario text" seq="' + seq + '"notbot="N"><div><div class="txtNode system">' + dwProfile + '</div><div class="List"><ul class="btntype type1">';
	result += '<li class="card"><p><span style="font-size: 12px;">문의하신 내용은 아래 경로를 통해<br>확인하실 수 있습니다.</span></p></li><li id="" class="link"><a href="' + locHref + '"class="btn" target="_blank">';
	result += locName + '</a></li></ul></div></div>' + preFirst + '</div>';
	return result;
}
function locMoveFAQ(seq, locHref, faqName){
	let result = '<div class="scn scenario text" seq="' + seq + '"notbot="N"><div><div class="txtNode system">' + dwProfile + '</div><div class="List"><ul class="btntype type1">';
	result += '<li class="card"><p><span style="font-size: 12px;">' + faqName + ' 관련 자주찾는 질문은  <br>아래 경로를 통해 확인하실 수 있습니다.</span></p></li><li id="" class="link"><a href="' + locHref + '"class="btn" target="_blank">';
	result += faqName + ' 자주묻는질문 확인하기</a></li></ul></div></div>' + preFirst + '</div>';
	return result;
}

function ansTextApp(seq, ansText){
	thisTime = new Date();
	hour = thisTime.getHours();
	min = thisTime.getMinutes();
	if(hour < 10){
		hour = '0' + hour;
	}
	if(min < 10){
		min = '0' + min;
	}
	if(hour >= 12){
		pm = '오후';
	}else{
		pm = '오전';
	}
	let result = '<div class="scn scenario text" seq="' + seq + '" notbot="N"><div class="txtNode system">' + dwProfile + '<div class="txt"><div>' + ansText + '</div>';
	result += '<div class="time time-right space">' + pm + ' ' + hour + ':' + min + '</div></div></div>' + preFirst + '</div>';
	return result;
}

function customerTextFun(customReq){
	thisTime = new Date();
	hour = thisTime.getHours();
	min = thisTime.getMinutes();
	if(hour < 10){
		hour = '0' + hour;
	}
	if(min < 10){
		min = '0' + min;
	}
	if(hour >= 12){
		pm = '오후';
	}else{
		pm = '오전';
	}
	customerText = '<div class="scn customer text" seq="' + seq + '"notbot="N"><div class="txtNode user"><div class="txt">' + customReq + '<div class="time time-left space">' + pm + ' ' + hour + ':' + min;
	customerText += '</div></div></div></div>';
	return customerText;
}

function firstCon(seq){
	$('.chatLoading').css('display', 'none');
	let result = '<div class="scn scenario card" seq="' + seq + '"notbot="N"><div><div class="txtNode system">' + dwProfile + '</div><div class="List"><ul class="btntype type1">';
	result += '<li id="movieReservation" class="sel" sel="영화예매"><span class="btn">영화예매</span></li>';
	result += '<li id="eventBenefit" class="sel" sel="이벤트/혜택"><span class="btn">이벤트/혜택</span></li>';
	result += '<li id="theater" class="sel" sel="영화관 이용"><span class="btn">영화관 이용</span></li>';
	result += '</ul></div></div></div>';
	cb.append(result);
}
function restartShow(){
	thisTime = new Date();
	hour = thisTime.getHours();
	min = thisTime.getMinutes();
	if(hour < 10){
		hour = '0' + hour;
	}
	if(min < 10){
		min = '0' + min;
	}
	if(hour >= 12){
		pm = '오후';
	}else{
		pm = '오전';
	}
	let result = '<div class="scn scenario text" seq="0" notbot="N"><div class="txtNode system">' + dwProfile + '<div class="txt"><div>안녕하세요. DW시네마입니다.<br>궁금한 내용을 확인해보세요.</div>';
	result += '<div class="time time-right space">' + pm + ' ' + hour + ':' + min + '</div></div></div></div>';
	result += '<div class="scn scenario card" seq="1" notbot="N"><div><div class="txtNode system">' + dwProfile + '</div><div class="List"><ul class="btntype type1">';
	result += '<li id="movieReservation" class="sel" sel="영화예매"><span class="btn">영화예매</span></li>';
	result += '<li id="eventBenefit" class="sel" sel="이벤트/혜택"><span class="btn">이벤트/혜택</span></li>';
	result += '<li id="theater" class="sel" sel="영화관 이용"><span class="btn">영화관 이용</span></li>';
	result += '</ul></div></div></div>';
	return result;
		

}

</script>