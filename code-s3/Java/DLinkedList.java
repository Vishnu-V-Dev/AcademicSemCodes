import java.util.*;

class DLinkedList {
	public static void main(String args[]) {
		LinkedList<String>ll=new LinkedList<String>();
		ll.add("L1");
		ll.add("L2");
		ll.add("L3");
		ll.add("L4");
		ll.add("L5");
		System.out.println("List After Insertion: ");
		Iterator<String>itr=ll.iterator();
		while(itr.hasNext()) {
			System.out.println(itr.next());
		}
		ll.remove("L1");
		ll.remove(2);
		System.out.println("\nList After Removing: ");
		Iterator<String>rti=ll.iterator();
		while(rti.hasNext()) {
			System.out.println(rti.next());
		}
	}
}
