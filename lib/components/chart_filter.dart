import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/util/theme/custom_theme.dart';

class ChartFilter extends StatelessWidget {
  final List<String> chartDataIds;

  ChartFilter({this.chartDataIds});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Filtro: "),
        SizedBox(
          height: 50,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                    fillColor: MaterialStateProperty.all(
                        CustomTheme.getColor(CustomTheme.COLOR_PRIMARY)),
                  ),
                  Text(chartDataIds.elementAt(index))
                ],
              );
            },
            itemCount: chartDataIds.length,
          ),
        ),
      ],
    );
  }
}
