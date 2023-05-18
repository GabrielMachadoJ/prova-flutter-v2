import 'package:flutter/material.dart';
import 'package:prova/components/content_container.dart';
import 'package:prova/components/content_info.dart';
import 'package:prova/components/layout.dart';
import 'package:prova/model/finance/finances_model.dart';

class Bitcoin extends StatefulWidget {
  const Bitcoin({super.key});

  @override
  State<Bitcoin> createState() => _BitcoinState();
}

class _BitcoinState extends State<Bitcoin> {
  @override
  Widget build(BuildContext context) {
    final financeData =
        ModalRoute.of(context)!.settings.arguments as FinancesModel;

    handleNextPage() {
      Navigator.pushReplacementNamed(context, '/currencies');
    }

    return Layout(pageTitle: 'BitCoin', pageContent: [
      ContentContainer(
        leftContent: [
          ContentInfo(
              title: financeData.bitcoin?.blockchainInfo?.title,
              firstValue:
                  financeData.bitcoin?.blockchainInfo?.value.toStringAsFixed(2),
              variationValue: financeData.bitcoin?.blockchainInfo?.variation
                  .toStringAsFixed(3)),
          ContentInfo(
              title: financeData.bitcoin?.coinbase?.title,
              firstValue:
                  financeData.bitcoin?.coinbase?.value.toStringAsFixed(2),
              variationValue:
                  financeData.bitcoin?.coinbase?.variation.toStringAsFixed(3)),
          ContentInfo(
              title: financeData.bitcoin?.bitStamp?.title,
              firstValue:
                  financeData.bitcoin?.bitStamp?.value.toStringAsFixed(2),
              variationValue:
                  financeData.bitcoin?.bitStamp?.variation.toStringAsFixed(3)),
        ],
        rightContent: [
          ContentInfo(
              title: financeData.bitcoin?.foxBit?.title,
              firstValue: financeData.bitcoin?.foxBit?.value.toStringAsFixed(2),
              variationValue:
                  financeData.bitcoin?.foxBit?.variation.toStringAsFixed(3)),
          ContentInfo(
              title: financeData.bitcoin?.mercadoBitcoin?.title,
              firstValue:
                  financeData.bitcoin?.mercadoBitcoin?.value.toStringAsFixed(2),
              variationValue: financeData.bitcoin?.mercadoBitcoin?.variation
                  .toStringAsFixed(3)),
        ],
        buttonTitle: 'Página Principal',
        callbackFunction: handleNextPage,
      ),
    ]);
  }
}
