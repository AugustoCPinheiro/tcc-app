import 'package:flutter/widgets.dart';
import 'package:tcc/util/theme/custom_theme.dart';

class PatientProfile extends StatelessWidget {
  final String name;
  final String birthdate;

  PatientProfile({Key key, this.name = "", this.birthdate = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: NetworkImage(
              "https://i.pinimg.com/originals/b4/00/85/b400851a6b07f8877a9236f275bd8d4f.jpg"),
          width: 180,
          height: 180,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: CustomTheme.getSpacing(2)),
          child: Column(
            children: [
              Text(
                "Nome: ${this.name}",
                textAlign: TextAlign.left,
              ),
              Text(
                "Data de nascimento: ${this.birthdate}",
                textAlign: TextAlign.left,
              ),
            ],
          ),
        )
      ],
    );
  }
}
