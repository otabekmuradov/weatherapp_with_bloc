import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp_with_bloc/bloc/weather_bloc_bloc.dart';
import 'package:intl/intl.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key});
  
  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  Widget getWeatherIcon(int code) {
    switch (code) {
      case > 200 && <= 300:
        return Image.asset(
          'assets/1.png',
          height: 260,
          width: 260,
        );
      case >= 300 && < 400:
        return Image.asset(
          'assets/2.png',
          height: 260,
          width: 260,
        );
      case >= 500 && < 600:
        return Image.asset(
          'assets/3.png',
          height: 260,
          width: 260,
        );
      case >= 600 && < 700:
        return Image.asset(
          'assets/4.png',
          height: 260,
          width: 260,
        );
      case >= 700 && < 800:
        return Image.asset(
          'assets/5.png',
          height: 260,
          width: 260,
        );
      case == 800:
        return Image.asset(
          'assets/6.png',
          height: 260,
          width: 260,
        );
      case > 800 && <= 804:
        return Image.asset(
          'assets/7.png',
          height: 260,
          width: 260,
        );
      default:
        return Image.asset(
          'assets/7.png',
          height: 260,
          width: 260,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherBlocState>(
      builder: (context, state) {
        if (state is WeatherBlocSucces) {
          return Center(
            child: SizedBox(
              height: 600,
              child: PageView.builder(
                onPageChanged: (index) {
                },
                controller:
                    PageController(initialPage: 1, viewportFraction: 0.8),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  var tomorrow = DateTime.fromMillisecondsSinceEpoch(
                      state.fetchWeatherSevenDaysByLoc.list![1].dt! * 1000);
                  var afterTomorrow = DateTime.fromMillisecondsSinceEpoch(
                      state.fetchWeatherSevenDaysByLoc.list![2].dt! * 1000);
                  return Padding(
                    padding: const EdgeInsets.only(
                        right: 15, left: 15, top: 150, bottom: 75),
                    child: Column(
                      children: [
                        Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.purpleAccent,
                            borderRadius: BorderRadius.circular(70),
                            gradient: const RadialGradient(colors: [
                              Color.fromARGB(255, 225, 0, 255),
                              Color.fromARGB(255, 214, 1, 252),
                              Color.fromARGB(255, 243, 243, 9),
                              Colors.white,
                            ], radius: 6.7, center: Alignment.topCenter),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0, -1.20),
                                child: Container(
                                  height: 50,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        239, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            index == 1
                                                ? Text(
                                                    'Now',
                                                    style: GoogleFonts.poppins(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 71, 71, 71),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                : index == 0
                                                    ? Text(
                                                        DateFormat('d MMMM').format(tomorrow),
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 71, 71, 71),
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      )
                                                    : Text(
                                                        DateFormat('d MMMM').format(afterTomorrow),
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 71, 71, 71),
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                            index == 1
                                                ? Text(
                                                    '',
                                                    style: GoogleFonts.poppins(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 71, 71, 71),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                : index == 0
                                                    ? Text(
                                                        DateFormat('EEEE').format(tomorrow),
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 71, 71, 71),
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      )
                                                    : Text(
                                                        DateFormat('EEEE').format(afterTomorrow),
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 71, 71, 71),
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                    padding: const EdgeInsets.only(bottom: 190),
                                    child: index == 0
                                        ? Text(
                                            '${state.fetchWeatherSevenDaysByLoc.list?[1].weather?[0].main}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 22,
                                              letterSpacing: 0.5,
                                            ),
                                          )
                                        : index == 1
                                            ? Text(
                                                '${state.weatherByLocation.weatherMain}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                  letterSpacing: 0.5,
                                                ),
                                              )
                                            : Text(
                                                '${state.fetchWeatherSevenDaysByLoc.list?[2].weather?[0].main}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                  letterSpacing: 0.5,
                                                ),
                                              )),
                              ),
                              Center(
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: index == 0
                                        ? Text(
                                            '${state.fetchWeatherSevenDaysByLoc.list?[1].temp?.max.round()}°',
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 145,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        : index == 1
                                            ? Text(
                                                '${state.weatherByCityName.temperature?.celsius?.round()}°',
                                                style: GoogleFonts.ubuntu(
                                                  fontSize: 145,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            : Text(
                                                '${state.fetchWeatherSevenDaysByLoc.list?[2].temp?.max.round()}°',
                                                style: GoogleFonts.ubuntu(
                                                  fontSize: 145,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )),
                              ),
                              Align(
                                alignment:
                                    const AlignmentDirectional(-1.4, 1.7),
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 70,
                                        spreadRadius: 30,
                                        color:
                                            Color.fromARGB(172, 255, 255, 255),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment:
                                    const AlignmentDirectional(-1.6, 0.8),
                                child: Container(
                                  height: 90,
                                  width: 90,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(0, 255, 235, 59),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 60,
                                        spreadRadius: 5,
                                        color:
                                            Color.fromARGB(101, 255, 235, 59),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1.4, 1.7),
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 70,
                                        spreadRadius: 30,
                                        color:
                                            Color.fromARGB(172, 255, 255, 255),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, 6.3),
                                child: index == 1
                                    ? getWeatherIcon(state.weatherByLocation
                                        .weatherConditionCode!)
                                    : index == 0
                                        ? getWeatherIcon(state
                                            .fetchWeatherSevenDaysByLoc
                                            .list![1]
                                            .weather![0]
                                            .id!)
                                        : getWeatherIcon(state
                                            .fetchWeatherSevenDaysByLoc
                                            .list![2]
                                            .weather![0]
                                            .id!),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
