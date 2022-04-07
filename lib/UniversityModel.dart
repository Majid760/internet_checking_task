class University {
  List<String>? webPages;
  String? name;
  String? stateProvince;
  List<String>? domains;
  String? alphaTwoCode;
  String? country;

  University({webPages, name, stateProvince, domains, alphaTwoCode, country});

  University.fromJson(Map<String, dynamic> json) {
    webPages = json['web_pages'].cast<String>();
    name = json['name'];
    stateProvince = json['state-province'];
    domains = json['domains'].cast<String>();
    alphaTwoCode = json['alpha_two_code'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['web_pages'] = webPages;
    data['name'] = name;
    data['state-province'] = stateProvince;
    data['domains'] = domains;
    data['alpha_two_code'] = alphaTwoCode;
    data['country'] = country;
    return data;
  }
}
