part of 'pet_cubit.dart';

@immutable
abstract class PetState {
  const PetState(this.message);
  final String message;
}

class PetInitial extends PetState {
  const PetInitial(String message) : super(message);
}

class PetSuccessToken extends PetState {
  const PetSuccessToken(String message, this.token) : super(message);
  final String token;
}

class PetFailed extends PetState {
  const PetFailed(String message) : super(message);
}

class PetLoading extends PetState {
  const PetLoading(String message) : super(message);
}

class PetFetching extends PetState {
  const PetFetching(String message) : super(message);
}

class PetSuccessfulGet extends PetState {
  const PetSuccessfulGet(String message, this.entries) : super(message);
  final List<Map<String,dynamic>> entries;
}
