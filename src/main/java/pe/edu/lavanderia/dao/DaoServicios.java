package pe.edu.lavanderia.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.lavanderia.entidades.jdbc.Servicios;

public class DaoServicios extends DaoGenerico {
	// Metodo para obtener Servicios
	public List<Servicios> getServicios() {
		List<Servicios> serviceList = new ArrayList<Servicios>();// Creamos lista
		Connection conexion = getConexion();// Obtenemos conexion
		String sentencia = "SELECT cod_servicio, nom_servicio, desc_servicio, cod_categoria, precio FROM public.servicios";

		PreparedStatement ps;
		try {
			ps = conexion.prepareStatement(sentencia);
			ResultSet rs = ps.executeQuery();

			// Recorremos
			while (rs.next()) {
				Servicios obServicio = new Servicios(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),
						rs.getDouble(5));
				serviceList.add(obServicio);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return serviceList;
	}
}
