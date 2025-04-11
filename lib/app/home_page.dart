import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../animation/animated_text_color.dart';
import '../animation/rotate_card.dart';
import '../statistics/statistics_page.dart';
import 'bloc/app_bloc.dart';
import 'di/Inherited_notifier_status.dart';

class BlocHomePage extends StatefulWidget {
  const BlocHomePage({super.key});

  @override
  State<BlocHomePage> createState() => _BlocHomePageState();
}

class _BlocHomePageState extends State<BlocHomePage> {
  VPNStatus vpnStatus = VPNStatus.stopped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FilledButton(
          onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => StatisticsPage()),
              ),
          child: Text('Статистика')),
      body: SafeArea(
        child: VPNStatusModel(
          status: vpnStatus,
          child: BlocProvider<AppBloc>(
            create: (context) => AppBloc(
              changeStatus: (value) => setState(() => vpnStatus = value),
            )..add(const AppEvent.initial()),
            child: BlocBuilder<AppBloc, AppState>(
              builder: (context, state) => state.maybeWhen(
                loading: () => const Center(child: CircularProgressIndicator()),
                success: () => _HomePage(
                  onStart: () => context.read<AppBloc>().add(AppEvent.start()),
                  onStop: () => context.read<AppBloc>().add(AppEvent.stop()),
                ),
                orElse: () => const Placeholder(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage({
    required this.onStart,
    required this.onStop,
  });

  final VoidCallback onStart;
  final VoidCallback onStop;

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  Timer? watch;
  bool animated = false;

  @override
  Widget build(BuildContext context) {
    VPNStatus? status = VPNStatusModel.statusOf(context);
    switch (status) {
      case VPNStatus.stopped:
        if (watch != null) watch!.cancel();
      case VPNStatus.connection:
      case VPNStatus.started:
        watch = Timer.periodic(Duration(seconds: 1), (time) => setState(() {}));
      case null:
        throw UnimplementedError();
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          switch (status!) {
            VPNStatus.stopped => SvgPicture.asset('assets/saturn.svg'),
            VPNStatus.connection => Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SvgPicture.asset('assets/saturn.svg'),
                  AnimatedTextColor(text: 'Подключение'),
                ],
              ),
            VPNStatus.started => RotateCard(
                frontCard: SvgPicture.asset('assets/saturn.svg'),
                backCard: SvgPicture.asset(
                  'assets/saturn.svg',
                  colorFilter: ColorFilter.mode(Colors.redAccent, BlendMode.srcIn),
                ),
              ),
          },
          switch (status) {
            VPNStatus.started => FilledButton(
                onPressed: widget.onStop,
                child: Text('Отключить'),
              ),
            VPNStatus.stopped => FilledButton(
                onPressed: () {
                  widget.onStart();
                  setState(() => animated = !animated);
                },
                child: Text('Подключиться'),
              ),
            VPNStatus.connection => FilledButton(
                onPressed: null,
                child: Text('Подключение'),
              ),
          },
          const SizedBox(height: 32),
          if (status == VPNStatus.started)
            Text('Подключен к VPN: ${DateFormat('HH:mm:ss').format(DateTime(0, 0, 0, 0, 0, watch!.tick))}'),
        ],
      ),
    );
  }
}
