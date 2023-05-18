import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:prova/components/content_container.dart';
import 'package:prova/components/content_info.dart';
import 'package:prova/components/layout.dart';
import 'package:prova/model/finance/finances_model.dart';
import 'package:prova/service/finance_service.dart';

class Currencies extends StatefulWidget {
  const Currencies({super.key});

  @override
  State<Currencies> createState() => _CurrenciesState();
}

class _CurrenciesState extends State<Currencies> {
  FinanceService service = FinanceService();
  FinancesModel financeData = FinancesModel.start();

  @override
  void initState() {
    super.initState();
    handleFinance();
  }

  void handleFinance() async {
    dynamic data = await service.getFinances();
    setState(() {
      financeData = data;
    });
  }

  handleNextPage() {
    Navigator.pushNamed(context, '/stocks', arguments: financeData);
  }

  @override
  Widget build(BuildContext context) {
    return Layout(pageTitle: 'MOEDAS', pageContent: [
      ContentContainer(
        leftContent: [
          ContentInfo(
              title: financeData.currencies?.dollar?.title,
              firstValue:
                  financeData.currencies?.dollar?.value.toStringAsFixed(4),
              variationValue:
                  financeData.currencies?.dollar?.variation.toStringAsFixed(4)),
          ContentInfo(
              title: financeData.currencies?.peso?.title,
              firstValue:
                  financeData.currencies?.peso?.value.toStringAsFixed(4),
              variationValue:
                  financeData.currencies?.peso?.variation.toStringAsFixed(4)),
        ],
        rightContent: [
          ContentInfo(
              title: financeData.currencies?.euro?.title,
              firstValue:
                  financeData.currencies?.euro?.value.toStringAsFixed(4),
              variationValue:
                  financeData.currencies?.euro?.variation.toStringAsFixed(4)),
          ContentInfo(
              title: financeData.currencies?.yen?.title,
              firstValue: financeData.currencies?.yen?.value.toStringAsFixed(4),
              variationValue:
                  financeData.currencies?.yen?.variation.toStringAsFixed(4)),
        ],
        buttonTitle: 'Ir para Ações',
        callbackFunction: handleNextPage,
      ),
    ]);
  }
}
