import 'package:equatable/equatable.dart';
import 'package:flutter_clean_code/features/dashboard/data/models/section_model.dart';

class DashboardState extends Equatable {
  final List<Section> sections;
  final String errorMessage;
  final bool isSuccess;
  final bool isError;
  final bool isLoading;

  const DashboardState({
    List<Section>? sections,
    this.errorMessage = '',
    this.isSuccess = false,
    this.isError = false,
    this.isLoading = false,
  }) : sections = sections ?? const [];

  DashboardState copyWith({
    List<Section>? sections,
    String? errorMessage,
    bool? isSuccess,
    bool? isError,
    bool? isLoading,
  }) {
    return DashboardState(
        sections: sections ?? this.sections,
        errorMessage: errorMessage ?? this.errorMessage,
        isSuccess: isSuccess ?? this.isSuccess,
        isError: isError ?? this.isError,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props =>
      [sections, errorMessage, isSuccess, isError, isLoading];
}
