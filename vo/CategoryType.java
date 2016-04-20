package com.wiring.bnn.vo;

public enum CategoryType {
	
	문학(1),인문(2),가정_생활_건강(3),요리(4),취미_스포츠(5),경제_경영(6),
	정치_사회(7),역사_문화(8),자기계발(9),종교(10),예술_대중문화(11),기술_공학(12),
	외국어_사전(13),과학(14),취업_수험서(15),여행_기행(16),컴퓨터_IT(17),
	잡지(18),참고서(19),청소년(20),유아_아동(21),만화(22);
	
	private int no;
	
	private CategoryType(int no) {
		this.no = no;
	}
	
	public int getValue() {
		return this.no;
	}
	
	

}
