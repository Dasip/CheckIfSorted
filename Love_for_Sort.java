package STAS;
import java.util.*;

public class Love_for_Sort {

	public static void main(String[] args) {
		List<Integer> nums = new ArrayList<Integer>();
		List<Integer> rand = new ArrayList<Integer>();
		
		for (int i=0; i<20; i++){
			nums.add(i);
		}
		
		rand.add(102);
		rand.add(81);
		rand.add(27);
		rand.add(16);
		rand.add(13);
		rand.add(2);
		
	
		
		
		
		/*
		System.out.println(isArraySorted(nums));
		System.out.println(isArraySorted(rand));*/
		
	}
	
	public static boolean isArraySorted(List<Integer> a){
		List<Integer> b = new ArrayList<Integer>();
		for (int i=0; i<a.size(); i++){
			b.add(a.get(i));
		}
		
		
		Collections.sort(b, new Comparator<Integer>() {
			public int compare(Integer o1, Integer o2){
				return o1 - o2;
			}
		});
		
		boolean sorted = true;
		boolean reversed = true;
		/*
		System.out.println(b);
		System.out.println(a);*/
		for (int i=0; i<a.size(); i++){
			if (b.get(i) != a.get(i)){
				sorted = false;
				break;
			}
			if (b.get(i) != a.get(a.size()-i-1)){
				reversed = false;
				break;
			}
		}

		return reversed || sorted;
	}

}
