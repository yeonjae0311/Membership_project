package util;

public class Page {
	public static String getPaging(String pageURL, int nowPage, int rowTotal, int blockList, int blockPage) {
		int totalPage; //전체 페이지수
		int startPage;
		int endPage;
		
		boolean isPrevPage, isNextPage;
		StringBuffer sb; //메모리 최적화
		
		isPrevPage = isNextPage = false;
		totalPage = (rowTotal/blockList);
		if(rowTotal % blockList !=0) {
			totalPage++;
		}
		
		// 잘못된 연산이나 잘못된 움직임으로 인하여 현재 페이지 수가 전체 페이지 수를 
		// 넘을경우 강제로 현재페이지 값을 전체 페잊 ㅣ값으로 고정
		if(nowPage > totalPage) {
			nowPage = totalPage;
		}
		
		// 시작페이지와 마지막 페이지를 구한다.
		startPage = (((nowPage-1)/blockPage)*blockPage+1);
		endPage = startPage+blockPage-1;
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		if(endPage<totalPage) {
			isNextPage = true;
		}
		
		if(startPage> 1) {
			isPrevPage =true;
		}
		
		sb= new StringBuffer();
		//------- 그룹페이지 처리 이전----------------------------------------------------------------------------------------
		if(isPrevPage) {
			sb.append("<a href='"+pageURL+"?page1=");
			sb.append(startPage-1);
			sb.append("'><img src='resources/img2/btn_prev.gif'></a>");
		}else {
			sb.append("<img src='resources/img2/btn_prev.gif'>");
		}
		//------- 페이지 목록 출력 ----------------------------------------------------------------------------------------
		sb.append("&nbsp; ");
		for(int i= startPage;i<=endPage;i++) {
			if(i>totalPage) {
				break;
			}
			if(i==nowPage) {
				sb.append("&nbsp;<b><font color='#ff0000'>");
				sb.append(i);
				sb.append("</font></b>");
			}else {
				sb.append("&nbsp;<a href='"+pageURL+"?page=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
		}
		sb.append("&nbsp; ");
		//------- 그룹페이지 처리 다음----------------------------------------------------------------------------------------
		if(isNextPage) {
			sb.append("<a href='"+pageURL+"?page1=");
			sb.append(endPage+1);
			sb.append("'><img src='resources/img2/btn_next.gif'></a>");
		}else {
			sb.append("<img src='resources/img2/btn_next.gif'>");
		}
		
		return sb.toString();
	}
	
	//2만들어야함
	
	public static String getPaging2(String pageURL, int nowPage, int rowTotal, int blockList, int blockPage) {
		int totalPage; //전체 페이지수
		int startPage;
		int endPage;
		
		boolean isPrevPage, isNextPage;
		StringBuffer sb; //메모리 최적화
		
		isPrevPage = isNextPage = false;
		totalPage = (rowTotal/blockList);
		if(rowTotal % blockList !=0) {
			totalPage++;
		}
		
		// 잘못된 연산이나 잘못된 움직임으로 인하여 현재 페이지 수가 전체 페이지 수를 
		// 넘을경우 강제로 현재페이지 값을 전체 페잊 ㅣ값으로 고정
		if(nowPage > totalPage) {
			nowPage = totalPage;
		}
		
		// 시작페이지와 마지막 페이지를 구한다.
		startPage = (((nowPage-1)/blockPage)*blockPage+1);
		endPage = startPage+blockPage-1;
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		if(endPage<totalPage) {
			isNextPage = true;
		}
		
		if(startPage> 1) {
			isPrevPage =true;
		}
		
		sb= new StringBuffer();
		//------- 그룹페이지 처리 이전----------------------------------------------------------------------------------------
		if(isPrevPage) {
			sb.append("<a href='"+pageURL+"?page2=");
			sb.append(startPage-1);
			sb.append("'><img src='resources/img2/btn_prev.gif'></a>");
		}else {
			sb.append("<img src='resources/img2/btn_prev.gif'>");
		}
		//------- 페이지 목록 출력 ----------------------------------------------------------------------------------------
		sb.append("&nbsp; ");
		for(int i= startPage;i<=endPage;i++) {
			if(i>totalPage) {
				break;
			}
			if(i==nowPage) {
				sb.append("&nbsp;<b><font color='#ff0000'>");
				sb.append(i);
				sb.append("</font></b>");
			}else {
				sb.append("&nbsp;<a href='"+pageURL+"?page=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
		}
		sb.append("&nbsp; ");
		//------- 그룹페이지 처리 다음----------------------------------------------------------------------------------------
		if(isNextPage) {
			sb.append("<a href='"+pageURL+"?page2=");
			sb.append(endPage+1);
			sb.append("'><img src='resources/img2/btn_next.gif'></a>");
		}else {
			sb.append("<img src='resources/img2/btn_next.gif'>");
		}
		
		return sb.toString();
	}
}
