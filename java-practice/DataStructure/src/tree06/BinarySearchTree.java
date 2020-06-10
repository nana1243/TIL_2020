package test01;

public class BinarySearchTree {
	
	// key값과 data값이 동일하다
	
	TreeNode root = new TreeNode();
	
	public TreeNode insertKey(TreeNode root, char x) {
		TreeNode p = root;
		TreeNode newNode = new TreeNode(x);
		if(p ==null) {
			return newNode;
		}else if (p.data>newNode.data) {
			p.left=insertKey(p.left,x);
			return p;
		}else if(p.data<newNode.data) {
			p.right =insertKey(p.right,x);
		}else {
			return p;
		}
		return null;
	}
	
	public void insertBST(char x) {
		root = insertKey(root,x);
	}
	
	public TreeNode searchBST(char x) {
		TreeNode p = root;
		while(p!=null) {
			if(x<p.data) {
				p = p.left;
			}else if (x>p.data) {
				p = p.right;
			}else {
				break;
			}
		}
		return p;		
	}
	// left->root->right
	public void inOrder(TreeNode node) {
		if(node!=null) {
			inOrder(node.left);
			System.out.println(node.data);
			inOrder(node.right);
		}
	}
	
	public void printBST() {
		inOrder(root);
		System.out.println();
	}
	
	

}
