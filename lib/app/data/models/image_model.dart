import 'dart:convert';

// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    required this.feed,
  });

  Feed feed;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        feed: Feed.fromJson(json["feed"]),
      );

  Map<String, dynamic> toJson() => {
        "feed": feed.toJson(),
      };
}

class Feed {
  Feed({
    required this.author,
    required this.entry,
    required this.updated,
    required this.rights,
    required this.title,
    required this.icon,
    required this.link,
    required this.id,
  });

  Author author;
  List<Entry> entry;
  Icon updated;
  Icon rights;
  Icon title;
  Icon icon;
  List<Link> link;
  Icon id;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        author: Author.fromJson(json["author"]),
        entry: List<Entry>.from(json["entry"].map((x) => Entry.fromJson(x))),
        updated: Icon.fromJson(json["updated"]),
        rights: Icon.fromJson(json["rights"]),
        title: Icon.fromJson(json["title"]),
        icon: Icon.fromJson(json["icon"]),
        link: List<Link>.from(json["link"].map((x) => Link.fromJson(x))),
        id: Icon.fromJson(json["id"]),
      );

  Map<String, dynamic> toJson() => {
        "author": author.toJson(),
        "entry": List<dynamic>.from(entry.map((x) => x.toJson())),
        "updated": updated.toJson(),
        "rights": rights.toJson(),
        "title": title.toJson(),
        "icon": icon.toJson(),
        "link": List<dynamic>.from(link.map((x) => x.toJson())),
        "id": id.toJson(),
      };
}

class Author {
  Author({
    required this.name,
    required this.uri,
  });

  Icon name;
  Icon uri;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: Icon.fromJson(json["name"]),
        uri: Icon.fromJson(json["uri"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "uri": uri.toJson(),
      };
}

class Icon {
  Icon({
    required this.label,
  });

  String label;

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
      };
}

class Entry {
  Entry({
    required this.imName,
    required this.imImage,
    required this.imItemCount,
    required this.imPrice,
    required this.imContentType,
    required this.rights,
    required this.title,
    required this.link,
    required this.id,
    required this.imArtist,
    required this.category,
    required this.imReleaseDate,
  });

  Icon imName;
  List<ImImage> imImage;
  Icon imItemCount;
  ImPrice imPrice;
  EntryImContentType imContentType;
  Icon rights;
  Icon title;
  Link link;
  Id id;
  ImArtist imArtist;
  Category category;
  ImReleaseDate imReleaseDate;

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        imName: Icon.fromJson(json["im:name"]),
        imImage: List<ImImage>.from(
            json["im:image"].map((x) => ImImage.fromJson(x))),
        imItemCount: Icon.fromJson(json["im:itemCount"]),
        imPrice: ImPrice.fromJson(json["im:price"]),
        imContentType: EntryImContentType.fromJson(json["im:contentType"]),
        rights: Icon.fromJson(json["rights"]),
        title: Icon.fromJson(json["title"]),
        link: Link.fromJson(json["link"]),
        id: Id.fromJson(json["id"]),
        imArtist: ImArtist.fromJson(json["im:artist"]),
        category: Category.fromJson(json["category"]),
        imReleaseDate: ImReleaseDate.fromJson(json["im:releaseDate"]),
      );

  Map<String, dynamic> toJson() => {
        "im:name": imName.toJson(),
        "im:image": List<dynamic>.from(imImage.map((x) => x.toJson())),
        "im:itemCount": imItemCount.toJson(),
        "im:price": imPrice.toJson(),
        "im:contentType": imContentType.toJson(),
        "rights": rights.toJson(),
        "title": title.toJson(),
        "link": link.toJson(),
        "id": id.toJson(),
        "im:artist": imArtist.toJson(),
        "category": category.toJson(),
        "im:releaseDate": imReleaseDate.toJson(),
      };
}

class Category {
  Category({
    required this.attributes,
  });

  CategoryAttributes attributes;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        attributes: CategoryAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "attributes": attributes.toJson(),
      };
}

class CategoryAttributes {
  CategoryAttributes({
    required this.imId,
    required this.term,
    required this.scheme,
    required this.label,
  });

  String imId;
  String term;
  String scheme;
  String label;

  factory CategoryAttributes.fromJson(Map<String, dynamic> json) =>
      CategoryAttributes(
        imId: json["im:id"],
        term: json["term"],
        scheme: json["scheme"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "im:id": imId,
        "term": term,
        "scheme": scheme,
        "label": label,
      };
}

class Id {
  Id({
    required this.label,
    required this.attributes,
  });

  String label;
  IdAttributes attributes;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        label: json["label"],
        attributes: IdAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "attributes": attributes.toJson(),
      };
}

class IdAttributes {
  IdAttributes({
    required this.imId,
  });

  String imId;

  factory IdAttributes.fromJson(Map<String, dynamic> json) => IdAttributes(
        imId: json["im:id"],
      );

