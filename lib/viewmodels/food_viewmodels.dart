import 'package:flutter_food_ordering/model/foods_response.dart';
import 'package:flutter_food_ordering/viewmodels/base_model.dart';

class FoodViewModel extends BaseViewModel {
  FoodResponse foodResponse;

  FoodViewModel() {
    getAllFoods();
  }

  void getAllFoods() async {
    setState(ViewState.loading);
    try {
      foodResponse = await apiProvider.fetchAllFoods();
      setState(ViewState.ready);
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      setState(ViewState.error);
      notifyListeners();
    }
  }
}
