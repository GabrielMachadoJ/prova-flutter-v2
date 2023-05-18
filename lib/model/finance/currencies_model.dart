import 'package:prova/model/finance/finance_item_model.dart';

class CurrenciesModel {
  FinanceItemModel? dollar;
  FinanceItemModel? euro;
  FinanceItemModel? peso;
  FinanceItemModel? yen;

  CurrenciesModel(this.dollar, this.euro, this.peso, this.yen);

  CurrenciesModel.start() {
    dollar = FinanceItemModel.start();
    euro = FinanceItemModel.start();
    peso = FinanceItemModel.start();
    yen = FinanceItemModel.start();
  }
}
