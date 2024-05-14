// Flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Core
import 'package:flutter_clean_code/core/presentation/base_state.dart';
import 'package:flutter_clean_code/core/templates/app_scaffold.dart';
import 'package:flutter_clean_code/core/di/injection.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

// Features (Domain, Data, Presentation)
import 'package:flutter_clean_code/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter_clean_code/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:flutter_clean_code/features/dashboard/presentation/bloc/dashboard_state.dart';

// Widgets

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends BaseState<DashboardPage> {
  late DashboardBloc _dashboardBloc;

  @override
  void initState() {
    super.initState();
    _dashboardBloc = getIt<DashboardBloc>();
    _dashboardBloc.add(FetchSectionsEvent(isOriginal: true));
  }

  @override
  void dispose() {
    _dashboardBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Localization.of(context);

    return BlocProvider(
      create: (context) => _dashboardBloc,
      child: AppScaffold(
        title: 'Dashboard',
        body: BlocListener<DashboardBloc, DashboardState>(
          listener: (context, state) {
            if (state.isLoading) {
              showLoader();
            } else {
              hideLoader();
            }

            if (state.isError) {
              showError(message: state.errorMessage);
              BlocProvider.of<DashboardBloc>(context).add(ErrorDisplayed());
            }
          },
          child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              return Text(l10n!.hello);
            },
          ),
        ),
      ),
    );
  }
}
