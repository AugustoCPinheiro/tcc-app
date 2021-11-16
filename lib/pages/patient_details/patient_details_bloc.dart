import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/pages/patient_details/patient_details_event.dart';
import 'package:tcc/pages/patient_details/patient_details_state.dart';
import 'package:tcc/resources/repository.dart';

class PatientDetailsBloc
    extends Bloc<PatientDetailsEvent, PatientDetailsState> {
  final _repository = Repository();

  PatientDetailsBloc() : super(PatientDetailsState());

  @override
  Stream<PatientDetailsState> mapEventToState(
      PatientDetailsEvent event) async* {
    if (event is PatientDetailsFetched) {
      yield await _mapFetchedPatientDetails(event.patientCode, state);
    }
  }

  Future<PatientDetailsState> _mapFetchedPatientDetails(
      String patientCode, PatientDetailsState state) async {
    try {
      final patientDetails = await _repository.fetchPatientHealth(patientCode);
      return state.copyWith(
          status: PatientDetailsStatus.SUCCESS, patientHealth: patientDetails);
    } catch (e, ex) {
      print(e);
      print(ex);
      return state.copyWith(status: PatientDetailsStatus.ERROR);
    }
  }
}
