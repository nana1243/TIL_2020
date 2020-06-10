package test02;

public class BinarySearchTree<T extends Comparable<T>> implements Tree<T> {

	private Node<T> root; // root노드

	@Override
	public void insert(T data) {
		if (root == null) {
			root = new Node<>(data);
		} else {
			insertNode(data, root);
		}

	}

	private void insertNode(T newdata, Node<T> node) {

		// 새로운 데이터가 기존의 데이터보다 작으면
		if (newdata.compareTo(node.getData()) < 0) {
			// 만약 해당position에 leftchild가 존재시, 재귀호출을 통해 leftchild가 없을때까지 위 함수를 호출하게 된다
			if (node.getLeftchild() != null) {
				insertNode(newdata, node.getLeftchild());
			} else {
				// leftchild가 없을 경우 노드를 생성하고, 안에 데이터를 넣는다
				Node<T> newNode = new Node<T>(newdata);
				node.setLeftchild(newNode);
			}

		} else {
			if (node.getRightchild() != null) {
				insertNode(newdata, node.getRightchild());

			} else {
				Node<T> newNode = new Node<T>(newdata);
				node.setRightchild(newNode);

			}
		}

	}

	@Override
	public T getMinValue() {

		if (root == null) {
			return null;
		} else {
			return getMin(root);
		}

	}

	private T getMin(Node<T> node) {

		// 가장 왼쪽에 위치한 노드를 찾을때까지 재귀 호출이다
		if (node.leftchild != null) {
			return getMin(node.leftchild);
		}
		return node.getData();

	}

	@Override
	public T getMaxValue() {

		if (root == null) {
			return null;
		}
		return getMax(root);

	}

	private T getMax(Node<T> node) {
		if (node.getRightchild() != null) {
			return getMax(node.getRightchild());
		}

		return node.data;
	}

	@Override
	public void traversal() {
		if(root!=null) {
		System.out.println("inorder입니다");
		inOrder(root);
		System.out.println("preorder");
		preOrder(root);
		System.out.println("postorder");
		postOrder(root);
	
		}
	}
		
    private void postOrder(Node<T> node) {
    	if(node.leftchild!=null) {
    		postOrder(node.leftchild);
    	}
    	if(node.rightchild!=null) {
    		preOrder(node.rightchild);
    	}
		System.out.println(node.data);
	}

	//root->left->right
	private void preOrder(Node<T> node) {
		System.out.println(node.data);
		if(node.leftchild!=null) {
			preOrder(node.leftchild);
		}
		if(node.rightchild!=null) {
			preOrder(node.rightchild);
		}
	}
	
	// left ->root->right
	private void inOrder(Node<T> node) {
		if(node.leftchild!=null) {
			inOrder(node.leftchild);
		}
		System.out.println(node.data);
		
		if(node.rightchild!=null) {
		inOrder(node.rightchild);
		}
	}
	
	

	@Override
	public void delete(T data) {
		if(root!=null) {
			root = delete(root,data);
		}
	}

	
	// 삭제하려는 (확인용 node, 삭제하고 싶은 data)
	private Node<T> delete(Node<T> node, T data) {
//		if(node == null) {
			return node;
		}
		
//		// 삭제할 데이터가 현재 노드의 데이터 보다 작으면?
//		
//		if(data.compareTo(node.getData())<0) {
//			node.setLeftchild(delete(node.getRightchild(),data));
//			
//		}else if(data.compareTo(node.getData())>0) {
//			node.setRightchild( delete(node.getLeftchild()),data);
//		}
//		
		
		
	}
	


