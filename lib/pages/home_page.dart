import 'package:ejercicio02/pages/personaje_page.dart';
import 'package:ejercicio02/provider/personajes_provider.dart';
import 'package:flutter/material.dart';

import '../models/personaje.dart';


class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

 final  PersonajeService service = PersonajeService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personajes'),
      ),
      //En el body pintamos los personajes que vienen de la api
      body: FutureBuilder(
        future: service.getPersonajes(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Text('Error');
          }
          else if(snapshot.hasData){
            //Mostrar la lista de personajes
            //Guardarme las lista de personajes
            List<Personaje> personajes = snapshot.data!;
            return ListView.builder(
                itemCount: personajes.length,
                itemBuilder: (context, int i){
                  return ListTile(
                    onTap: (){
                      //Utilizo navigator.push
                      //porque no he creado las rutas en el main
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              PersonajePage(personaje:personajes[i] )));
                    },
                    title: Text(personajes[i].name!),
                  );
                }
            );
          }
          return CircularProgressIndicator();
        }
      ),
    );
  }
}
