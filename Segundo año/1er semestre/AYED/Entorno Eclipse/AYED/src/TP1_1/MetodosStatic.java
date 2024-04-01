package TP1_1;

public class MetodosStatic {

	public static void enterosFor(int a,int b) {
		for (int i=a;i<=b;i++){
			System.out.println(i);
		}
	}
	public static void enterosWhile(int a,int b) {
		int i=a;
		while(i<=b) {
			System.out.println(i);
			i++;
		}
	}
	public static void enterosEspecial(int a,int b) {
		if(a<=b) {
			System.out.println(a);
			enterosEspecial(a+1,b);
		}
	}
}
