import 'dart:convert';

import 'package:http/http.dart';
import 'package:prova/model/finance/bitcoin_model.dart';
import 'package:prova/model/finance/currencies_model.dart';
import 'package:prova/model/finance/finance_item_model.dart';
import 'package:prova/model/finance/finances_model.dart';
import 'package:prova/model/finance/stocks_model.dart';

class FinanceService {
  Future<FinancesModel> getFinances() async {
    const String url =
        'https://api.hgbrasil.com/finance?key=aa39108f&format=json-cors';
    try {
      Response resposta = await get(Uri.parse(url));
      Map res = json.decode(resposta.body);

      FinanceItemModel dollar = FinanceItemModel(
          'Dólar',
          res['results']['currencies']['USD']['buy'],
          res['results']['currencies']['USD']['variation']);
      FinanceItemModel euro = FinanceItemModel(
          'Euro',
          res['results']['currencies']['EUR']['buy'],
          res['results']['currencies']['EUR']['variation']);
      FinanceItemModel peso = FinanceItemModel(
          'Peso',
          res['results']['currencies']['ARS']['buy'],
          res['results']['currencies']['ARS']['variation']);
      FinanceItemModel yen = FinanceItemModel(
          'Yen',
          res['results']['currencies']['JPY']['buy'],
          res['results']['currencies']['JPY']['variation']);

      CurrenciesModel currencies = CurrenciesModel(dollar, euro, peso, yen);

      FinanceItemModel ibovespa = FinanceItemModel(
          'IBOVESPA',
          res['results']['stocks']['IBOVESPA']['points'],
          res['results']['stocks']['IBOVESPA']['variation']);
      FinanceItemModel nasdaq = FinanceItemModel(
          'NASDAQ',
          res['results']['stocks']['NASDAQ']['points'],
          res['results']['stocks']['NASDAQ']['variation']);
      FinanceItemModel cac = FinanceItemModel(
          'CAC',
          res['results']['stocks']['CAC']['points'],
          res['results']['stocks']['CAC']['variation']);
      FinanceItemModel ifix = FinanceItemModel(
          'IFIX',
          res['results']['stocks']['IFIX']['points'],
          res['results']['stocks']['IFIX']['variation']);
      FinanceItemModel dowjones = FinanceItemModel(
          'DOWJONES',
          res['results']['stocks']['DOWJONES']['points'],
          res['results']['stocks']['DOWJONES']['variation']);
      FinanceItemModel nikkei = FinanceItemModel(
          'NIKKEI',
          res['results']['stocks']['NIKKEI']['points'],
          res['results']['stocks']['NIKKEI']['variation']);

      StocksModel stocks =
          StocksModel(cac, dowjones, ibovespa, ifix, nasdaq, nikkei);

      FinanceItemModel blockchainInfo = FinanceItemModel(
          'Blockchain.info',
          res['results']['bitcoin']['blockchain_info']['buy'],
          res['results']['bitcoin']['blockchain_info']['variation']);
      FinanceItemModel coinbase = FinanceItemModel(
          'Coinbase',
          res['results']['bitcoin']['coinbase']['last'],
          res['results']['bitcoin']['coinbase']['variation']);
      FinanceItemModel bitStamp = FinanceItemModel(
          'BitStamp',
          res['results']['bitcoin']['bitstamp']['buy'],
          res['results']['bitcoin']['bitstamp']['variation']);
      FinanceItemModel foxBit = FinanceItemModel(
          'FoxBit',
          res['results']['bitcoin']['foxbit']['last'],
          res['results']['bitcoin']['foxbit']['variation']);
      FinanceItemModel mercadoBitcoin = FinanceItemModel(
          'Mercado Bitcoin',
          res['results']['bitcoin']['mercadobitcoin']['buy'],
          res['results']['bitcoin']['mercadobitcoin']['variation']);

      BitcoinModel bitcoin = BitcoinModel(
          blockchainInfo, bitStamp, coinbase, foxBit, mercadoBitcoin);

      FinancesModel finances = FinancesModel(bitcoin, currencies, stocks);

      return finances;
    } catch (e) {
      throw ('Error: $e');
    }
  }
}
