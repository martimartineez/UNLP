package TP1_8;



public class CircularQueue<T> extends Queue {
	public T shift() {
		if(!super.isEmpty()) {
			T dat=(T) super.dequeue();
			super.enqueue(dat);
			return dat;
		}
		else
			return null;
		
	}
}