  Map<String, dynamic> toJson() => {
        "im:id": imId,
      };
}

class ImArtist {
  ImArtist({
    required this.label,
    required this.attributes,
  });

  String label;
  ImArtistAttributes? attributes;

  factory ImArtist.fromJson(Map<String, dynamic> json) => ImArtist(
        label: json["label"],
        attributes: json["attributes"] == null
            ? null
            : ImArtistAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "attributes": attributes == null ? null : attributes?.toJson(),
      };
}

class ImArtistAttributes {
  ImArtistAttributes({
    required this.href,
  });

  String href;

  factory ImArtistAttributes.fromJson(Map<String, dynamic> json) =>
      ImArtistAttributes(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class EntryImContentType {
  EntryImContentType({
    required this.imContentType,
    required this.attributes,
  });

  ImContentTypeImContentType imContentType;
  ImContentTypeAttributes attributes;

  factory EntryImContentType.fromJson(Map<String, dynamic> json) =>
      EntryImContentType(
        imContentType:
            ImContentTypeImContentType.fromJson(json["im:contentType"]),
        attributes: ImContentTypeAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "im:contentType": imContentType.toJson(),
        "attributes": attributes.toJson(),
      };
}

class ImContentTypeAttributes {
  ImContentTypeAttributes({
    required this.term,
    required this.label,
  });

  Label? term;
  Label? label;

  factory ImContentTypeAttributes.fromJson(Map<String, dynamic> json) =>
      ImContentTypeAttributes(
        term: labelValues.map[json["term"]],
        label: labelValues.map[json["label"]],
      );

  Map<String, dynamic> toJson() => {
        "term": labelValues.reverse[term],
        "label": labelValues.reverse[label],
      };
}

enum Label { MUSIC, ALBUM }

final labelValues = EnumValues({"Album": Label.ALBUM, "Music": Label.MUSIC});

class ImContentTypeImContentType {
  ImContentTypeImContentType({
    required this.attributes,
  });

  ImContentTypeAttributes attributes;

  factory ImContentTypeImContentType.fromJson(Map<String, dynamic> json) =>
      ImContentTypeImContentType(
        attributes: ImContentTypeAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "attributes": attributes.toJson(),
      };
}

class ImImage {
  ImImage({
    required this.label,
    required this.attributes,
  });

  String label;
  ImImageAttributes attributes;

  factory ImImage.fromJson(Map<String, dynamic> json) => ImImage(
        label: json["label"],
        attributes: ImImageAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "attributes": attributes.toJson(),
      };
}

class ImImageAttributes {
  ImImageAttributes({
    required this.height,
  });

  String height;

  factory ImImageAttributes.fromJson(Map<String, dynamic> json) =>
      ImImageAttributes(
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
      };
}

class ImPrice {
  ImPrice({
    required this.label,
    required this.attributes,
  });

  String label;
  ImPriceAttributes attributes;

  factory ImPrice.fromJson(Map<String, dynamic> json) => ImPrice(
        label: json["label"],
        attributes: ImPriceAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "attributes": attributes.toJson(),
      };
}

class ImPriceAttributes {
  ImPriceAttributes({
    required this.amount,
    required this.currency,
  });

  String amount;
  Currency? currency;

  factory ImPriceAttributes.fromJson(Map<String, dynamic> json) =>
      ImPriceAttributes(
        amount: json["amount"],
        currency: currencyValues.map[json["currency"]],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currency": currencyValues.reverse[currency],
      };
}

enum Currency { INR }

final currencyValues = EnumValues({"INR": Currency.INR});

class ImReleaseDate {
  ImReleaseDate({
    required this.label,
    required this.attributes,
  });

  DateTime label;
  Icon attributes;

  factory ImReleaseDate.fromJson(Map<String, dynamic> json) => ImReleaseDate(
        label: DateTime.parse(json["label"]),
        attributes: Icon.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "label": label.toIso8601String(),
        "attributes": attributes.toJson(),
      };
}

class Link {
  Link({
    required this.attributes,
  });

  LinkAttributes attributes;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        attributes: LinkAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "attributes": attributes.toJson(),
      };
}

class LinkAttributes {
  LinkAttributes({
    required this.rel,
    required this.type,
    required this.href,
  });

  Rel? rel;
  Type? type;
  String href;

  factory LinkAttributes.fromJson(Map<String, dynamic> json) => LinkAttributes(
        rel: relValues.map[json["rel"]],
        type: json["type"] == null ? null : typeValues.map[json["type"]],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "rel": relValues.reverse[rel],
        "type": type == null ? null : typeValues.reverse[type],
        "href": href,
      };
}

enum Rel { ALTERNATE, SELF }

final relValues = EnumValues({"alternate": Rel.ALTERNATE, "self": Rel.SELF});

enum Type { TEXT_HTML }

final typeValues = EnumValues({"text/html": Type.TEXT_HTML});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) =>  MapEntry(v, k));
    }
    return reverseMap!;
  }
}
