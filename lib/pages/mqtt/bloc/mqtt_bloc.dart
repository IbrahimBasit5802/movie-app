import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

part 'mqtt_event.dart';
part 'mqtt_state.dart';

class MqttBloc extends Bloc<MqttEvent, MqttState> {
  final MqttServerClient client =
      MqttServerClient.withPort('broker.emqx.io', 'flutter_client', 1883);
  MqttBloc() : super(MqttInitial()) {
    on<MqttConnectEvent>(mqttConnectEvent);
    on<MqttReceivedMessageEvent>(mqttReceivedMessageEvent);
    on<MqttDisconnectEvent>(mqttDisconnectEvent);
  }

  FutureOr<void> mqttConnectEvent(
      MqttConnectEvent event, Emitter<MqttState> emit) async {
    try {
      await client.connect();
      emit(MqttConnectedState());

      // The connection is established, now subscribe to a topic
      const String topic = 'movie/test'; // Change this to your specific topic
      client.subscribe(topic, MqttQos.atLeastOnce);

      client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> messages) {
        for (var message in messages) {
          final mqttMessage = message.payload as MqttPublishMessage;
          final payload = MqttPublishPayload.bytesToStringAsString(
              mqttMessage.payload.message);
          // Add a MqttReceivedMessageEvent to the BLoC when a message is received
          add(MqttReceivedMessageEvent(topic: message.topic, message: payload));
        }
      });
    } catch (e) {
      emit(MqttDisconnectedState());
      client.disconnect();
    }
  }

  FutureOr<void> mqttReceivedMessageEvent(
      MqttReceivedMessageEvent event, Emitter<MqttState> emit) {
    emit(MqttUpdatedState(topic: event.topic, message: event.message));
  }

  FutureOr<void> mqttDisconnectEvent(
      MqttDisconnectEvent event, Emitter<MqttState> emit) {
    client.disconnect();
    emit(MqttDisconnectedState());
  }
}
