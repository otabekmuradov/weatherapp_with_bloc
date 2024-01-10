import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:weatherapp_with_bloc/bloc/weather_bloc_bloc.dart';
import 'package:weatherapp_with_bloc/widgets/second_screen_card_widget.dart';
import 'package:weatherapp_with_bloc/widgets/second_screen_detailed_widget.dart';
import 'package:weatherapp_with_bloc/widgets/second_screen_forecast_list.dart';

class SevenDayScreen extends StatefulWidget {
  const SevenDayScreen({super.key});

  @override
  State<SevenDayScreen> createState() => _SevenDayScreenState();
}

class _SevenDayScreenState extends State<SevenDayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.white,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.light,
            systemNavigationBarDividerColor: Colors.white),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Iconify(Ic.round_arrow_left),
          ),
        ),
        title: Text(
          'Next 7 Days',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: BlocBuilder<WeatherBloc, WeatherBlocState>(
        builder: (context, state) {
          if (state is WeatherBlocSucces) {
            return SingleChildScrollView(
              child: Column(
                children: [_weatherCard()],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

Widget _weatherCard() {
  return Stack(
    children: [
      Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: 300,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.normal,
                  blurRadius: 30,
                  color: Color.fromARGB(58, 218, 199, 235),
                )
              ],
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(172, 223, 176, 233),
                    Color.fromARGB(131, 229, 199, 235),
                    Color.fromARGB(38, 255, 255, 255),
                    Color.fromARGB(26, 236, 225, 252),
                    Color.fromARGB(0, 236, 225, 252),
                  ]),
            ),
          ),
          Container(
            height: 475,
            width: double.infinity,
            color: const Color.fromARGB(134, 236, 235, 241),
          ),
        ],
      ),
      const Column(
        children: [
          SecondScreenCardWidget(),
          SecondScreenDetailedWidget(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              height: 385,
              child: ForecastList(),
            ),
          )
        ],
      ),
    ],
  );
}
