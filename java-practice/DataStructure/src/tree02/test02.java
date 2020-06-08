package tree02;

import java.util.logging.Level;

public class test02 {
	
	public static void main(String[] args) {
		
		Tree t = new Tree();
		
		Node n4 = t.createNode(4, null, null);
		Node n5 = t.createNode(5, null, null);
		Node n2 = t.createNode(2, n4, n5);
		Node n3 = t.createNode(3, null, null);
		Node n1 = t.createNode(1, n2, n3);
		
		t.setRoot(n1);
//		System.out.println( "inorder start");
//		t.inOrder(t.getRoot());
//		
//		System.out.println( "preorder start");
//
//		t.preOrder(t.getRoot());
//
//		System.out.println( "post start");
//
//		t.postOrder(t.getRoot());
//		
		
		
		///////// level ¼øÈ¸
		
		Queue q = new Queue(10);
		q.levelorder(n1);
		
		
		
		
		
		
		
		
		
	}

}
