package tree01;

public class Node {
		
	  char data;
	  Node leftChild;
	  Node rightSibling;
	  
	  public Node(char data) {
	        this.data = data;
	    }
	 
	    public void setData(char data) {
	        this.data = data;
	    }
	 
	    public char getData() {
	        return data;
	    }
	 
	    public void setLeftChild(Node leftChild) {
	        this.leftChild = leftChild;
	    }
	 
	    public Node getLeftChild() {
	        return leftChild;
	    }
	 
	    public void setRightSibling(Node rightSibling) {
	        this.rightSibling = rightSibling;
	    }
	 
	    public Node getRightSibling() {
	        return rightSibling;
	    }
	    
	    
	    
	}
	  
	  


