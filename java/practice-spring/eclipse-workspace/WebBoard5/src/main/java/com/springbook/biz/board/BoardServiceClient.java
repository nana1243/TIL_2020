package com.springbook.biz.board;

import org.springframework.beans.factory.xml.XmlBeanDefinitionReader;
import org.springframework.context.support.GenericApplicationContext;

public class BoardServiceClient {

	public static void main(String[] args) {
		
		// 1. container 구동
		GenericApplicationContext container = new GenericApplicationContext();
		new XmlBeanDefinitionReader(container).loadBeanDefinitions("applicationContext.xml");
		
		//2. spring컨테이너로부터 boardServiceImpl 객체를  Lookup 한다
		
		BoardService boardService = (BoardService)container.getBean("boardService");
		
		
		//3. 글등록 기능 테스트 
		boardService.insertboard();
		boardService.updateboard();
	
		boardService.deleteboard();
		
		

	}

}
