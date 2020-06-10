package test02;

public class test01 {

	public static void main(String[] args) {
		
	
		Tree<Integer> bst = new BinarySearchTree<Integer>();
		
		bst.insert(9);
		bst.insert(3);
		bst.insert(1);
		bst.insert(4);
		bst.insert(10);
		bst.insert(13);
		bst.insert(12);
		bst.insert(15);
		bst.traversal();
		System.out.println("start");
		System.out.println(bst.getMaxValue());
		System.out.println(bst.getMinValue());
		
	}

}
