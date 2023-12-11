part of 'qr_bloc.dart';

abstract class QrEvent {}

class QrRequested extends QrEvent {
  final Barcode result;

  QrRequested(this.result);
}
