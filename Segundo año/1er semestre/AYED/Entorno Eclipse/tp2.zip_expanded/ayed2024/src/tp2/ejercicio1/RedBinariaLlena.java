package tp2.ejercicio1;

public class RedBinariaLlena {
	private BinaryTree<Integer> tree;
	
	public RedBinariaLlena (BinaryTree<Integer> arbol) {
		this.tree = arbol;
	}
	
	public int retardoReenvio () {
		return retardoReenvio(tree);
	}
	
	private int retardoReenvio (BinaryTree<Integer> arbol) {
		if (arbol.isEmpty())
			return - 1;
		
		int cant = -1;
		
		if (arbol.isLeaf())
			return arbol.getData();
		
		else {
			if (arbol.hasLeftChild()) 
				cant = Math.max(cant,retardoReenvio(arbol.getLeftChild()));
			if (arbol.hasRightChild())
				cant = Math.max (cant,retardoReenvio(arbol.getRightChild()));
		}
		return cant + arbol.getData();
	}
	
	
}
