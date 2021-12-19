import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' as intl;
import 'package:tcc/components/labeled_data.dart';
import 'package:tcc/model/patient.dart';
import 'package:tcc/util/theme/custom_theme.dart';

class PatientProfile extends StatelessWidget {
  final Patient patient;

  PatientProfile({Key key, this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FadeInImage(
          image: NetworkImage(
              "https://i.pinimg.com/originals/b4/00/85/b400851a6b07f8877a9236f275bd8d4f.jpg"),
          placeholder: AssetImage("assets/images/img.png"),
          width: 180,
          height: 180,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: CustomTheme.getSpacing(2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabeledData(
                label: "Nome",
                text: this.patient.name,
              ),
              LabeledData(
                label: "Leito",
                text: this.patient.bedOccupation.bed.code,
              ),
              LabeledData(
                label: "Entrada",
                text: intl.DateFormat("dd/MM/yyyy")
                    .format(this.patient.bedOccupation.startDate),
              )
            ],
          ),
        )
      ],
    );
  }
}
