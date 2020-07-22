package datastructure;

public class ListNode {
	private String data;
	public ListNode link;
	
	public ListNode() {
		this.data = data;
		this.link = link;
		}
	
	public ListNode(String data) {
		this.data = data;
		this.link = link;
	}
	
	public ListNode(String data, ListNode link) {
		this.data= data;
		this.link = link;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public ListNode getLink() {
		return link;
	}

	public void setLink(ListNode link) {
		this.link = link;
	}
	

}
