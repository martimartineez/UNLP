package tp2.ejercicio1;

import java.util.ArrayList;

public class ContadorArbol {
	private BinaryTree<Integer> tree;
	
	public ContadorArbol(BinaryTree<Integer> dato) {
		this.tree=dato;
	}
	
	public ArrayList<Integer> numerosPares(){
		ArrayList<Integer>aux=new ArrayList<Integer>();
		contarParesPostOrden(aux,tree);
		return aux;
		
	}
	public void contarParesInOrden(ArrayList<Integer> lista,BinaryTree<Integer> tree) {
		if (tree.hasLeftChild())
			contarParesInOrden(lista,tree.getLeftChild());
		if (tree.getData() % 2 == 0)
			lista.add(tree.getData());
		if (tree.hasRightChild())
			contarParesInOrden(lista,tree.getRightChild());
	}
	
	public void contarParesPostOrden(ArrayList<Integer> lista,BinaryTree<Integer> tree) {
		if (tree.hasLeftChild())
			contarParesPostOrden(lista,tree.getLeftChild());
		if (tree.hasRightChild())
			contarParesPostOrden(lista,tree.getRightChild());
		if (tree.getData() % 2 == 0)
			lista.add(tree.getData());
		
	}
}
