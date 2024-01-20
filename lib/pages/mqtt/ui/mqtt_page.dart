import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/pages/mqtt/bloc/mqtt_bloc.dart';
import 'package:movie_app/theme/colors.dart';

class MQTTPage extends StatefulWidget {
  final MovieModel movie;
  const MQTTPage({super.key, required this.movie});

  @override
  State<MQTTPage> createState() => _MQTTPageState();
}

class _MQTTPageState extends State<MQTTPage> {
  late MqttBloc mqttBloc;

  @override
  void initState() {
    super.initState();
    // Initialize the MQTT BLoC or retrieve it from the context if it's already provided
    mqttBloc = context.read<MqttBloc>();
    // Dispatch a connect event to the BLoC to start the MQTT connection
    mqttBloc.add(MqttConnectEvent());
  }

  @override
  void dispose() {
    // Dispatch a disconnect event when the widget is disposed
    mqttBloc.add(MqttDisconnectEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            toolbarHeight: 80,
            title: const Text(
              "MQTT",
              style: TextStyle(
                color: Color(0xFF202C43),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
            backgroundColor: kAppBarBackgroundColor,
            leading: IconButton(
              onPressed: () {
                context.go('/seatSelect', extra: widget.movie);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          )),
      body: BlocConsumer<MqttBloc, MqttState>(
        listener: (context, state) {
          // Handle state changes if needed, show dialogs, etc.
        },
        builder: (context, state) {
          if (state is MqttConnectedState) {
            return const Center(child: Text('Connected to MQTT broker'));
          } else if (state is MqttUpdatedState) {
            return Center(child: Text('Received message: ${state.message}'));
          } else if (state is MqttDisconnectedState) {
            return const Center(child: Text('Disconnected from MQTT broker'));
          } else {
            return const Center(child: Text('MQTT'));
          }
        },
      ),
    );
  }
}
