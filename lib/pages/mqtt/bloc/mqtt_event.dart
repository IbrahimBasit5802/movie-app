part of 'mqtt_bloc.dart';

@immutable
sealed class MqttEvent {}

class MqttConnectEvent extends MqttEvent {}

class MqttDisconnectEvent extends MqttEvent {}

class MqttReceivedMessageEvent extends MqttEvent {
  final String topic;
  final String message;

  MqttReceivedMessageEvent({required this.topic, required this.message});
}
