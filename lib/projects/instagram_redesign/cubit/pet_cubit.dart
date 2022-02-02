import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/core/models/api.dart';


part 'pet_state.dart';

class PetCubit extends Cubit<PetState> {
  PetCubit() : super(const PetInitial(''));
  //final MoviesRepository _moviesRepository = MoviesRepository();

  Future<void> fetchPets() async {
    try {
      emit(const PetLoading(''));

      Tokens response = await getToken();

      emit(PetSuccessToken('', response.accessToken));

      GetEntries entries = await getPets(response.accessToken);
      emit(PetSuccessfulGet('', entries.animals)); 


    } catch (e) {
      print(e);
      emit(const PetFailed(''));
    }
  }
}
