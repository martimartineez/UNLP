package tp2.ejercicio1;

import java.util.ArrayList;

public class BinaryTree <T> {
	
	private T data;
	private BinaryTree<T> leftChild;   
	private BinaryTree<T> rightChild; 

	
	public BinaryTree() {
		super();
	}

	public BinaryTree(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	/**
	 * Preguntar antes de invocar si hasLeftChild()
	 * @return
	 */
	public BinaryTree<T> getLeftChild() {
		return leftChild;
	}
	/**
	 * Preguntar antes de invocar si hasRightChild()
	 * @return
	 */
	public BinaryTree<T> getRightChild() {
		return this.rightChild;
	}

	public void addLeftChild(BinaryTree<T> child) {
		this.leftChild = child;
	}

	public void addRightChild(BinaryTree<T> child) {
		this.rightChild = child;
	}

	public void removeLeftChild() {
		this.leftChild = null;
	}

	public void removeRightChild() {
		this.rightChild = null;
	}

	public boolean isEmpty(){
		return (this.isLeaf() && this.getData() == null);
	}

	public boolean isLeaf() {
		return (!this.hasLeftChild() && !this.hasRightChild());

	}
		
	public boolean hasLeftChild() {
		return this.leftChild!=null;
	}

	public boolean hasRightChild() {
		return this.rightChild!=null;
	}
	@Override
	public String toString() {
		return this.getData().toString();
	}

	public  int contarHojas() {
		if(!this.isLeaf()) {
			if(this.hasLeftChild()&& this.hasRightChild()) {
				return (1+this.getLeftChild().contarHojas()+this.getRightChild().contarHojas());
			}
			else
				if(this.hasLeftChild()) {
					return (1+this.getLeftChild().contarHojas());
				}
				else {
					return 1+this.getRightChild().contarHojas();
				}
		}
		else return 1;
		
	}
		
		
    	 
    public BinaryTree<T> espejo(){
    	BinaryTree <T> tree = new BinaryTree<T> (this.getData());
    	
    	if (this.hasLeftChild()) {
			tree.addRightChild(this.getLeftChild().espejo());
		}
    	if (this.hasRightChild()) {
			tree.addLeftChild(this.getRightChild().espejo());
		}
		
	    return tree;
    	
    	
    }

	// 0<=n<=m
	public void entreNiveles(int n, int m){
		BinaryTree<T> arbol;
		ArrayList<BinaryTree<T>> cola = new ArrayList<BinaryTree<T>>();
		cola.add(this);
		cola.add(null);
		int nivel = 0;
		while ((!cola.isEmpty()) && (nivel <= m)) {
			arbol = cola.remove(0);
			if (arbol!= null){
				if (nivel >= n)
					System.out.println(arbol.getData());
				if (arbol.hasLeftChild())
					cola.add(arbol.getLeftChild());
				if(arbol.hasRightChild())
					cola.add(arbol.getRightChild());
			} else if (!cola.isEmpty()) {
				cola.add(null);
				nivel++;	
			}
		}
	 	
   }
		
}

