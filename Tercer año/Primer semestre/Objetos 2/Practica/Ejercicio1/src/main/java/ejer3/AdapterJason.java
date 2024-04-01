package ejer3;
import java.util.List;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class AdapterJason extends VoorheesExporter{
	private JSONObject exportar(Socio socio) {
		JSONObject obj= new JSONObject();
		obj.put("nombre", socio.getNombre());
		obj.put("email", socio.getEmail());
		obj.put("legajo", socio.getLegajo());	
		return obj;
	}
	public String exportar(List<Socio> socios) {
		if (socios.isEmpty()) {
			return "[]";
		}
		JSONArray list=new JSONArray();
		socios.forEach(socio -> {
			list.add(this.exportar(socio));
		});
		return list.toJSONString();
	}

}
