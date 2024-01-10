import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp_with_bloc/bloc/weather_bloc_bloc.dart';
import 'package:weatherapp_with_bloc/widgets/card_widget.dart';
import 'package:weatherapp_with_bloc/widgets/detail_card_widget.dart';
import 'package:weatherapp_with_bloc/widgets/hourly_widget.dart';

//openweathermapAPIkey: 1369dd6b5ae78fc9952261ab9aa236b4

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool positive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.white,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.light,
            systemNavigationBarDividerColor: Colors.white),
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            Icons.sort_outlined,
            size: 30,
            color: Colors.black,
          ),
        ),
        title: BlocBuilder<WeatherBloc, WeatherBlocState>(
          builder: (context, state) {
            if (state is WeatherBlocSucces) {
              return Text(
                '${state.weatherByLocation.areaName}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              );
            } else {
              return const Text('');
            }
          },
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CustomAnimatedToggleSwitch<bool>(
                current: positive,
                values: const [true, false],
                spacing: 10.0,
                indicatorSize: const Size.square(31.0),
                animationDuration: const Duration(milliseconds: 450),
                animationCurve: Curves.linear,
                onChanged: (b) => setState(() => positive = b),
                iconBuilder: (context, local, global) {
                  return const SizedBox();
                },
                cursors:
                    const ToggleCursors(defaultCursor: SystemMouseCursors.wait),
                onTap: (_) => setState(() => positive = !positive),
                iconsTappable: false,
                wrapperBuilder: (context, global, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      //bu inactive back color
                      Positioned(
                          left: 10.0,
                          right: 10.0,
                          height: 25.0,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color.lerp(Colors.black26,
                                  Colors.purpleAccent, global.position),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50.0)),
                            ),
                          )),
                      child,
                    ],
                  );
                },
                foregroundIndicatorBuilder: (context, global) {
                  return SizedBox.fromSize(
                    size: global.indicatorSize,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color.lerp(
                            Colors.white, Colors.white, global.position),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50.0)),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            spreadRadius: 0.05,
                            blurRadius: 1.1,
                            offset: Offset(0.0, 0.8),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherBlocState>(
        builder: (context, state) {
          if (state is WeatherBlocSucces) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 600,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0, 1),
                          child: Container(
                            height: 200,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: 300,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurStyle: BlurStyle.normal,
                                  blurRadius: 20,
                                  color: Color.fromARGB(195, 229, 199, 235),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const CardWidget(),
                        Align(
                          alignment: const AlignmentDirectional(0, 2.9),
                          child: Container(
                            height: 300,
                            width: double.infinity,
                            color: const Color.fromARGB(186, 236, 235, 241),
                          ),
                        ),
                         const Align(
                          alignment: AlignmentDirectional(0, 1.25),
                          child: DetailedCardWidget(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const HourlyWidget(),
                ],
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
