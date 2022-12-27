import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPoliciesPage extends StatelessWidget {
  const PrivacyPoliciesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Políticas de Privacidad',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: 'https://vacunapp.netlify.app/',
      ),
    );
  }
}
