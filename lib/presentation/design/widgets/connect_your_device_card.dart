import 'package:fitness_app/presentation/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectYourDeviceAppCard extends StatefulWidget {
  final EdgeInsets margin;
  const ConnectYourDeviceAppCard({
    Key? key,
    this.margin = const EdgeInsets.symmetric(horizontal: 24),
  }) : super(key: key);

  @override
  State<ConnectYourDeviceAppCard> createState() => _ConnectYourDeviceAppCardState();
}

class _ConnectYourDeviceAppCardState extends State<ConnectYourDeviceAppCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: 120,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Connect your device',
                style: GoogleFonts.sourceSansPro(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Bluetooth',
                style: GoogleFonts.dmSans(
                  color: CustomColors.textGray,
                ),
              ),
            ],
          ),
          SvgPicture.asset('assets/icons/watch.svg'),
        ],
      ),
    );
  }
}
