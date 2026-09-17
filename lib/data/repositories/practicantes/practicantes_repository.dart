import 'package:file_picker/file_picker.dart';
import 'package:ri_rh_v2/data/services/api/api_client.dart';
import 'package:ri_rh_v2/domain/models/credenciales_generadas/credenciales_generadas.dart';
import 'package:ri_rh_v2/domain/models/departamento/departamento.dart';
import 'package:ri_rh_v2/domain/models/practicante/practicante.dart';
import 'package:ri_rh_v2/domain/models/puestos/puesto.dart';
import 'package:ri_rh_v2/domain/models/universidad/universidad.dart';
import 'package:ri_rh_v2/utils/result.dart';

abstract class PracticantesRepository {
  /// List practicantes.
  Future<Result<List<Practicante>>> getPracticantes();

  /// Retrieve practicante.
  Future<Result<Practicante>> getPracticante(int id);

  /// Forces the next [getPracticantes]/[getPracticante] call to fetch fresh
  /// data instead of returning a cached result.
  void invalidateCache();

  /// Transitions a practicante/residente between alta and baja. Returns a
  /// confirmation message from the backend (e.g. unpaid nominas removed as
  /// a side effect).
  Future<Result<String>> cambiarEstado(int practicanteId, StatusPracticante nuevoEstado, {
    DateTime? fechaBaja,
    PlatformFile? cartaLiberacion,
  });

  /// Da de alta un nuevo Practicante/Residente. El backend crea y vincula un
  /// Usuarios automáticamente; si vino generado, el resultado trae
  /// `credencialesGeneradas` poblado (una sola vez).
  Future<Result<Practicante>> createPracticante(PracticanteCreateParams params);

  /// Catálogos disponibles para el formulario de alta.
  Future<Result<List<Puesto>>> getPuestos();
  Future<Result<List<Universidad>>> getUniversidades();

  /// Crea un puesto/universidad nuevo en el catálogo (para cuando no existe
  /// el que se necesita al dar de alta).
  Future<Result<Puesto>> createPuesto(String nombre, String tipos);
  Future<Result<Universidad>> createUniversidad(String nombre, String direccion, String numeroContacto);

  /// Catálogo de departamentos, para asignarle uno al Usuarios que se crea
  /// al dar de alta.
  Future<Result<List<Departamento>>> getDepartamentos();

  /// Regenera la contraseña del Usuarios vinculado a este practicante,
  /// invalidando la anterior. Se muestra una sola vez.
  Future<Result<CredencialesGeneradas>> regenerarPassword(int practicanteId);
}