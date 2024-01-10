import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:iconify_flutter/icons/wi.dart';

import 'package:weatherapp_with_bloc/bloc/weather_bloc_bloc.dart';

class DetailedCardWidget extends StatefulWidget {
  const DetailedCardWidget({super.key});

  @override
  State<DetailedCardWidget> createState() => _DetailedCardWidgetState();
}
  
class _DetailedCardWidgetState extends State<DetailedCardWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherBlocState>(
      builder: (context, state) {
        if (state is WeatherBlocSucces) {
          return Container(
            height: 130,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      FontAwesomeIcons.wind,
                      color: Color(0xfff754bfe),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '${state.weatherByLocation.windSpeed!.round()}km/h',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Wind',
                      style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 177, 177, 211),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Iconify(
                        Wi.humidity,
                        size: 38,
                        color: Color(0xfff754bfe),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${state.weatherByLocation.humidity!.round()}%',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Humidity',
                        style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 177, 177, 211),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Iconify(
                        Uil.eye,
                        size: 34,
                        color: Color(0xfff754bfe),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '10km',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Visibility',
                        style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 177, 177, 211),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
