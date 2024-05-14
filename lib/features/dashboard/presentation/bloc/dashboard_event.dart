import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchSectionsEvent extends DashboardEvent {
  final bool isOriginal;
  final String products;

  FetchSectionsEvent({this.isOriginal = false, this.products = ''});
}

class ErrorDisplayed extends DashboardEvent {}
