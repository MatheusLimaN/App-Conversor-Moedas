import 'package:conversor_moedas/app/controllers/home.controller.dart';
import 'package:conversor_moedas/app/views/components/currencyBox.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 20),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 150,
                height: 150,
              ),
              CurrencyBox(
                  selectedItem: homeController.toCurrency,
                  items: homeController.currencies,
                  controller: toText,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model;
                    });
                  }),
              SizedBox(height: 20),
              CurrencyBox(
                  selectedItem: homeController.fromCurrency,
                  items: homeController.currencies,
                  controller: fromText,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model;
                    });
                  }),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    homeController.convert();
                  },
                  child: Text('Converter'),
                  style: ElevatedButton.styleFrom(primary: Colors.amber))
            ],
          ),
        ),
      ),
    );
  }
}
