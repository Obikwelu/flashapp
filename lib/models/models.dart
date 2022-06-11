class Flash {
  String? name;
  int? runtime;

  ModelImage? image;
  String? summary;
  Embedded? eEmbedded;

  Flash({
    this.name,
    this.runtime,
    this.image,
    this.summary,
    this.eEmbedded,
  });

  Flash.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    runtime = json['runtime'];
    image = json['image'] != null ? ModelImage.fromJson(json['image']) : null;
    summary = json['summary'];
    eEmbedded =
        json['_embedded'] != null ? Embedded.fromJson(json['_embedded']) : null;
  }
}

class ModelImage {
  String? medium;
  String? original;

  ModelImage({this.medium, this.original});

  ModelImage.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    original = json['original'];
  }
}

class Embedded {
  List<Episodes>? episodes;

  Embedded({this.episodes});

  Embedded.fromJson(Map<String, dynamic> json) {
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(Episodes.fromJson(v));
      });
    }
  }
}

class Episodes {
  String? name;
  int? season;
  int? number;
  int? runtime;
  ModelImage? image;
  String? summary;

  Episodes({
    this.name,
    this.season,
    this.number,
    this.runtime,
    this.image,
    this.summary,
  });

  Episodes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    season = json["season"];
    number = json['number'];
    runtime = json['runtime'];
    image = json['image'] != null ? ModelImage.fromJson(json['image']) : null;
    summary = json['summary'];
  }
}
