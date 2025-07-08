import 'package:app/core/presentation/widgets/reactive_checkbox_list_tile_apartment.dart';
import 'package:app/core/presentation/widgets/reactive_text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddressInfoStep extends StatelessWidget {
  const AddressInfoStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ReactiveTextInputWidget(
                hint: "City",
                controllerName: "city",
                prefixIcon: Icons.location_city,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ReactiveTextInputWidget(
                hint: "Street",
                controllerName: "street",
                prefixIcon: Icons.location_on,
              ),
            ),
          ],
        ),
        const Gap(20),
        Row(
          children: [
            Expanded(
              child: ReactiveTextInputWidget(
                hint: "Floor",
                controllerName: "floor",
                prefixIcon: Icons.apartment,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ReactiveTextInputWidget(
                hint: "Apartment",
                controllerName: "apartment",
                prefixIcon: Icons.apartment,
              ),
            ),
          ],
        ),
        const Gap(10),
        const ReactiveCheckboxApartment(
          controlName: "hasApartment",
          label: "Have Apartment?",
        ),
      ],
    );
  }
}
