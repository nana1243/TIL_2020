package test02;


// 트리의 인터페이스
public interface Tree<T>{
	
	public void insert(T data);
	public T getMinValue();
	public T getMaxValue();
	//순회
	public void traversal();
	public void delete(T data);

}
