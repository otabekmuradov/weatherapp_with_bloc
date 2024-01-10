import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_with_bloc/bloc/weather_bloc_bloc.dart';
import 'package:weatherapp_with_bloc/screens/second_screen.dart';

class HourlyWidget extends StatefulWidget {
  const HourlyWidget({super.key});

  @override
  State<HourlyWidget> createState() => _HourlyWidgetState();
}

class _HourlyWidgetState extends State<HourlyWidget> {
  Widget getWeatherIcon(int code) {
    switch (code) {
      case > 200 && <= 300:
        return Image.asset(
          'assets/1.png',
          height: 45,
          width: 45,
        );
      case >= 300 && < 400:
        return Image.asset(
          'assets/2.png',
          height: 45,
          width: 45,
        );
      case >= 500 && < 600:
        return Image.asset(
          'assets/3.png',
          height: 45,
          width: 45,
        );
      case >= 600 && < 700:
        return Image.asset(
          'assets/4.png',
          height: 45,
          width: 45,
        );
      case >= 700 && < 800:
        return Image.asset(
          'assets/5.png',
          height: 45,
          width: 45,
        );
      case == 800:
        return Image.asset(
          'assets/6.png',
          height: 45,
          width: 45,
        );
      case > 800 && <= 804:
        return Image.asset(
          'assets/7.png',
          height: 45,
          width: 45,
        );
      default:
        return Image.asset(
          'assets/7.png',
          height: 45,
          width: 45,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherBlocState>(
      builder: (context, state) {
        if (state is WeatherBlocSucces) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Today',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const SevenDayScreen(),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Next 7 Days',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Iconify(
                                Ic.round_arrow_right,
                                size: 35,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SizedBox(
                  height: 145,
                  width: double.infinity,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 20, left: 25),
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          height: 70,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '${state.fiveDayWeatherByLocation[index].temperature?.celsius?.round()}°',
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              getWeatherIcon(state.fiveDayWeatherByLocation[index].weatherConditionCode!),
                              Text(
                                DateFormat('').add_jm().format(
                                    state.fiveDayWeatherByLocation[index].date!),
                                style: GoogleFonts.poppins(
                                    color: const Color.fromARGB(
                                        255, 177, 177, 211),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
