import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../animation/animated_text_color.dart';
import '../animation/gradient_text_animation.dart';
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
  int tick = 0;

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
          tick: tick,
          child: BlocProvider<AppBloc>(
            create: (context) => AppBloc(
              changeStatus: (value) => setState(() => vpnStatus = value),
              changeTick: (value) => setState(() => tick = value),
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
  @override
  Widget build(BuildContext context) {
    VPNStatus? status = VPNStatusModel.statusOf(context);
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
                  GradientTextAnimation(text: 'Подключение'),
                  //AnimatedTextColor(text: 'Подключение'),
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
            Text('Подключен к VPN: ${DateFormat('HH:mm:ss').format(
              DateTime(0, 0, 0, 0, 0, VPNStatusModel.tickOf(context)),
            )}'),
        ],
      ),
    );
  }
}
