import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import 'cubit/statistics_cubit.dart';
import 'cubit/statistics_state.dart';

class StatisticsPage extends StatelessWidget {
  StatisticsPage({super.key});

  final StatisticsCubit cubit = StatisticsCubit();

  @override
  Widget build(BuildContext context) {
    cubit.readStatistics();
    return Scaffold(
      appBar: AppBar(
        title: Text('Статистика'),
      ),
      body: Center(
        child: BlocBuilder<StatisticsCubit, StatisticsState>(
          bloc: cubit,
          builder: (context, state) {
            return state.statistics.isNotEmpty
                ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: Device.orientation == Orientation.landscape ? MediaQuery.of(context).size.width / 3 : double.infinity,
                    child: ListView.builder(
                        itemCount: state.statistics.length,
                        itemBuilder: (context, index) => Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text('Начало: ${DateFormat('dd.MM.yyyy HH:mm:ss').format(state.statistics[index].start)}'),
                                const SizedBox(height: 8),
                                Text(
                                    'Окончание: ${DateFormat('dd.MM.yyyy HH:mm:ss').format(state.statistics[index].stop)}'),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ),
                )
                : Center(child: Text('Отсутствует'));
          },
        ),
      ),
    );
  }
}
