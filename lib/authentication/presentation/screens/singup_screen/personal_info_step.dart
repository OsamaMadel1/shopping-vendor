import 'package:app/authentication/domain/value_objects/gender_entity.dart';
import 'package:app/core/presentation/widgets/reactiv_radio_list_tile_gender.dart';
import 'package:app/core/presentation/widgets/reactive_date_picker_widget.dart';
import 'package:app/core/presentation/widgets/reactive_text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PersonalInfoStep extends StatelessWidget {
  const PersonalInfoStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ReactiveTextInputWidget(
                hint: "First Name",
                controllerName: "firstName",
                prefixIcon: Icons.person,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ReactiveTextInputWidget(
                hint: "Last Name",
                controllerName: "lastName",
                prefixIcon: Icons.person,
              ),
            ),
          ],
        ),
        const Gap(20),
        ReactiveDatePickerWidget(controlName: "dateOfBirth"),
        const Gap(20),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Gender",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.teal[700],
            ),
          ),
        ),
        const Gap(10),
        Row(
          children: const [
            Expanded(
              child: ReactivRadioListTileGender(
                controlName: 'gender',
                gender: GenderEntity.male,
                label: 'Male',
              ),
            ),
            Gap(10),
            Expanded(
              child: ReactivRadioListTileGender(
                controlName: 'gender',
                gender: GenderEntity.female,
                label: 'Female',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
