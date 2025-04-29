package ar.edu.unlp.info.oo1.ejercicio6Patrones;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Excursion {
	private EstadoInscripcion estado;
	private List<Usuario> usuariosInscriptos;
	private List<Usuario> listaEspera;
	private String nombre;
	private LocalDate fechaInicio;
	private LocalDate fechaFin;
	private String puntoEncuentro;
	private double costo;
	private int cupoMinimo;
	private int cupoMaximo;
	
	public Excursion(String nombre, LocalDate fechaInicio, LocalDate fechaFin, String puntoEncuentro, double costo,
			int cupoMinimo, int cupoMaximo) {
		this.nombre = nombre;
		this.estado = new InscripcionProvisoria(this);
		this.usuariosInscriptos = new ArrayList<>();
		this.listaEspera = new ArrayList<>();
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.puntoEncuentro = puntoEncuentro;
		this.costo = costo;
		this.cupoMinimo = cupoMinimo;
		this.cupoMaximo = cupoMaximo;
	}
	
	public List<Usuario> getInscriptos() {
		return usuariosInscriptos;
	}

	public List<Usuario> getEnEspera() {
		return listaEspera;
	}
	
	public EstadoInscripcion getEstado() {
		return estado;
	}

	public void setEstado(EstadoInscripcion estado) {
		this.estado = estado;
	}

	public int getCupoMinimo() {
		return cupoMinimo;
	}

	public int getCupoMaximo() {
		return cupoMaximo;
	}

	public void inscribir (Usuario unUsuario) {
		this.estado.inscribir(unUsuario);
	}
	public void agregarInscripto(Usuario usuario) {
		this.usuariosInscriptos.add(usuario);
	}
	public void agregarListaEspera(Usuario usuario) {
		this.listaEspera.add(usuario);
	}
	public boolean alcanzoMinimo() {
		return this.getInscriptos().size() >= this.cupoMinimo;
	}
	
	public boolean alcanzoMaximo() {
		return this.getInscriptos().size() >= this.cupoMaximo;
	}
	
	public String obtenerInformacion() {
		return "La excursion '" + this.nombre 
				+ "' tiene un costo de " + this.costo
				+ " con fecha de inicio " + this.fechaInicio.toString()
				+ " y fecha de fin " + this.fechaFin.toString()
				+ ".\nEl punto de encuentro es en '" + this.puntoEncuentro
				+ "'. " + this.estado.obtenerInformacion();
	}
	
	public String getMailsInscriptos() {
		return this.usuariosInscriptos.stream()
				.map(inscripto -> inscripto.getMail())
				.reduce("",(acumulator, element)-> acumulator +"\n" + element);
	}
	
}
