package utils;

public class Pagination {
	// 고객센터 전용 pagination
	public static String getServicePagiantion(int totalData, int cpage) {
		
		// 0) 전체 기본 설정
		int recordTotalCount = totalData; 
		
		System.out.println(recordTotalCount);
		
		int recordCountPerPage = 5;

		int naviCountPerPage = 3;

		int pageTotalCount = 0;
		
		// 0-1) 페이지 계산 조건

		if(recordTotalCount % recordCountPerPage > 0) {
					
			pageTotalCount = recordTotalCount / recordCountPerPage +1;
			
		} else {

			pageTotalCount = recordTotalCount / recordCountPerPage;

		}
		
		// navi 기본 설정

		// 1-1) 현재 페이지 설정
		int currentPage = cpage;
		
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) { // 2 > 3
			currentPage = pageTotalCount;
		}

		// 1-2) 시작-끝 페이지 설정
		int startNavi = (currentPage-1)/naviCountPerPage*naviCountPerPage+1;
		int endNavi = startNavi + (naviCountPerPage -1);
		
		if (startNavi < 0) {
			startNavi = 1;
		} else if(endNavi > pageTotalCount) { 
			endNavi = pageTotalCount;
		}
		
		// 2) 페이지 넘기는 기능 - 쓰시고 싶으면 추가해서 사용하시면 됩니다. (양쪽 화살표예여)
		boolean preNavi = true;
		boolean nextNavi = true;

		if (startNavi == 1) {
			preNavi = false; // 시작이 1이 되면 안보여야 됨
		} 
		if (endNavi == pageTotalCount) {
			nextNavi = false;
		}
		
		StringBuilder sbr = new StringBuilder();
		
		if (preNavi) {
			sbr.append("<a class='page-notice'><li class='index'>"+(startNavi-1)+"</li></a>");
		}
		
		// 3) 출력 : StringBuilder
		for (int i=startNavi; i<= endNavi; i++) {
			// 페이지 번호마다 링크 걸기
			if(i == currentPage) {
				sbr.append("<a class='page-notice is-active'><li class='index'>"+i+"</li></a>");
			} else {
				sbr.append("<a class='page-notice'><li class='index'>"+i+"</li></a>");
			}
		}
		
		if (nextNavi) {
			sbr.append("<a class='page-notice'><li class='index'>"+(endNavi+1)+"</li></a>");
		}


		return sbr.toString();
	}
	
	// 고객센터 전용 pagination
	public static String getInquiryPagiantion(int totalData, int cpage) {
		
		// 0) 전체 기본 설정
		int recordTotalCount = totalData; 
		
		System.out.println(recordTotalCount);
		
		int recordCountPerPage = 5;

		int naviCountPerPage = 5;

		int pageTotalCount = 0;
		
		// 0-1) 페이지 계산 조건

		if(recordTotalCount % recordCountPerPage > 0) {
					
			pageTotalCount = recordTotalCount / recordCountPerPage +1;
			
		} else {

			pageTotalCount = recordTotalCount / recordCountPerPage;

		}
		
		// navi 기본 설정

		// 1-1) 현재 페이지 설정
		int currentPage = cpage;
		
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) { // 2 > 3
			currentPage = pageTotalCount;
		}

		// 1-2) 시작-끝 페이지 설정
		int startNavi = (currentPage-1)/naviCountPerPage*naviCountPerPage+1;
		int endNavi = startNavi + (naviCountPerPage -1);
		
		if (startNavi < 0) {
			startNavi = 1;
		} else if(endNavi > pageTotalCount) { 
			endNavi = pageTotalCount;
		}
		
		// 2) 페이지 넘기는 기능 - 쓰시고 싶으면 추가해서 사용하시면 됩니다. (양쪽 화살표예여)
		boolean preNavi = true;
		boolean nextNavi = true;

		if (startNavi == 1) {
			preNavi = false; // 시작이 1이 되면 안보여야 됨
		} 
		if (endNavi == pageTotalCount) {
			nextNavi = false;
		}
		
		StringBuilder sbr = new StringBuilder();
		
		if (preNavi) {
			sbr.append("<a class='page-inquiry'><li class='index'>"+(startNavi-1)+"</li></a>");
		}
		
		// 3) 출력 : StringBuilder
		for (int i=startNavi; i<= endNavi; i++) {
			// 페이지 번호마다 링크 걸기
			if(i == currentPage) {
				sbr.append("<a class='page-inquiry is-active'><li class='index'>"+i+"</li></a>");
			} else {
				sbr.append("<a class='page-inquiry'><li class='index'>"+i+"</li></a>");
			}
		}
		
		if (nextNavi) {
			sbr.append("<a class='page-inquiry'><li class='index'>"+(endNavi+1)+"</li></a>");
		}

		return sbr.toString();
	}
}
