part of 'qr_bloc.dart';

abstract class QrState {}

class QrInitial extends QrState {}

class QrLoading extends QrState {}

class QrSuccess extends QrState {
  final Barcode result;

  QrSuccess(this.result);
}

class QrError extends QrState {}
