part of 'weather_bloc_bloc.dart';

class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

final class WeatherBlocInitial extends WeatherBlocState {}

final class WeatherBlocLoading extends WeatherBlocState {}

final class WeatherBlocFailure extends WeatherBlocState {}

final class WeatherBlocSucces extends WeatherBlocState {
  final Weather weatherByLocation;
  final Weather weatherByCityName;
  final List<Weather> fiveDayWeatherByCityName;
  final List<Weather> fiveDayWeatherByLocation;
  final WeatherForecast fetchWeatherSevenDaysByLoc;
  final WeatherForecast fetchWeatherSevenDaysByName;

  const WeatherBlocSucces(this.weatherByLocation, this.weatherByCityName,
      this.fiveDayWeatherByCityName, this.fiveDayWeatherByLocation,this.fetchWeatherSevenDaysByLoc,this.fetchWeatherSevenDaysByName);

  @override
  List<Object> get props => [
        weatherByLocation,
        weatherByCityName,
        fiveDayWeatherByCityName,
        fiveDayWeatherByLocation
      ];
}
