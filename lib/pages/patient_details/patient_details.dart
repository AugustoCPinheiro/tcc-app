import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/components/custom_card.dart';
import 'package:tcc/components/health_data_item.dart';
import 'package:tcc/components/page_body_container.dart';
import 'package:tcc/components/patient_profile.dart';
import 'package:tcc/components/story_list.dart';
import 'package:tcc/model/patient.dart';
import 'package:tcc/util/theme/custom_theme.dart';

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
      body: PageBodyContainer(
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
                    name: widget.patient.name,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(bottom: CustomTheme.getSpacing(2)),
                      child: Text(
                        "Monitoramento: ",
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: CustomTheme.getSpacing(2)),
                    child: StoryList(),
                  ),
                  GridView.builder(
                      physics: ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: CustomTheme.getSpacing(2)),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) => HealthDataItem()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
