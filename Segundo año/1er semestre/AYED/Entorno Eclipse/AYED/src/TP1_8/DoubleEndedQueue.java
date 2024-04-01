package TP1_8;



public class DoubleEndedQueue<T> extends Queue {
	
	public void enqueueFirst(T data) {
		if(super.isEmpty()) {
			super.enqueue(data);
		}
		else {
			T aux;int i;
			super.enqueue(data);
			for (i=0;i<super.size()-1;i++){
				aux=(T) super.dequeue();
				super.enqueue(aux);
			}
		}
	}
}
