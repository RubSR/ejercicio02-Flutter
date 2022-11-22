class Personaje {
  int? id;
  String? name;
  String? image;
  String? gender;
  String? hairColor;
  List<Relatives>? relatives;
  String? occupation;
  String? firstEpisode;
  String? voicedBy;
  String? url;
  String? wikiUrl;

  Personaje(
      {this.id,
        this.name,
        this.image,
        this.gender,
        this.hairColor,
        this.relatives,
        this.occupation,
        this.firstEpisode,
        this.voicedBy,
        this.url,
        this.wikiUrl});

  Personaje.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    gender = json['gender'];
    hairColor = json['hairColor'];
    if (json['relatives'] != null) {
      relatives = <Relatives>[];
      json['relatives'].forEach((v) {
        relatives!.add(new Relatives.fromJson(v));
      });
    }
    occupation = json['occupation'];
    firstEpisode = json['firstEpisode'];
    voicedBy = json['voicedBy'];
    url = json['url'];
    wikiUrl = json['wikiUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['gender'] = this.gender;
    data['hairColor'] = this.hairColor;
    if (this.relatives != null) {
      data['relatives'] = this.relatives!.map((v) => v.toJson()).toList();
    }
    data['occupation'] = this.occupation;
    data['firstEpisode'] = this.firstEpisode;
    data['voicedBy'] = this.voicedBy;
    data['url'] = this.url;
    data['wikiUrl'] = this.wikiUrl;
    return data;
  }
}

class Relatives {
  String? name;
  String? wikiUrl;
  String? relationship;
  String? url;

  Relatives({this.name, this.wikiUrl, this.relationship, this.url});

  Relatives.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    wikiUrl = json['wikiUrl'];
    relationship = json['relationship'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['wikiUrl'] = this.wikiUrl;
    data['relationship'] = this.relationship;
    data['url'] = this.url;
    return data;
  }
}
