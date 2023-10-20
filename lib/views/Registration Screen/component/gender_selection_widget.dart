import 'package:flutter/material.dart';

import '../../../enum/gender_enum.dart';

class GenderSelectionWidget extends StatefulWidget {
  final Gender selectedGender;
  final Function(Gender) onGenderChanged;

  const GenderSelectionWidget(
      {super.key, required this.selectedGender, required this.onGenderChanged});

  @override
  GenderSelectionWidgetState createState() => GenderSelectionWidgetState();
}

class GenderSelectionWidgetState extends State<GenderSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender',
          style: TextStyle(fontSize: 16),
        ),
        Row(
          children: <Widget>[
            Row(
              children: [
                Radio<Gender>(
                  value: Gender.male,
                  groupValue: widget.selectedGender,
                  onChanged: (Gender? value) {
                    widget.onGenderChanged(Gender.male);
                  },
                ),
                const Text('Male'),
              ],
            ),
            Row(
              children: [
                Radio<Gender>(
                  value: Gender.female,
                  groupValue: widget.selectedGender,
                  onChanged: (Gender? value) {
                    widget.onGenderChanged(Gender.female);
                  },
                ),
                const Text('Female'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
