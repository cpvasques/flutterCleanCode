// Flutter Packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// Core
import 'package:flutter_clean_code/core/error/error_handler.dart';
import 'package:flutter_clean_code/features/dashboard/domain/usecases/dashboard_usecase.dart';

// Bloc
import 'dashboard_event.dart';
import 'dashboard_state.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardUseCase dashboardUseCase;

  DashboardBloc({required this.dashboardUseCase})
      : super(const DashboardState()) {
    on<FetchSectionsEvent>(onFetchSections);
    on<ErrorDisplayed>((event, emit) => emit(state.copyWith(isError: false)));
  }

  Future<void> onFetchSections(
      FetchSectionsEvent event, Emitter<DashboardState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      final sections = await dashboardUseCase.loadSections(
        event.isOriginal,
        event.products,
      );

      emit(
        state.copyWith(
          isSuccess: true,
          isLoading: false,
          sections: sections,
        ),
      );
    } on RepositoryException catch (e) {
      emit(
        state.copyWith(
          isError: true,
          isLoading: false,
          errorMessage: e.message,
          sections: [],
        ),
      );
    }
  }
}
