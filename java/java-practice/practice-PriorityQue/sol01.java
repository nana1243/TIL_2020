package test01;

import java.util.ArrayDeque;
import java.util.Collections;
import java.util.Deque;

public class sol01 {

	public static void main(String[] args) {

		int[] priorities = {1, 1, 9, 1, 1, 1};
		Deque<Integer> q = new ArrayDeque<Integer>();

		for (int elm : priorities) {
			q.add(elm);
		}

		int location = 3;
		int ans = 0;
		
		int max = Collections.max(q);
		
	

		while (true) {
			int v = q.pollFirst();
			if (max == v) {
				ans += 1;
				if (location == 0) {
					break;
				} else {
					location -= 1;
				}
			max = Collections.max(q);
			} else {
				q.add(v);
				if (location == 0) {
					location = q.size() - 1;
				} else {
					location -= 1;
				}
			}

		}
		System.out.println(ans);

	}
}