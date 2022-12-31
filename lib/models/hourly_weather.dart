class NextDaysWeather {
  double? lat;
  double? lon;

  NextDaysWeather({
    this.lat,
    this.lon,
  });
  NextDaysWeather.fromJson(Map<String, dynamic> json) {
    lat = json['lat']?.toDouble();
    lon = json['lon']?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    return data;
  }
}

class SomeRootEntityCity {
  int? id;
  String? name;
  NextDaysWeather? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  SomeRootEntityCity({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });
  SomeRootEntityCity.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    coord = (json['coord'] != null)
        ? NextDaysWeather.fromJson(json['coord'])
        : null;
    country = json['country']?.toString();
    population = json['population']?.toInt();
    timezone = json['timezone']?.toInt();
    sunrise = json['sunrise']?.toInt();
    sunset = json['sunset']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    data['country'] = country;
    data['population'] = population;
    data['timezone'] = timezone;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}

class SomeRootEntityListSys {
  String? pod;

  SomeRootEntityListSys({
    this.pod,
  });
  SomeRootEntityListSys.fromJson(Map<String, dynamic> json) {
    pod = json['pod']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['pod'] = pod;
    return data;
  }
}

class SomeRootEntityListWind {
  double? speed;
  int? deg;
  double? gust;

  SomeRootEntityListWind({
    this.speed,
    this.deg,
    this.gust,
  });
  SomeRootEntityListWind.fromJson(Map<String, dynamic> json) {
    speed = json['speed']?.toDouble();
    deg = json['deg']?.toInt();
    gust = json['gust']?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    return data;
  }
}

class SomeRootEntityListClouds {
  int? all;

  SomeRootEntityListClouds({
    this.all,
  });
  SomeRootEntityListClouds.fromJson(Map<String, dynamic> json) {
    all = json['all']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}

class SomeRootEntityListWeather {
  int? id;
  String? main;
  String? description;
  String? icon;

  SomeRootEntityListWeather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });
  SomeRootEntityListWeather.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    main = json['main']?.toString();
    description = json['description']?.toString();
    icon = json['icon']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

class SomeRootEntityListMain {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  double? tempKf;

  SomeRootEntityListMain({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });
  SomeRootEntityListMain.fromJson(Map<String, dynamic> json) {
    temp = json['temp']?.toDouble();
    feelsLike = json['feels_like']?.toDouble();
    tempMin = json['temp_min']?.toDouble();
    tempMax = json['temp_max']?.toDouble();
    pressure = json['pressure']?.toInt();
    seaLevel = json['sea_level']?.toInt();
    grndLevel = json['grnd_level']?.toInt();
    humidity = json['humidity']?.toInt();
    tempKf = json['temp_kf']?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    data['humidity'] = humidity;
    data['temp_kf'] = tempKf;
    return data;
  }
}

class SomeRootEntityList {
  int? dt;
  SomeRootEntityListMain? main;
  List<SomeRootEntityListWeather?>? weather;
  SomeRootEntityListClouds? clouds;
  SomeRootEntityListWind? wind;
  int? visibility;
  int? pop;
  SomeRootEntityListSys? sys;
  String? dtTxt;

  SomeRootEntityList({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.sys,
    this.dtTxt,
  });

  SomeRootEntityList.fromJson(Map<String, dynamic> json) {
    dt = json['dt']?.toInt();
    main = (json['main'] != null)
        ? SomeRootEntityListMain.fromJson(json['main'])
        : null;
    if (json['weather'] != null) {
      final v = json['weather'];
      final arr0 = <SomeRootEntityListWeather>[];
      v.forEach((v) {
        arr0.add(SomeRootEntityListWeather.fromJson(v));
      });
      weather = arr0;
    }
    clouds = (json['clouds'] != null)
        ? SomeRootEntityListClouds.fromJson(json['clouds'])
        : null;
    wind = (json['wind'] != null)
        ? SomeRootEntityListWind.fromJson(json['wind'])
        : null;
    visibility = json['visibility']?.toInt();
    pop = json['pop']?.toInt();
    sys = (json['sys'] != null)
        ? SomeRootEntityListSys.fromJson(json['sys'])
        : null;
    dtTxt = json['dt_txt']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['dt'] = dt;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    if (weather != null) {
      final v = weather;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['weather'] = arr0;
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    data['visibility'] = visibility;
    data['pop'] = pop;
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['dt_txt'] = dtTxt;
    return data;
  }
}

class ActualNextDaysWeather {
  String? cod;
  int? message;
  int? cnt;
  List<SomeRootEntityList?>? list;
  SomeRootEntityCity? city;

  ActualNextDaysWeather({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });
  ActualNextDaysWeather.fromJson(Map<String, dynamic> json) {
    cod = json['cod']?.toString();
    message = json['message']?.toInt();
    cnt = json['cnt']?.toInt();
    if (json['list'] != null) {
      final v = json['list'];
      final arr0 = <SomeRootEntityList>[];
      v.forEach((v) {
        arr0.add(SomeRootEntityList.fromJson(v));
      });
      list = arr0;
    }
    city = (json['city'] != null)
        ? SomeRootEntityCity.fromJson(json['city'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    if (list != null) {
      final v = list;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['list'] = arr0;
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}
