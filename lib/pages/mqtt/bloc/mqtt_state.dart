part of 'mqtt_bloc.dart';

@immutable
sealed class MqttState {}

final class MqttInitial extends MqttState {}

class MqttConnectedState extends MqttState {}

class MqttDisconnectedState extends MqttState {}

class MqttUpdatedState extends MqttState {
  final String topic;
  final String message;

  MqttUpdatedState({required this.topic, required this.message});
}
