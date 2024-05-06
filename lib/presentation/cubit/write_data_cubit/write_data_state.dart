abstract class WriteDataState {}

class WriteDataInitial extends WriteDataState {}

class WriteDataLoading extends WriteDataState {}

class WriteDataSuccess extends WriteDataState {}

class WriteDataFailure extends WriteDataState {
  final String message;
  WriteDataFailure({required this.message});
}
