import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final List<Widget> items;

  SettingsItem({
    this.title,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.getFont(
            'Muli',
            textStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 25.0),
          ),
        ),
      ],
    );
  }
}
