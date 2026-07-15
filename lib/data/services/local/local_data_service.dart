import 'package:ri_rh_v2/domain/models/avisos/aviso.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
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
      username: 'peposuarez',
      nombre: 'Pedro Suarez',
      telefono: '6864349090',
      correo: 'peposuarez@local.com',
      rol: 'Operador',
      departamento: produccion,
      departamentosPermitidos: [produccion],
      liderPermitido: false,
      empleadoId: 21,
    );
  }

  List<Aviso> getAvisos() {
    final today = DateTime.now().copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );
    final yesterday = today.subtract(const Duration(days: 1));
    final dayBeforeYesterday = yesterday.subtract(const Duration(days: 1));
    return [
      Aviso(
        id: 1,
        createdAt: dayBeforeYesterday,
        updatedAt: dayBeforeYesterday,
        content: 'Reunión general a las 10:00 AM en sala A',
        showAt: yesterday,
      ),
      Aviso(
        id: 2,
        createdAt: yesterday,
        updatedAt: yesterday,
        content: 'Recuerda actualizar tu expediente digital',
        showAt: today,
      ),
      Aviso(
        id: 3,
        createdAt: yesterday,
        updatedAt: yesterday,
        content: 'Siguiente lunes será día festivo',
        showAt: today,
      ),
    ];
  }

  List<Empleado> getEmpleados() {
    return [
      Empleado(
        id: 1,
        usuario: 1,
        nombre: 'Daniel Fernandez',
        fechaNacimiento: DateTime(1990, 6, 3),
        clabeInterbancaria: 'TEST',
        numeroContacto: 'Martin Fernandez',
        contactoEmergencia: '1234567890',
        rfc: 'DF20342039',
        curp: 'DF2034OFOK2039',
        numeroSeguroSocial: '1234567890',
        direccionCompleta: 'Av Noexiste 1234',
        escolaridad: Escolaridad.preparatoria,
        montoRetencionInfonavit: 0.0,
        puesto: 1,
        salarioDiario: 450.0,
        antiguedad: 2,
        estatus: EmpleadoEstatus.activo,
      ),
      Empleado(
        id: 2,
        usuario: 2,
        nombre: 'Carla Gomez',
        fechaNacimiento: DateTime(1986, 10, 21),
        clabeInterbancaria: 'TEST',
        numeroContacto: 'Maria Gomez',
        contactoEmergencia: '1234567890',
        rfc: 'DF20342039',
        curp: 'DF2034OFOK2039',
        numeroSeguroSocial: '1234567890',
        direccionCompleta: 'Av Noexiste 1234',
        escolaridad: Escolaridad.universidad,
        montoRetencionInfonavit: 0.0,
        puesto: 2,
        salarioDiario: 650.0,
        antiguedad: 4,
        estatus: EmpleadoEstatus.activo,
      ),
      Empleado(
        id: 3,
        usuario: 3,
        nombre: 'Pedro Juarez',
        fechaNacimiento: DateTime(2001, 8, 10),
        clabeInterbancaria: 'TEST',
        numeroContacto: 'Andrea Cruz',
        contactoEmergencia: '1234567890',
        rfc: 'DF20342039',
        curp: 'DF2034OFOK2039',
        numeroSeguroSocial: '1234567890',
        direccionCompleta: 'Av Noexiste 1234',
        escolaridad: Escolaridad.universidad,
        montoRetencionInfonavit: 0.0,
        puesto: 3,
        salarioDiario: 520.0,
        antiguedad: 2,
        estatus: EmpleadoEstatus.procesoFiniquito,
      ),
      Empleado(
        id: 4,
        usuario: 4,
        nombre: 'Ana Martinez',
        fechaNacimiento: DateTime(1994, 3, 3),
        clabeInterbancaria: 'TEST',
        numeroContacto: 'Carlos Godinez',
        contactoEmergencia: '1234567890',
        rfc: 'DF20342039',
        curp: 'DF2034OFOK2039',
        numeroSeguroSocial: '1234567890',
        direccionCompleta: 'Av Noexiste 1234',
        escolaridad: Escolaridad.universidad,
        montoRetencionInfonavit: 0.0,
        puesto: 4,
        salarioDiario: 480.0,
        antiguedad: 3,
        estatus: EmpleadoEstatus.finiquitado,
      ),
      Empleado(
        id: 5,
        usuario: 5,
        nombre: 'Luis Rodriguez',
        fechaNacimiento: DateTime(1989, 3, 25),
        clabeInterbancaria: 'TEST',
        numeroContacto: 'Ramon Rodriguez',
        contactoEmergencia: '1234567890',
        rfc: 'DF20342039',
        curp: 'DF2034OFOK2039',
        numeroSeguroSocial: '1234567890',
        direccionCompleta: 'Av Noexiste 1234',
        escolaridad: Escolaridad.preparatoria,
        montoRetencionInfonavit: 0.0,
        puesto: 5,
        salarioDiario: 580.0,
        antiguedad: 5,
        estatus: EmpleadoEstatus.activo,
      ),
      Empleado(
        id: 6,
        usuario: 6,
        nombre: 'Sofia Lopez',
        fechaNacimiento: DateTime(2003, 5, 12),
        clabeInterbancaria: 'TEST',
        numeroContacto: 'Daniela Lopez',
        contactoEmergencia: '1234567890',
        rfc: 'DF20342039',
        curp: 'DF2034OFOK2039',
        numeroSeguroSocial: '1234567890',
        direccionCompleta: 'Av Noexiste 1234',
        escolaridad: Escolaridad.universidad,
        montoRetencionInfonavit: 0.0,
        puesto: 6,
        salarioDiario: 500.0,
        antiguedad: 2,
        estatus: EmpleadoEstatus.activo,
      ),
    ];
  }

  List<Puesto> getPuestos() {
    return [
      Puesto(
        id: 1,
        nombre: 'Operador de Maquinaria',
        tipo: TipoPuesto.directo,
      ),
      Puesto(
        id: 2,
        nombre: 'Supervisor de Línea',
        tipo: TipoPuesto.directo,
      ),
      Puesto(
        id: 3,
        nombre: 'Control de Calidad',
        tipo: TipoPuesto.directo,
      ),
      Puesto(
        id: 4,
        nombre: 'Logística',
        tipo: TipoPuesto.directo,
      ),
      Puesto(
        id: 5,
        nombre: 'Mantenimiento',
        tipo: TipoPuesto.directo,
      ),
      Puesto(
        id: 6,
        nombre: 'Recursos Humanos',
        tipo: TipoPuesto.administrativo,
      ),
    ];
  }
}