import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/components/patient_list_item.dart';
import 'package:tcc/model/patient.dart';
import 'package:tcc/model/patient_status.dart';
import 'package:tcc/pages/patients/patients_bloc.dart';
import 'package:tcc/persistence/controller/patient_persistence_file_controller.dart';
import 'package:tcc/persistence/facade/persistence_facade.dart';

class PatientsPage extends StatefulWidget {
  @override
  _PatientsPageState createState() {
    return _PatientsPageState();
  }
}

class _PatientsPageState extends State<PatientsPage> {
  final PatientsBloc _bloc = PatientsBloc();
  final PersistenceFacade persistenceFacade =
      PatientPersistenceFileController();
  @override
  Widget build(BuildContext context) {
    _bloc.fetchAllPatients();
    persistenceFacade.findAll().then((value) => print(value[0]));
    return StreamBuilder<List<Patient>>(
        stream: _bloc.getPatientsStream(),
        initialData: [Patient.asTest()],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return PatientListItem(
                  title: snapshot.data.elementAt(index).name,
                  patientStatus: PatientStatus.Alert,
                );
              },
              itemCount: snapshot.data.length,
            );
          } else if (snapshot.hasError) {
            return Text("error");
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  @override
  void dispose() {
    _bloc.closeStream();
    super.dispose();
  }
}
