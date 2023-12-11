import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:social_media_app/generated/l10n.dart';
import 'package:social_media_app/presentation/blocs/qr/qr_bloc.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => QrBloc(),
        child: BlocConsumer<QrBloc, QrState>(
          listener: (context, state) {
            if (state is QrError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(S.of(context).somethingWentWrong)),
              );
            }
          },
          builder: (context, state) {
            if (state is QrLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is QrSuccess) {
              return _buildResultView(context, state.result);
            } else {
              return _buildQrView(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildResultView(BuildContext context, Barcode result) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Data: ${result.code}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              _showCopyContextMenu(context, result.code ?? '');
            },
            child: Text(
              S.of(context).copyLink,
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;

    return QRView(
      key: GlobalKey(debugLabel: S.of(context).qr),
      onQRViewCreated: (controller) {
        controller.scannedDataStream.listen((scanData) {
          context.read<QrBloc>().add(QrRequested(scanData));
        });
      },
      overlay: QrScannerOverlayShape(
        borderColor: Colors.black,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _showCopyContextMenu(BuildContext context, String data) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied: $data'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).noPermission),
        ),
      );
    }
  }
}
