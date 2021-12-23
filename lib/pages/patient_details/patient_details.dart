import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tcc/components/custom_card.dart';
import 'package:tcc/components/health_data_item.dart';
import 'package:tcc/components/labeled_data.dart';
import 'package:tcc/components/page_body_container.dart';
import 'package:tcc/components/patient_profile.dart';
import 'package:tcc/components/story.dart';
import 'package:tcc/components/story_list.dart';
import 'package:tcc/model/disease.dart';
import 'package:tcc/model/patient.dart';
import 'package:tcc/navigation/app_navigator_bloc.dart';
import 'package:tcc/navigation/app_navigator_event.dart';
import 'package:tcc/pages/patient_details/patient_details_bloc.dart';
import 'package:tcc/pages/patient_details/patient_details_event.dart';
import 'package:tcc/pages/patient_details/patient_details_state.dart';
import 'package:tcc/util/theme/custom_theme.dart';
import 'package:tcc/util/theme/theme_colors.dart';

class PatientDetailsPage extends StatefulWidget {
  final Patient patient;

  const PatientDetailsPage({Key key, this.patient}) : super(key: key);

  @override
  _PatientDetailsPageState createState() {
    return _PatientDetailsPageState();
  }
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => PatientDetailsBloc()
          ..add(PatientDetailsFetched(widget.patient.patientCode)),
        child: PageBodyContainer(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                CustomTheme.getSpacing(1),
                CustomTheme.getSpacing(5),
                CustomTheme.getSpacing(1),
                CustomTheme.getSpacing(1)),
            child: CustomCard(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: CustomTheme.getSpacing(2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PatientProfile(
                      patient: widget.patient,
                    ),
                    BlocBuilder<PatientDetailsBloc, PatientDetailsState>(
                        builder: (context, state) {
                      if (state.status == PatientDetailsStatus.INITIAL) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor:
                                CustomTheme.getColor(ThemeColors.RED),
                          ),
                        );
                      }
                      if (state.status == PatientDetailsStatus.SUCCESS) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabeledData(
                              label: "Histórico de doenças",
                              text: state.patientHealth.diseases
                                  .map<String>((e) =>
                                      DiseaseStatusHelper.diseaseToString(e))
                                  .toList()
                                  .join(", "),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: CustomTheme.getSpacing(2),
                                    top: CustomTheme.getSpacing(4)),
                                child: Text(
                                  "Ultimo registro: ",
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: CustomTheme.getSpacing(2)),
                              child: StoryList(stories: [
                                Story(
                                  type: StoryType.CHART,
                                  onTap: () {
                                    BlocProvider.of<AppNavigatorBloc>(context)
                                        .add(ChartsPageCalled(widget.patient,
                                            state.patientHealth));
                                  },
                                )
                              ]),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: CustomTheme.getSpacing(2)),
                                child: LabeledData(
                                    label: "Data",
                                    text: DateFormat.yMMMd().add_jm().format(
                                        state.patientHealth.healthData.last
                                            .date))),
                            GridView.builder(
                                physics: ScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing:
                                            CustomTheme.getSpacing(2)),
                                shrinkWrap: true,
                                itemCount: state.patientHealth.healthData.last
                                    .toIterable()
                                    .length,
                                itemBuilder: (context, index) {
                                  MapEntry entry = state
                                      .patientHealth.healthData.last
                                      .toIterable()
                                      .entries
                                      .elementAt(index);
                                  return HealthDataItem(
                                      label: entry.key, value: entry.value);
                                })
                          ],
                        );
                      }
                      return Text("Error");
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
