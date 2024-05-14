import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class FetchSectionsEvent extends DashboardEvent {
  final bool isOriginal;
  final String products;

  const FetchSectionsEvent({this.isOriginal = false, this.products = ''});

  @override
  List<Object> get props => [isOriginal, products];
}

class ErrorDisplayed extends DashboardEvent {}
