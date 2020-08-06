package com.fwantastic.example1;

import org.springframework.batch.core.StepContribution;
import org.springframework.batch.core.scope.context.ChunkContext;
import org.springframework.batch.core.step.tasklet.Tasklet;
import org.springframework.batch.repeat.RepeatStatus;

public class HelloWorldTasklet implements Tasklet {
	
	

	public RepeatStatus execute(StepContribution contribution, ChunkContext chunkContext) throws Exception {
		
		/*
		execute �޼ҵ尡 null�� ��ȯ�ϸ� RepeatStatus.FINISHED �� ��ȯ�ϴ� �Ͱ� ���� �ǹ̸� ������. 
		�Ѹ���� �ݺ� ���� �� ���� ����ȴٴ� �Ҹ���.

		HelloWorldTasklet�� tasklet �������̽��� ����ü��. 
		step�� ����Ǹ� ��ġ �����ӿ�ũ�� �˾Ƽ� execute �޼ҵ带 ã�� �����Ѵ�. 
		�׷�  �۾� ����... ��  �۾� �Ϸ�!  �޼����� ����ϰ� ������.
		*/

		
		System.out.println("�۾� ����...");
		// ���ϴ� �۾��� ���⿡�� �� �� �ִ�.
		System.out.println("�۾� �Ϸ�!");
		return null;
	}

}