import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/components/patient_list_item.dart';
import 'package:tcc/model/patient_health_status.dart';
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
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return PatientListItem(
                        onTap: () {
                          BlocProvider.of<AppNavigatorBloc>(context).add(
                              PatientDetailsCalled(
                                  state.patients.elementAt(index)));
                        },
                        title: state.patients.elementAt(index).name,
                        subtitle: state.patients
                            .elementAt(index)
                            .bedOccupation
                            .bed
                            .code,
                        patientStatus: PatientHealthStatus.Alert,
                      );
                    },
                    itemCount: state.patients.length,
                  );

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
