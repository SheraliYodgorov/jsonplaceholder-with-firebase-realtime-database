

class Org {
  int? legalForm;
  String? name;
  String? slugName;
  Org? category;
  Org? subs;
  String? logo;
  dynamic background;
  bool? isOfficial;
  Rating? rating;

  Org(this.legalForm, this.name, this.slugName, this.category, this.subs,
      this.logo, this.background, this.isOfficial);

  Org.fromJson(Map<String, dynamic> json)
      : legalForm = json['legalForm'],
        name = json['name'],
        category = json['category'],
        slugName = json['slugName'],
        logo = json['logo'],
        background = json['background'],
        isOfficial = json['isOfficial'];

  Map<String, dynamic> toJson() => {
        "legalForm": legalForm,
        "name": name,
        "category": category,
        "slugName": slugName,
        "logo": logo,
        "background": background,
        "isOfficial": isOfficial,
      };
}

class Subs {
  int? me;
  bool? subscribed;

  Subs(this.me, this.subscribed);

  Subs.fromJson(Map<String, dynamic> json)
      : me = json['me'],
        subscribed = json['subscribed'];

  Map<String, dynamic> toJson() => {
        "me": me,
        "subscribed": subscribed,
      };
}

class Rating {
  Professional? professional;
  Professional? ethics;
  Professional? aesthetics;

  Rating(this.professional, this.ethics, this.aesthetics);

  Rating.fromJson(Map<String, dynamic> json)
      : professional = json['professional'],
        ethics = json['ethics'],
        aesthetics = json['aesthetics'];

  Map<String, dynamic> toJson() => {
        "professional": professional,
        "ethics": ethics,
        "aesthetics": aesthetics,
      };
}

class Professional {
  int? level;
  int? remainingScore;
  double? score;

  Professional(this.level, this.remainingScore, this.score);

  Professional.fromJson(Map<String, dynamic> json)
      : level = json['level'],
        remainingScore = json['remainingScore'],
        score = json['score'];

  Map<String, dynamic> toJson() => {
        "level": level,
        "remainingScore": remainingScore,
        "score": score,
      };
}
