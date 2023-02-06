import 'package:dummy_api/features/core/data/local/hive_database.dart';
import 'package:dummy_api/features/core/data/local/sqflite_database.dart';
import 'package:dummy_api/features/initialization/cubit/initialization_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Injectable(order: -1)
class InitializationCubit extends Cubit<InitializationState> {
  final SqfLiteDatabase database;

  InitializationCubit(this.database) : super(Uninitialized());

  Future<void> initialize() async {
    await database.init();
    await HiveDatabase.init();
    emit(Initialized());
  }
}
