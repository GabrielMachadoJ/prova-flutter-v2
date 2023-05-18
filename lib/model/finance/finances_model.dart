import 'package:prova/model/finance/bitcoin_model.dart';
import 'package:prova/model/finance/currencies_model.dart';
import 'package:prova/model/finance/stocks_model.dart';

class FinancesModel {
  CurrenciesModel? currencies;
  StocksModel? stocks;
  BitcoinModel? bitcoin;

  FinancesModel(this.bitcoin, this.currencies, this.stocks);

  FinancesModel.start() {
    currencies = CurrenciesModel.start();
    stocks = StocksModel.start();
    bitcoin = BitcoinModel.start();
  }
}
