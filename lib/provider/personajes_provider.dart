import 'dart:convert';

import 'package:ejercicio02/models/personaje.dart';
import 'package:http/http.dart';

class PersonajeService {
  
  
  Future<List<Personaje>> getPersonajes() async {
    
    Response res = await get(Uri.parse('https://bobsburgers-api.herokuapp.com/characters'));
    if(res.statusCode == 200){
      //Primero pasamos de json a  list dynamic
      List<dynamic> lista = json.decode(res.body);
      //Recorro la lista con un .map y paso cada elemento de la lista a Personaje
      List<Personaje> personajes =
          lista.map((item) => Personaje.fromJson(item)).toList();
      return personajes;
    }else{
      throw Exception('Fallo');
    }
    
    
  }
}