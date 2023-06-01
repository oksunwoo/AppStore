//
//  ReadMoreTextView.swift
//  AppStore
//
//  Created by Sunwoo on 2023/05/31.
//

import UIKit

final class ReadMoreTextView: UITextView {
    enum TextType {
        case release
        case description
    }
    
    convenience init(textType: TextType) {
        self.init(frame: .zero)
        configure(textType: textType)
    }
    
    private func configure(textType: TextType) {
        isEditable = false
        font = .preferredFont(forTextStyle: .callout)
        textColor = .label
        textAlignment = .left
        translatesAutoresizingMaskIntoConstraints = false
        isSelectable = false
        isScrollEnabled = false
        textContainer.lineBreakMode = .byTruncatingTail
        
        switch textType {
        case .release:
            textContainer.maximumNumberOfLines = 4
            
        case .description:
            textContainer.maximumNumberOfLines = 15
        }
        text = "● 자주 쓰는 서비스는 앞으로 꺼내고\n● 결제가 필요한 순간 APP으로 결제하고\n● 마음 전할 땐 앞으로 송금 봉투\n● 내게 딱 맞는 혜택만 APP으로 가득 담고\n● 금융이 쉬워지는 팁, 앞으로 모아보고\n● 시작부터 다른 주식, APP으로 간편하게\n● 일상이 더 행복하게, 쿠폰 100% 받을 수 있는 모으는 행복\n\n▶ 카카오페이 주요 기능\n\n- 송금, 결제, 카드, 계좌, 보험, 대출, 투자까지 돈 쓸 일 많은 요즘, 번거로운 공인인증서 없이 가능한 자산관리\n- 모임 회비, 경조사비, 등 이용 목적에 따라 원하는 주기와 날짜로 예약 송금, 자동 이체\n- 생체 인증으로 빠르고 편하게 결제, 바코드와 QR코드로 장소 제한 없이 결제\n- 카카오페이 결제 내역부터 카드, 현금 영수증까지! 입금과 지출 내역 관리, 계좌, 투자, 내 차, 대출까지! 소비 내역을 분석해 주는 금융 리포트\n- 한국/ 미국 주식 한번에, 누구나 쉽고 간편하게 할 수 있는 주식 투자\n\n- 종이 영수증과 동일한 형태의 전자 영수증 제공! 신한카드, 하나카드, 롯데카드 결제 영수증 모두 자동으로 보관\n- 각종 청구서, 등기우편을 한곳에서 편리하게, 공인된 전자 문서로 안전하게, 납부까지 한 번에 이용\n- 카톡 친구 송금, 카카오페이 청구서, 투자 등 서비스 이용을 위한 송금 모두 무료\n- CJONE, GS&POINT, 해피포인트, 롯데 엘포인트, 신세계포인트, 현대 H point 등 하나의 바코드 여러 제휴사 멤버십 한 번에 관리\n\n- 카드 없이 앱 하나로, 인증 번호만으로 출금 가능한 카카오페이 ATM 출금\n- 공인인증서를 대체할 새로운 인증 방법, 간편한 카카오페이 인증서\n- 핀테크 업계 최초, 금융보안원 정보보호 개인 정보 관리체계(ISMS-P) 통합 인증\n- 빅데이터・AI 기반 이상거래 감지시스템(FDS) 구축\n\n▶ 결제 가맹점\n- 온라인 : 배달의민족, 인터파크, 티몬, 요기요, 야놀자, 여기어때, 위메프, 아이허브(iHerb), 알리일스프레스(Aliexpress), 플레이스테이션 (PlayStation), 왓챠 (WATCHA), 무신사(Musinsa), 오늘의집, 교보문고 등\n- 오프라인 : 전국 모든 편의점, 롯데백화점, 롯데아울렛, 신세계백화점, 농협 하나로마트, 이마트, 올리브영, 롭스, 랄라블라, 파리바게트, 스타벅스, 공차, 빽다방, H&M, COS, 버거킹, 서브웨이(subway), 설빙, 프리스비(Frisbee) 등\n\n카카오페이로 간편하게, 자유롭게, 안전하게, 마음 놓고 금융하세요.\n금융이 일상이 됩니다.\n\n정보통신망법 제22조의2(접근권한에 대한 동의)에 따라 아래와 같이 카카오페이 앱 사용 시 필요한 접근권한을 안내해 드립니다.\n\n○ 선택 권한\n- 알림: 서비스 이용 시 필수 알림 수신\n- 카메라: 송금 및 결제 시 코드 스캔 또는 촬영\n- 위치: 송금 및 결제 시 위치 확인\n- 사진: QR 코드 이미지 저장\n- Face ID: 카카오페이 비밀번호 및 화면잠금 비밀번호 입력을 대체\n- 마이크: 비디오 파일 첨부\n\n* 선택 권한은 허용하지 않아도 해당 기능 외 서비스 사용이 가능합니다.\n\n○ 카카오페이 고객센터 챗봇(카카오톡): 24시간, 365일 상시 (상담사 연결: 평일 9시~17시 30분)\n○ 고객센터: 1644-7405 (평일 9시~18시)\n○ 분실 및 도용신고: 1833-7483 (24시간)"
    }
}
