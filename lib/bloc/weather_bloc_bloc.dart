import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import 'package:weatherapp_with_bloc/api/weather_api.dart';
import 'package:weatherapp_with_bloc/data/weather_data.dart';
import 'package:weatherapp_with_bloc/models/weather_model.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>(
      (event, emit) async {
        emit(WeatherBlocLoading());
        try {
          WeatherFactory wf = WeatherFactory(
            API_KEY,
            language: Language.ENGLISH,
          );

          Weather weatherByLocation = await wf.currentWeatherByLocation(
            event.position.latitude,
            event.position.longitude,
          );
       

          Weather weatherByCityName =
              await wf.currentWeatherByCityName('Toshkent');
   

          List<Weather> fiveDayWeatherByCityName =
              await wf.fiveDayForecastByCityName('Toshkent');

          List<Weather> fiveDayWeatherByLocation =
              await wf.fiveDayForecastByLocation(
            event.position.latitude,
            event.position.longitude,
          );
          WeatherApi weatherFore = WeatherApi();

          WeatherForecast sevenDayWeatherByLoc =
              await weatherFore.fetchWeatherForecast(isCity: false);

          WeatherForecast sevenDayWeatherByName =
              await weatherFore.fetchWeatherForecast();
    

          emit(
            WeatherBlocSucces(
              weatherByLocation,
              weatherByCityName,
              fiveDayWeatherByCityName,
              fiveDayWeatherByLocation,
              sevenDayWeatherByLoc,
              sevenDayWeatherByName,
            ),
          );
        } catch (e) {
          emit(WeatherBlocFailure());
        }
      },
    );
  }
}
