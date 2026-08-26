import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ri_rh_v2/config/assets.dart';
import 'package:ri_rh_v2/data/services/api/models/empleado/empleado_api_model.dart';
import 'package:ri_rh_v2/data/services/api/models/practicante/practicante_api_model.dart';
import 'package:ri_rh_v2/domain/models/avisos/aviso.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/empleados/empleado.dart';
import 'package:ri_rh_v2/domain/models/horario/horario.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/universidad/universidad.dart';
import 'package:ri_rh_v2/domain/models/user/user.dart';
import 'package:ri_rh_v2/utils/time/time.dart';

class LocalDataService {
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

  Future<List<Empleado>> getEmpleados() async {
    final users = getUsers();
    final puestos = getPuestos();

    final json = await _loadStringAsset(Assets.empleados);
    final empleados = json
    .map<EmpleadoApiModel>(EmpleadoApiModel.fromJson)
    .map<Empleado>((apiEmpleado) => Empleado.fromApiModel(
      model: apiEmpleado,
      users: users,
      puestos: puestos,
    )).toList();
    return empleados;
  }

  List<User> getUsers() {
    final departamentos = getDepartamentos();
    return [
      User(
        id: 1,
        username: 'danielfernandez',
        nombre: 'Daniel Fernandez',
        telefono: '555-0101',
        correo: 'daniel-f@local.com',
        rol: 'OPERADOR',
        departamento: departamentos[11],
        departamentosPermitidos: [departamentos[11]],
        liderPermitido: false,
        empleadoId: 1,
      ),
      User(
        id: 2,
        username: 'carlagomez',
        nombre: 'Carla Gomez',
        telefono: '555-0102',
        correo: 'carla-g@local.com',
        rol: 'LIDER',
        departamento: departamentos[11],
        departamentosPermitidos: [departamentos[11]],
        liderPermitido: true,
        empleadoId: 2,
      ),
      User(
        id: 3,
        username: 'pedrojuarez',
        nombre: 'Pedro Juarez',
        telefono: '555-0103',
        correo: 'pedro-j@local.com',
        rol: 'OPERADOR',
        departamento: departamentos[11],
        departamentosPermitidos: [departamentos[11]],
        liderPermitido: false,
        empleadoId: 3,
      ),
      User(
        id: 4,
        username: 'anamartinez',
        nombre: 'Ana Martinez',
        telefono: '555-0104',
        correo: 'ana-m@local.com',
        rol: 'LIDER',
        departamento: departamentos[12],
        departamentosPermitidos: [departamentos[12]],
        liderPermitido: true,
        empleadoId: 4,
      ),
      User(
        id: 5,
        username: 'luisrodriguez',
        nombre: 'Luis Rodriguez',
        telefono: '555-0105',
        correo: 'luis-r@local.com',
        rol: 'OPERADOR',
        departamento: departamentos[1],
        departamentosPermitidos: [departamentos[1]],
        liderPermitido: false,
        empleadoId: 5,
      ),
      User(
        id: 6,
        username: 'sofialopez',
        nombre: 'Sofia Lopez',
        telefono: '555-0106',
        correo: 'sofia-l@local.com',
        rol: 'LIDER',
        departamento: departamentos[5],
        departamentosPermitidos: [departamentos[5]],
        liderPermitido: true,
        empleadoId: 6,
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
      Puesto(
        id: 7,
        nombre: 'Practicante',
        tipo: TipoPuesto.directo,
      ),
    ];
  }

  List<Universidad> getUniversidades() {
    return [
      Universidad(
        id: 1,
        nombre: 'Universidad Cimarrones',
        direccion: 'Porfirio Diaz C.P. 1234',
        numeroContacto: '556-0101',
      ),
      Universidad(
        id: 2,
        nombre: 'Universidad Bufalos',
        direccion: 'Olmecas 542 C.P. 1234',
        numeroContacto: '556-0102',
      ),
      Universidad(
        id: 3,
        nombre: 'Universidad Tlacuaches',
        direccion: 'Aztecas C.P. 1234',
        numeroContacto: '556-0103',
      ),
    ];
  }

  Future<List<Practicante>> getPracticantes() async {
    final users = getUsers();
    final universidades = getUniversidades();
    final puestos = getPuestos();

    final json = await _loadStringAsset(Assets.practicantes);
    final practicantes = json
    .map<PracticanteApiModel>(PracticanteApiModel.fromJson)
    .map<Practicante>((apiPracticante) => Practicante.fromApiModel(
      model: apiPracticante,
      users: users,
      universidades: universidades,
      puestos: puestos,
    ))
    .toList();
    return practicantes;
  }

  List<Horario> getHorarios() {
    return [
      Horario(
        id: 1,
        name: 'Diurno',
        firstStartTime: Time(7),
        firstEndTime: Time(12),
        secondStartTime: Time(13),
        secondEndTime: Time(17),
        mon: true,
        tue: true,
        wed: true,
        thu: true,
        fri: true,
        sat: false,
        sun: false,
      ),
    ];
  }

  Future<List<Map<String, dynamic>>> _loadStringAsset(String asset) async {
    final localData = await rootBundle.loadString(asset);
    return (json.decode(localData) as List).cast<Map<String, dynamic>>();
  }
}