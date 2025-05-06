import 'package:equatable/equatable.dart';

class SaleInfo extends Equatable {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final String? amount;
  final String? buyLink;

  const SaleInfo(
      {this.buyLink,
      this.amount,
      this.country,
      this.saleability,
      this.isEbook});

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json['country'] as String?,
        saleability: json['saleability'] as String?,
        amount: json['saleability'] == "FOR_SALE"
            ? json['listPrice']['amount'].toString()
            : "",
        isEbook: json['isEbook'] as bool?,
        buyLink: json['buyLink'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'country': country,
        'saleability': saleability,
        'amount': amount,
        'isEbook': isEbook,
        'buyLink': buyLink,
      };

  @override
  List<Object?> get props => [buyLink, country, saleability, isEbook, amount];
}
