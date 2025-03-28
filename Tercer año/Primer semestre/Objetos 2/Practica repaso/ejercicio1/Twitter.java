package ar.edu.unlp.info.oo1.ejercicio1;

import java.util.*;

public class Twitter {
	private List<Usuario> usuarios;
	
	public Twitter() {
		this.usuarios=new ArrayList<Usuario>();
	}
	
	public String crearUsuario(String name) {
		if (this.usuarios.stream().anyMatch(usu -> usu.getName().equals(name))
				) {
			return "Usuario no creado, nameScreen no disponible";
		}
		else {
			this.usuarios.add(new Usuario(name));
			return "Usuario creado!";
		}
	}
	
	public String eliminarUsuario(Usuario usuario) {
		if(this.usuarios.stream().anyMatch(usu->usu.equals(usuario))) {
			usuario.eliminar();
			this.usuarios.remove(usuario);
			return "Usuario eliminado";
		}
		else {
			return "No se encontro usuario";
		}
	}
}
