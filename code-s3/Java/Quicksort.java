import java.util.Arrays;

class Quicksort {
	static int partition(int a[], int l, int h) {
		int pivot=a[h];
		int i=(l-1);
		
		for(int j=l;j<h;j++) {
			if(a[j]<=pivot) {
				i++;
				int temp=a[i];
				a[i]=a[j];
				a[j]=temp;
			}
		}
		int temp=a[i+1];
		a[i+1]=a[h];
		a[h]=temp;
		return(i+1);
	}
	static void quicksort(int a[], int l, int h) {
		if(l<h) {
			int pi=partition(a,l,h);
			quicksort(a,l,pi-1);
			quicksort(a,pi+1,h);
		}
	}
	public static void main(String args[]) {
		int[] n={8,7,2,1,0,9,6};
		System.out.println("Unsorted Array");
		System.out.println(Arrays.toString(n));
		int size=n.length;
		Quicksort.quicksort(n,0,size-1);
		System.out.println("Sorted Array");
		System.out.println(Arrays.toString(n));
	}
}
