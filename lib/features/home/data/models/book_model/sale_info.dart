import 'package:equatable/equatable.dart';

class SaleInfo extends Equatable {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final String? amount;

  const SaleInfo({this.amount, this.country, this.saleability, this.isEbook});

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json['country'] as String?,
        saleability: json['saleability'] as String?,
        amount: json['saleability'] == "FOR_SALE"
            ? json['listPrice']['amount'].toString()
            : "",
        isEbook: json['isEbook'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'country': country,
        'saleability': saleability,
        'amount': amount,
        'isEbook': isEbook,
      };

  @override
  List<Object?> get props => [country, saleability, isEbook, amount];
}
