import 'package:flutter/material.dart';
import 'package:prova/components/content_container.dart';
import 'package:prova/components/content_info.dart';
import 'package:prova/components/layout.dart';
import 'package:prova/model/finance/finances_model.dart';

class Stocks extends StatefulWidget {
  const Stocks({super.key});

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  @override
  Widget build(BuildContext context) {
    final financeData =
        ModalRoute.of(context)!.settings.arguments as FinancesModel;

    handleNextPage() {
      Navigator.pushNamed(context, '/bitcoin', arguments: financeData);
    }

    return Layout(pageTitle: 'Ações', pageContent: [
      ContentContainer(
        leftContent: [
          ContentInfo(
              title: financeData.stocks?.ibovespa?.title,
              firstValue:
                  financeData.stocks?.ibovespa?.value.toStringAsFixed(2),
              variationValue:
                  financeData.stocks?.ibovespa?.variation.toStringAsFixed(2)),
          ContentInfo(
              title: financeData.stocks?.nasdaq?.title,
              firstValue: financeData.stocks?.nasdaq?.value.toStringAsFixed(2),
              variationValue:
                  financeData.stocks?.nasdaq?.variation.toStringAsFixed(2)),
          ContentInfo(
              title: financeData.stocks?.cac?.title,
              firstValue: financeData.stocks?.cac?.value.toStringAsFixed(2),
              variationValue:
                  financeData.stocks?.cac?.variation.toStringAsFixed(2)),
        ],
        rightContent: [
          ContentInfo(
              title: financeData.stocks?.ifix?.title,
              firstValue: financeData.stocks?.ifix?.value.toStringAsFixed(2),
              variationValue:
                  financeData.stocks?.ifix?.variation.toStringAsFixed(2)),
          ContentInfo(
              title: financeData.stocks?.dowjones?.title,
              firstValue:
                  financeData.stocks?.dowjones?.value.toStringAsFixed(2),
              variationValue:
                  financeData.stocks?.dowjones?.variation.toStringAsFixed(2)),
          ContentInfo(
              title: financeData.stocks?.nikkei?.title,
              firstValue: financeData.stocks?.nikkei?.value.toStringAsFixed(2),
              variationValue:
                  financeData.stocks?.nikkei?.variation.toStringAsFixed(2)),
        ],
        buttonTitle: 'Ir para Bitcoin',
        callbackFunction: handleNextPage,
      ),
    ]);
  }
}
