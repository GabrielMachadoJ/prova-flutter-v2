class FinanceItemModel {
  dynamic title;
  dynamic value;
  dynamic variation;

  FinanceItemModel(this.title, this.value, this.variation);

  FinanceItemModel.start() {
    title = '';
    value = 0;
    variation = 0;
  }
}
