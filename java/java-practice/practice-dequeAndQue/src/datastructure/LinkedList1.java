package datastructure;

public class LinkedList1 {
	
    private ListNode head;
    private ListNode tail;
    private int size;

	
	public void addFirst(String data) {
		ListNode newNode = new ListNode(data);
		newNode.link = head;
		head=newNode;
		size++;
		if(head.link==null) {
			tail = head;
			}
		}
		
	public void addLast(String data){
		ListNode newNode= new ListNode(data);
		if(size==0) {
			addFirst(data);
			}
		else {
			tail.link =newNode;
			tail= newNode;
			size++;
		}
	}
	

}


