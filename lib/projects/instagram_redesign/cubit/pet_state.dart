part of 'pet_cubit.dart';

@immutable
abstract class PetState {
  const PetState(this.message);
  final String message;
}

class PetInitial extends PetState {
  const PetInitial(String message) : super(message);
}

class PetSuccess extends PetState {
  const PetSuccess(String message, this.token) : super(message);
  final String token;
}

class PetFailed extends PetState {
  const PetFailed(String message) : super(message);

}

class PetLoading extends PetState {
  const PetLoading(String message) : super(message);
}
