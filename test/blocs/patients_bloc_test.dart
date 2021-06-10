import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tcc/pages/patients/patients_event.dart';
import 'package:tcc/pages/patients/patients_page_bloc.dart';
import 'package:tcc/pages/patients/patients_state.dart';

void main() {
  group("PatientsBloc", () {
    PatientsPageBloc patientsBloc;

    setUp(() {
      patientsBloc = PatientsPageBloc();
    });

    test("initial status is PatientsStatus.INITIAL", () {
      expect(patientsBloc.state.status, PatientsStatus.INITIAL);
    });

    test("Status on fetch", () async {
      await expectLater(patientsBloc.state.status,
          emitsInOrder([PatientsStatus.INITIAL, PatientsStatus.SUCCESS]));
    });

    blocTest<PatientsPageBloc, PatientsState>("Status on fetch",
        build: () => patientsBloc,
        act: (bloc) => bloc.add(PatientsFetched()),
        expect: () => PatientsStatus.EMPTY);
  });
}
