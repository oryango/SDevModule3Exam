import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      return "you can fill out an adoption application online on our official website.";
    }
    else{
      return pet["description"].toLowerCase();
    }
  }
  String getBreed(Map<String, dynamic> pet){
    String breed = "Breed: ";
    if(pet["breeds"]["unknown"]){

    }
    else{
      breed += pet["breeds"]["primary"];
      if(pet["breeds"]["secondary"] != null){
        breed += "-${pet["breeds"]["secondary"]}";
      }
      else if(pet["breeds"]["mixed"]){
        breed += "-Mixed";
      }
    }
    /*if(pet["breeds"] != null){
      if(pet["breeds"]["primary"] != null){
        breed += pet["breed"]["primary"];
      }
      else{
        breed = "Breed: Unkown";
      }
      if(pet["breeds"]["secondary"] != null){
        breed += "-"+pet["breed"]["secondary"];
      }
      else if(pet["breeds"]["mixed"] == true){
        breed += "-Mixed";
      }
    }
    else{
      breed +=  "Unkown";
    }*/
    

    String output = ("$breed").toLowerCase();
    return output;
  }
  List<dynamic> getInformation(Map<String,dynamic> pet){

    Map<String, String> sizeChr = {"small":"S","medium":"M","large":"L","xlarge":"XL"};
    var age = Text(pet["age"].toLowerCase());
    var gender = Icon((pet["gender"].toLowerCase()=="male") ? Icons.male_rounded : Icons.female_rounded);
    var size = Text(sizeChr[pet["size"].toLowerCase()].toString());
    var spayed = Icon((pet["attributes"]["spayed_neutered"]) ? Icons.check_circle : Icons.close_rounded);
    var trained = Icon((pet["attributes"]["house_trained"]) ? Icons.check_circle : Icons.close_rounded);
    
    var declawed;    
    if(pet["attributes"]["declawed"] == null){
      declawed = Icon(Icons.close_rounded);
    }
    else{
      declawed = Icon((pet["attributes"]["declawed"]) ? Icons.check_circle : Icons.close_rounded);
    }

    var spNeeds = Icon((pet["attributes"]["special_needs"]) ? Icons.check_circle : Icons.close_rounded);
    var shotsCurrent = Icon((pet["attributes"]["shots_current"]) ? Icons.check_circle : Icons.close_rounded);
    var goodChildren;    
    if(pet["environment"]["children"] == null){
      goodChildren = Icon(Icons.close_rounded);
    }
    else{
      goodChildren = Icon((pet["environment"]["children"]) ? Icons.check_circle : Icons.close_rounded);
    }
    var goodDog;    
    if(pet["environment"]["dogs"] == null){
      goodDog = Icon(Icons.close_rounded);
    }
    else{
      goodDog = Icon((pet["environment"]["dogs"]) ? Icons.check_circle : Icons.close_rounded);
    }
    var goodCat;    
    if(pet["environment"]["cats"] == null){
      goodCat = Icon(Icons.close_rounded);
    }
    else{
      goodCat = Icon((pet["environment"]["cats"]) ? Icons.check_circle : Icons.close_rounded);
    }

    List<dynamic> infoBlocks = List.generate(1, (index) => "age:");

    infoBlocks.add(age);
    infoBlocks.add("gender:");
    infoBlocks.add(gender);
    infoBlocks.add("size:");
    infoBlocks.add(size);
    infoBlocks.add("spayed/neutered:");
    infoBlocks.add(spayed);
    infoBlocks.add("house trained:");
    infoBlocks.add(trained);
    infoBlocks.add("declawed:");
    infoBlocks.add(trained);
    infoBlocks.add("special needs:");
    infoBlocks.add(spNeeds);
    infoBlocks.add("up to date shots:");
    infoBlocks.add(shotsCurrent);
    infoBlocks.add("good with children:");
    infoBlocks.add(goodChildren);
    infoBlocks.add("good with dogs:");
    infoBlocks.add(goodDog);
    infoBlocks.add("good with cats:");
    infoBlocks.add(goodCat);
    
    return infoBlocks;
  }
}
