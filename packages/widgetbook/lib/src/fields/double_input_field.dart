import 'package:flutter/material.dart';

import 'field.dart';
import 'field_codec.dart';
import 'field_type.dart';

/// [Field] that builds [TextFormField] for [double] values.
class DoubleInputField extends Field<double> {
  DoubleInputField({
    required super.group,
    required super.name,
    super.initialValue = 0,
    super.onChanged,
  }) : super(
          type: FieldType.doubleSlider,
          codec: FieldCodec(
            toParam: (value) => value.toString(),
            toValue: (param) => double.tryParse(param ?? ''),
          ),
        );

  @override
  Widget toWidget(BuildContext context, double? value) {
    return TextFormField(
      initialValue: codec.toParam(value ?? initialValue ?? 0),
      keyboardType: TextInputType.number,
      onChanged: (value) => updateField(
        context,
        codec.toValue(value) ?? initialValue ?? 0,
      ),
    );
  }
}
