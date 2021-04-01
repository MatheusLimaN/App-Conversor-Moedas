import 'package:conversor_moedas/app/models/currency.model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<CurrencyModel> currencies;

  final TextEditingController toText;
  final TextEditingController fromText;

  CurrencyModel toCurrency;
  CurrencyModel fromCurrency;

  HomeController({this.toText, this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double result = 0;

    switch (fromCurrency.name) {
      case 'Real':
        result = value * toCurrency.real;
        break;
      case 'Dolar':
        result = value * toCurrency.dolar;
        break;
      case 'Euro':
        result = value * toCurrency.euro;
        break;
      case 'Bitcoin':
        result = value * toCurrency.bitcoin;
        break;
      default:
    }

    fromText.text = result.toStringAsFixed(2);
  }
}
