import 'package:flutter/cupertino.dart';

class ProfilePicture {

  Image showProfile(Map<String, dynamic> pet,BuildContext context,String size){

    try{
      return Image.network(pet["photos"][0][size],
       width: MediaQuery.of(context).size.width, 
       height: MediaQuery.of(context).size.width*1.1, 
       fit: BoxFit.fitWidth,);
    }
    catch(e){
      //print(photos["url"]);
      return Image.asset("assets/img/pets/no_img.jpg");
    }
  }
  String getDescription(Map<String, dynamic> pet)
  {
    if(pet["description"] == null){
      return "";
    }
    else{
      return pet["description"].toLowerCase();
    }
  }
}

