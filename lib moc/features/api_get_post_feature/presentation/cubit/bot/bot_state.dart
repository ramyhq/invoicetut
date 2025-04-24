part of 'bot_cubit.dart';

abstract class BotState extends Equatable {
  const BotState();

  @override
  List<Object> get props => [];
}

class BotsInitial extends BotState {}
class BotsLoading extends BotState {}
class BotsFailure extends BotState {}
class BotsSuccess extends BotState {
  final String? msg;
  const BotsSuccess({this.msg = ''});
}
class BotsLoaded extends BotState {
  final List<BotEntity> bots;

  const BotsLoaded({required this.bots});

  @override
  List<Object> get props => [];
}
