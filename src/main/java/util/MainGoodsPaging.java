package util;

public class MainGoodsPaging {

	// page_product_quantity = 페이지당 보여줄 상품리스트 개수
	// nowpage = 요청된 페이지 인덱스 정보
	// Object dao = 데이터 조회에 사용되는 연결객체
//	public static HashMap<String, Object> getPaging(int page_product_quantity, String nowpage, GoodsDAO dao) {
//
//		// 한페이지에서 현재 페이지의 전 후 최대 페이지 개수
//		int onePageSideCount = 1;
//
//		// 실제 현재 보여주고 있는 페이지의 인덱스 정보 변수
//		int intnowpage = 1;
//
//		// 페이지에 보여지는거 뿐만 아닌 전체 데이터 개수의 정보를 담는 변수
//		int goodsCount;
//
//		// 페이지징의 끝의 페이지 숫자의 정보를 가리키는 변수
//		int pagingMaxTag;
//
//		// 한 페이지에 표시할 이전 페이지 인덱스의 최소 인덱스
//		int minpage;
//
//		// 한 페이지에 표시할 다음 페이지 인덱스의 최대 인덱스
//		int maxpage;
//		
//		//화살표 눌렀을 때 넘어갈 페이지 수
//		int jumpgingPage = 3;
//
//		//조회한 상품들이 담기는 변수
//		List<GoodsVO> goodsList;
//		
//		// pagingData에 각 페이징 정보 저장
//		HashMap<String, Object> pagingData = new HashMap<String, Object>();
//
//		// 현재 페이지가 1페이지보다 큰 페이지를 보고 있을 때 그 페이지 인덱스를 가져옴
//		if (nowpage != null && !nowpage.isEmpty()) {
//			intnowpage = Integer.parseInt(nowpage);
//		}
//
//		// 현재페이지가 0번째 페이지일때 초기페이지 인덱스 값으로 실제 인덱스 정보를 변경
//		if (intnowpage < 1) {
//			intnowpage = 1;
//		}
//
//		// 전체 데이터 조회해서 goodsList에 데이터 저장 <!!!!조회문 여기 수정!!!!>
//		goodsList = dao.selectList(intnowpage, page_product_quantity);
//
//		// 총 데이터 수량을 저장
//		goodsCount = dao.TotalListCount();
//
//		// 총 데이터를 한페이지에 표시할 개수만큼 나누어서 그 값을 저장
//		pagingMaxTag = goodsCount / page_product_quantity;
//
//		// 한페이지에 표시할개수보다 페이지가 적을 때 맥스 페이지 1개 추가하는 조건문
//		if (goodsCount % page_product_quantity != 0) {
//			pagingMaxTag++;
//		}
//
//		minpage = 1;
//
//		// 1 2 3 4 5 6 7 8 9 10 에서//
//		// 1 2 3 4 5 [6] 7 8 9 10 일때//
//		// (1) 2 3 4 5 [6] 7 8 9 10 가로부분 표시 조건문//
//		//◀를 누를때 갈수 있는페이지가 onePageSideCount 보다 작을때는
//		//최소 페이지를 보여주고 그게 아니면 현재페이지보다 onePageSideCount 만큼 적은 minpage를 보여줘라 하는 조건문
//		if (intnowpage > onePageSideCount) {
//			minpage = intnowpage - onePageSideCount;
//		}
//
//		maxpage = intnowpage + onePageSideCount;
//
//		// 위의 반대로 다음페이지 관련 설명은 위랑 같음
//		if (maxpage > pagingMaxTag) {
//			maxpage = pagingMaxTag;
//		}
//
//		pagingData.put("goodsList", goodsList);
//		pagingData.put("pagingCount", pagingMaxTag);
//		pagingData.put("minpage", minpage);
//		pagingData.put("nowpage", intnowpage);
//		pagingData.put("maxpage", maxpage);
//		pagingData.put("jumpgingPage", jumpgingPage);
//
//		return pagingData;
//	}
}
