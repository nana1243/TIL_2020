package test01;

public class TreeNode {

	int data;
	TreeNode left;
	TreeNode right;

	
	// treenode라는 객체를 생성하는 동시에 하나의 노드는 left, right를 가질 수 있따
	public TreeNode() {
		this.left = null;
		this.right = null;
	}

	public TreeNode(int data) {
		super();
		this.data = data;
		this.left = null;
		this.right = null;
	}
	
	public int getData(){
        return data;
    }



}
