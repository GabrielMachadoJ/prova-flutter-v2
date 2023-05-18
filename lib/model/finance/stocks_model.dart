import 'package:prova/model/finance/finance_item_model.dart';

class StocksModel {
  FinanceItemModel? ibovespa;
  FinanceItemModel? nasdaq;
  FinanceItemModel? cac;
  FinanceItemModel? ifix;
  FinanceItemModel? dowjones;
  FinanceItemModel? nikkei;

  StocksModel(this.cac, this.dowjones, this.ibovespa, this.ifix, this.nasdaq,
      this.nikkei);

  StocksModel.start() {
    ibovespa = FinanceItemModel.start();
    nasdaq = FinanceItemModel.start();
    cac = FinanceItemModel.start();
    ifix = FinanceItemModel.start();
    dowjones = FinanceItemModel.start();
    nikkei = FinanceItemModel.start();
  }
}
