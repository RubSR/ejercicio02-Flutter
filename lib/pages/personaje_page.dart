import 'package:ejercicio02/models/personaje.dart';
import 'package:flutter/material.dart';


class PersonajePage extends StatelessWidget {
  //Como cargo toda la informacion del personaje?
  //1.Que el padre envie el objeto Personaje ->>>>>>>> Porque ya tenemos los datos y ahorramo
  // una llamada a la api -> gasta menos datos
  //2.Volver a llamar a la api pasando el id del personaje

  final Personaje personaje;
  const PersonajePage({Key? key, required this.personaje}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informacion'),
      ),
      body: Center(
        child:Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Image(image: NetworkImage(personaje.image!),

              ),
              Text(personaje.name!),
              Text(personaje.firstEpisode!),
              // ?? comprueba si es null - si lo es devuelve lo que esta despues si no
              // devuelve el valor de la variable
              Text(personaje.occupation ?? '' ),
              Text(personaje.voicedBy ?? '')
            ],
          ),
        ),
      ),
    );
  }
}
