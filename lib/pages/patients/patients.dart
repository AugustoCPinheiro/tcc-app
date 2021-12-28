import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/components/patient_list_item.dart';
import 'package:tcc/model/patient.dart';
import 'package:tcc/navigation/app_navigator_bloc.dart';
import 'package:tcc/navigation/app_navigator_event.dart';
import 'package:tcc/pages/patients/patients_bloc.dart';
import 'package:tcc/pages/patients/patients_event.dart';
import 'package:tcc/pages/patients/patients_state.dart';
import 'package:tcc/util/theme/custom_theme.dart';
import 'package:tcc/util/theme/theme_colors.dart';

class PatientsPage extends StatefulWidget {
  @override
  _PatientsPageState createState() {
    return _PatientsPageState();
  }
}

class _PatientsPageState extends State<PatientsPage> {
  List<Patient> _patients = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: CustomTheme.getSpacing(3)),
      child: BlocProvider(
        create: (context) => PatientsBloc()..add(PatientsFetched()),
        child: BlocListener<PatientsBloc, PatientsState>(
          child: BlocBuilder<PatientsBloc, PatientsState>(
            builder: (context, state) {
              switch (state.status) {
                case PatientsStatus.INITIAL:
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: CustomTheme.getColor(ThemeColors.RED),
                  ));
                case PatientsStatus.SUCCESS:
                  return RefreshIndicator(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          print(_patients);
                          return PatientListItem(
                            onTap: () {
                              BlocProvider.of<AppNavigatorBloc>(context).add(
                                  PatientDetailsCalled(
                                      _patients.elementAt(index)));
                            },
                            title: _patients.elementAt(index).name,
                            subtitle: _patients
                                .elementAt(index)
                                .bedOccupation
                                .bed
                                .code,
                            patientStatus:
                                _patients.elementAt(index).healthStatus,
                          );
                        },
                        itemCount: _patients.length,
                      ),
                      onRefresh: () async {
                        BlocProvider.of<PatientsBloc>(context)
                            .add(PatientsFetched());
                      });

                case PatientsStatus.EMPTY:
                  return Center(
                      child: Text(
                    "Sem registros",
                    style: TextStyle(color: Colors.white),
                  ));

                case PatientsStatus.FAILURE:
                  return Text("Erro");

                default:
                  return Text("Erro");
              }
            },
          ),
          listener: (context, state) {
            if (state.status == PatientsStatus.SUCCESS) {
              setState(() {
                _patients = state.patients;
              });
            }
            if (state.status == PatientsStatus.FAILURE) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: CustomTheme.getColor(ThemeColors.RED),
                content: Text('Ocorreu um erro'),
              ));
            }
          },
        ),
      ),
    );
  }
}
