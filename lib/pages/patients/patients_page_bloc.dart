import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:tcc/pages/patients/patients_event.dart';
import 'package:tcc/pages/patients/patients_state.dart';
import 'package:tcc/persistence/controller/patient_persistence_file_controller.dart';
import 'package:tcc/persistence/facade/persistence_facade.dart';
import 'package:tcc/resources/repository.dart';

class PatientsPageBloc extends Bloc<PatientsEvent, PatientsState> {
  final _repository = Repository();
  PersistenceFacade patientPersistence = PatientPersistenceFileController();

  PatientsPageBloc() : super(const PatientsState());

  @override
  Stream<PatientsState> mapEventToState(PatientsEvent event) async* {
    if (event is PatientsFetched) {
      yield await _mapPatientsFetchedToState(state);
    }
  }

  Future<PatientsState> _mapPatientsFetchedToState(PatientsState state) async {
    try {
      final patients = await _repository.fetchAllPatients();
      if (patients.isEmpty) {
        return state.copyWith(status: PatientsStatus.EMPTY, patients: patients);
      }
      patientPersistence.saveAll(patients);
      return state.copyWith(status: PatientsStatus.SUCCESS, patients: patients);
    } catch (e) {
      return state.copyWith(status: PatientsStatus.FAILURE);
    }
  }
}
