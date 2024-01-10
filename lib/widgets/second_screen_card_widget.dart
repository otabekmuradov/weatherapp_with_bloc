import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp_with_bloc/bloc/weather_bloc_bloc.dart';

class SecondScreenCardWidget extends StatefulWidget {
  const SecondScreenCardWidget({super.key});

  @override
  State<SecondScreenCardWidget> createState() => _SecondScreenCardWidgetState();
}

class _SecondScreenCardWidgetState extends State<SecondScreenCardWidget> {
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
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Container(
              height: 200,
              width: 450,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(103, 225, 0, 255),
                    Color.fromARGB(195, 214, 1, 252),
                    Color.fromARGB(255, 214, 1, 252),
                    Color.fromARGB(204, 214, 1, 252),
                    Color.fromARGB(183, 255, 255, 0),
                  ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  Container(
                    height: 200,
                    width: 150,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(45, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                    child: getWeatherIcon(state
                        .fetchWeatherSevenDaysByLoc.list![1].weather![0].id!),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          'Tomorrow',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${state.fetchWeatherSevenDaysByLoc.list?[1].temp?.max.round()}',
                            style: GoogleFonts.ubuntu(
                                color: Colors.white, fontSize: 90),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Text(
                              '/${state.fetchWeatherSevenDaysByLoc.list?[1].temp?.min.round()}°',
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 35),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          '${state.fetchWeatherSevenDaysByLoc.list?[1].weather?[0].main}',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 15),
                        ),
                      )
                    ],
                  )
                ],
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
