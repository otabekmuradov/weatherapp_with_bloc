import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_with_bloc/bloc/weather_bloc_bloc.dart';

class ForecastList extends StatefulWidget {
  const ForecastList({super.key});

  @override
  State<ForecastList> createState() => _ForecastListState();
}

class _ForecastListState extends State<ForecastList> {
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
          return ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              var weatherList = DateTime.fromMillisecondsSinceEpoch(
                  state.fetchWeatherSevenDaysByLoc.list![index].dt! * 1000);
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('E').format(weatherList),
                      style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        getWeatherIcon(state.fetchWeatherSevenDaysByLoc
                            .list![index].weather![0].id!),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 5),
                          child: Text(
                            '${state.fetchWeatherSevenDaysByLoc.list?[index].weather?[0].main}',
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    Text(
                      '${state.fetchWeatherSevenDaysByLoc.list?[index].temp?.max.round()}/${state.fetchWeatherSevenDaysByLoc.list?[index].temp?.min.round()}',
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
