import 'package:forex_trade/app/model/candelModeldata.dart';
import 'package:get/get.dart';

class BuyController extends GetxController{}


class ChartController extends GetxController {
  var candles = <CandleData>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadMockData(); // Replace with API call later
  }

  void loadMockData() {
    final mock = [
      CandleData(DateTime(2025, 7, 25), 100, 110, 95, 105),
      CandleData(DateTime(2025, 7, 26), 105, 115, 100, 112),
      CandleData(DateTime(2025, 7, 27), 112, 118, 108, 114),
      CandleData(DateTime(2025, 7, 28), 114, 120, 110, 117),
      CandleData(DateTime(2025, 7, 29), 117, 123, 115, 119),
    ];
    candles.value = mock;
    isLoading.value = false;
  }

  // 🔁 Use this method when API is ready
  // Future<void> loadFromApi() async {
  //   final response = await http.get(Uri.parse('YOUR_API_URL'));
  //   final List data = jsonDecode(response.body);
  //   candles.value = data.map((e) => CandleData.fromJson(e)).toList();
  //   isLoading.value = false;
  // }
}