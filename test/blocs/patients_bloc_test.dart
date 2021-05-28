import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tcc/pages/patients/patients_bloc.dart';
import 'package:tcc/pages/patients/patients_event.dart';
import 'package:tcc/pages/patients/patients_state.dart';

void main() {
  group("PatientsBloc", () {
    PatientsBloc patientsBloc;

    setUp(() {
      patientsBloc = PatientsBloc();
    });

    test("initial status is PatientsStatus.INITIAL", () {
      expect(patientsBloc.state.status, PatientsStatus.INITIAL);
    });

    blocTest<PatientsBloc, PatientsState>("Status on fetch",
        build: () => patientsBloc,
        act: (bloc) => bloc.add(PatientsFetched()),
        expect: () => PatientsStatus.EMPTY);
  });
}
