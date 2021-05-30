import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/components/patient_list_item.dart';
import 'package:tcc/model/patient.dart';
import 'package:tcc/model/patient_status.dart';
import 'package:tcc/pages/patient_details/patient_details.dart';
import 'package:tcc/pages/patients/patients_bloc.dart';
import 'package:tcc/persistence/controller/patient_persistence_file_controller.dart';
import 'package:tcc/persistence/facade/persistence_facade.dart';
import 'package:tcc/util/theme/custom_theme.dart';
import 'package:tcc/util/theme/theme_colors.dart';

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

    return Padding(
      padding: EdgeInsets.symmetric(vertical: CustomTheme.getSpacing(3)),
      child: StreamBuilder<List<Patient>>(
          stream: _bloc.getPatientsStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.isEmpty) {
                return Expanded(child: Text("Sem registros"));
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return PatientListItem(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatientDetailsPage(
                                    patient: snapshot.data.elementAt(index),
                                  )));
                    },
                    title: snapshot.data.elementAt(index).name,
                    subtitle:
                        snapshot.data.elementAt(index).bedOccupation.bed.code,
                    patientStatus: PatientStatus.Alert,
                  );
                },
                itemCount: snapshot.data.length,
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: ThemeColors.RED,
              ));
            }
            if (snapshot.hasError) {
              return Text("Erro");
            }
            return Container();
          }),
    );
  }

  @override
  void dispose() {
    _bloc.closeStream();
    super.dispose();
  }
}
