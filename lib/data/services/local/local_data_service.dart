import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';

class LocalDataService {
  bool isAuthenticated = false;

  List<Departamento> getDepartamentos() {
    return [
      Departamento(
        id: 1, nombre: 'Proyectos', descripcion: 'Proyectos', presupuesto: 150.0, divisa: Divisa.USD, lider: Lider(
          id: 1, nombre: 'diegoproyectos', telefono: '6781239000', correo: 'diegoproyectos@local.com'
        ),
      ),
      Departamento(
        id: 2, nombre: 'Calidad', descripcion: 'Calidad', presupuesto: 1200.0, divisa: Divisa.USD, lider: Lider(
          id: 2, nombre: 'juancalidad', telefono: '6861234567', correo: 'juancalidad@local.com'
        ),
      ),
      Departamento(
        id: 3, nombre: 'Compras', descripcion: 'Compras', presupuesto: 100.40, divisa: Divisa.USD, lider: Lider(
          id: 3, nombre: 'carlacompras', telefono: '1112223333', correo: 'carlacompras@local.com'
        ),
      ),
      Departamento(
        id: 4, nombre: 'Almacen', descripcion: 'Almacen', presupuesto: 900.0, divisa: Divisa.USD,
      ),
      Departamento(
        id: 5, nombre: 'Finanzas', descripcion: 'Finanzas', presupuesto: 4983.25, divisa: Divisa.USD, lider: Lider(
          id: 4, nombre: 'franciscofinanzas', telefono: '0102023030', correo: 'franciscofinanzas@local.com'
        ),
      ),
      Departamento(
        id: 6, nombre: 'Recursos Humanos', descripcion: 'Recursos Humanos', presupuesto: 0.0, divisa: Divisa.USD,
      ),
      Departamento(
        id: 7, nombre: 'Direccion', descripcion: 'Direccion', presupuesto: 0.0, divisa: Divisa.USD,
      ),
      Departamento(
        id: 8, nombre: 'Banco', descripcion: 'Banco', presupuesto: 10000.0, divisa: Divisa.USD, lider: Lider(
          id: 5, nombre: 'erikbanco', telefono: '6862396071', correo: 'erikbanco@local.com'
        ),
      ),
      Departamento(
        id: 9, nombre: 'Ventas', descripcion: 'Ventas', presupuesto: 820240.06, divisa: Divisa.USD, lider: Lider(
          id: 6, nombre: 'valentinaventas', telefono: '0009874321', correo: 'valentinaventas@local.com'
        ),
      ),
      Departamento(
        id: 10, nombre: 'Electronica', descripcion: 'Electronica', presupuesto: 0.0, divisa: Divisa.MEX,
      ),
      Departamento(
        id: 11, nombre: 'Diseño', descripcion: 'Diseño', presupuesto: 0.0, divisa: Divisa.MEX,
      ),
      Departamento(
        id: 12, nombre: 'Produccion', descripcion: 'Produccion', presupuesto: 1000.00, divisa: Divisa.USD,
      ),
      Departamento(
        id: 13, nombre: 'Planeacion', descripcion: 'Planeacion', presupuesto: 1791.25, divisa: Divisa.USD,
      ),
    ];
  }

  User getUser() {
    final produccion = getDepartamentos().firstWhere((e) => e.nombre == 'Produccion');
    return User(
      id: 21,
      username: 'pedrosuarez',
      nombre: 'Pedro Suarez',
      telefono: '6864349090',
      correo: 'pedrosuarez@local.com',
      rol: 'Operador',
      departamento: produccion,
      departamentosPermitidos: [produccion],
      liderPermitido: false,
      empleadoId: 21,
    );
  }
}