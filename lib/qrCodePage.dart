import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends StatelessWidget {
  final _qrCodeData;
  final TextStyle mainStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  final TextStyle subtitleStyle = TextStyle(
    fontSize: 12,
    fontStyle: FontStyle.italic,
  );

  QRCodePage(this._qrCodeData);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'This is your personal QR Code.',
            style: mainStyle,
          ),
          Text(
            'Let another helper scan this code to begin the exchange',
            style: subtitleStyle,
          ),
          QrImage(
            data: _qrCodeData,
            version: QrVersions.auto,
            size: 400.0,
          ),
        ],
      ),
    );
  }
}
