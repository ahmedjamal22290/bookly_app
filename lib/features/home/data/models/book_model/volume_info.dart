import 'package:bookly_app/features/home/data/models/book_model/image_links.dart';
import 'package:equatable/equatable.dart';

import 'industry_identifier.dart';
import 'panelization_summary.dart';
import 'reading_modes.dart';

class VolumeInfo extends Equatable {
  final String? title;
  final String? subtitle;
  final List<String>? authors;
  final String? publishedDate;
  final List<IndustryIdentifier>? industryIdentifiers;
  final ReadingModes? readingModes;
  final String? printType;
  final List<String>? categories;
  final ImageLinks? imageLinks;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final PanelizationSummary? panelizationSummary;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;
  final String? pageCount;
  final String? averageRating;

  const VolumeInfo({
    this.averageRating,
    this.pageCount,
    this.imageLinks,
    this.title,
    this.subtitle,
    this.authors,
    this.publishedDate,
    this.industryIdentifiers,
    this.readingModes,
    this.printType,
    this.categories,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json['title'] as String?,
        subtitle: json['subtitle'] as String?,
        authors: (json['authors'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        publishedDate: json['publishedDate'] as String?,
        averageRating: json['averageRating'].toString(),
        pageCount: json['pageCount'].toString(),
        industryIdentifiers: (json['industryIdentifiers'] as List<dynamic>?)
            ?.map((e) => IndustryIdentifier.fromJson(e as Map<String, dynamic>))
            .toList(),
        readingModes: json['readingModes'] == null
            ? null
            : ReadingModes.fromJson(
                json['readingModes'] as Map<String, dynamic>),
        printType: json['printType'] as String?,
        categories: (json['categories'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        maturityRating: json['maturityRating'] as String?,
        allowAnonLogging: json['allowAnonLogging'] as bool?,
        contentVersion: json['contentVersion'] as String?,
        panelizationSummary: json['panelizationSummary'] == null
            ? null
            : PanelizationSummary.fromJson(
                json['panelizationSummary'] as Map<String, dynamic>),
        imageLinks: json['imageLinks'] == null
            ? null
            : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
        language: json['language'] as String?,
        previewLink: json['previewLink'] as String?,
        infoLink: json['infoLink'] as String?,
        canonicalVolumeLink: json['canonicalVolumeLink'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'subtitle': subtitle,
        'authors': authors,
        'publishedDate': publishedDate,
        'averageRating': averageRating,
        'industryIdentifiers':
            industryIdentifiers?.map((e) => e.toJson()).toList(),
        'readingModes': readingModes?.toJson(),
        'printType': printType,
        'categories': categories,
        'maturityRating': maturityRating,
        'allowAnonLogging': allowAnonLogging,
        'contentVersion': contentVersion,
        'pageCount': pageCount,
        'panelizationSummary': panelizationSummary?.toJson(),
        'imageLinks': imageLinks?.toJson(),
        'language': language,
        'previewLink': previewLink,
        'infoLink': infoLink,
        'canonicalVolumeLink': canonicalVolumeLink,
      };

  @override
  List<Object?> get props {
    return [
      title,
      subtitle,
      authors,
      publishedDate,
      industryIdentifiers,
      readingModes,
      printType,
      averageRating,
      categories,
      maturityRating,
      allowAnonLogging,
      contentVersion,
      panelizationSummary,
      language,
      pageCount,
      previewLink,
      imageLinks,
      infoLink,
      canonicalVolumeLink,
    ];
  }
}
