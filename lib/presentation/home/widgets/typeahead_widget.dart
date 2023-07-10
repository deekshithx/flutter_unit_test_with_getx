import 'dart:async';

import 'package:cryptop/infrastructure/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class TypeAheadWidget extends StatelessWidget {
  const TypeAheadWidget(
      {super.key,
      this.textController,
      this.onSearchClick,
      required this.suggestionsCallback,
      required this.onSuggestionSelected});
  final TextEditingController? textController;
  final void Function()? onSearchClick;
  final FutureOr<Iterable<String>> Function(String) suggestionsCallback;
  final void Function(String) onSuggestionSelected;

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      key: key,
      noItemsFoundBuilder: (context) => const SizedBox(),
      textFieldConfiguration: TextFieldConfiguration(
        controller: textController,
        decoration: InputDecoration(
          hintText: 'home_enter_currency'.tr,
          hintStyle: const TextStyle(color: AppColors.textGrey),
          filled: true,
          suffixIcon: IconButton(
            onPressed: onSearchClick,
            icon: const Icon(
              Icons.search,
              color: AppColors.black,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      suggestionsCallback: suggestionsCallback,
      itemBuilder: (context, suggestion) => ListTile(
        trailing: const Icon(
          Icons.search,
          size: 20,
        ),
        title: Text(suggestion.toString()),
      ),
      onSuggestionSelected: onSuggestionSelected,
    );
  }
}
