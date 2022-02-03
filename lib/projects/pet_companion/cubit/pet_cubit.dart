// ignore_for_file: omit_local_variable_types

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/core/models/api.dart';


part 'pet_state.dart';

class PetCubit extends Cubit<PetState> {
  PetCubit() : super(const PetInitial(''));
  //final MoviesRepository _moviesRepository = MoviesRepository();

  Future<void> fetchPets(String type) async {
    try {
      emit(const PetLoading(''));

      final Tokens response = await getToken();

      emit(PetSuccessToken('', response.accessToken));

      final GetEntries entries = await getPets(response.accessToken,type);
      final List<Map<String,dynamic>> fields = 
        List<Map<String,dynamic>>.from(entries.animals);

      //print(fields);

      emit(PetSuccessfulGet('', fields)); 


    } catch (e) {
      emit(const PetFailed(''));
    }
  }
}
