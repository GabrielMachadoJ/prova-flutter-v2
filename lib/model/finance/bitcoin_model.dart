import 'package:prova/model/finance/finance_item_model.dart';

class BitcoinModel {
  FinanceItemModel? blockchainInfo;
  FinanceItemModel? coinbase;
  FinanceItemModel? bitStamp;
  FinanceItemModel? foxBit;
  FinanceItemModel? mercadoBitcoin;

  BitcoinModel(this.blockchainInfo, this.bitStamp, this.coinbase, this.foxBit,
      this.mercadoBitcoin);

  BitcoinModel.start() {
    blockchainInfo = FinanceItemModel.start();
    coinbase = FinanceItemModel.start();
    bitStamp = FinanceItemModel.start();
    foxBit = FinanceItemModel.start();
    mercadoBitcoin = FinanceItemModel.start();
  }
}
