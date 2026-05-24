import 'package:algorithm_task/app/modules/common/constants/enums.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  final numbers = List.generate(100, (index) => index + 1).obs;
  final currentRule = HighlightRule.none.obs;

  late Set<int> _primes;
  late Set<int> _fibonaccis;

  @override
  void onInit() {
    super.onInit();
    _primes = _generatePrimes(100);
    _fibonaccis = _generateFibonacci(100);
  }

  void setRule(HighlightRule rule) {
    currentRule.value = rule;
  }

  bool isHighlighted(int number) {
    switch (currentRule.value) {
      case HighlightRule.odd:
        return number % 2 != 0;
      case HighlightRule.even:
        return number % 2 == 0;
      case HighlightRule.prime:
        return _primes.contains(number);
      case HighlightRule.fibonacci:
        return _fibonaccis.contains(number);
      case HighlightRule.none:
      default:
        return false;
    }
  }

  Set<int> _generatePrimes(int limit) {
    Set<int> primes = {};
    List<bool> isPrime = List.generate(limit + 1, (index) => true);
    isPrime[0] = isPrime[1] = false;
    for (int p = 2; p * p <= limit; p++) {
      if (isPrime[p]) {
        for (int i = p * p; i <= limit; i += p) {
          isPrime[i] = false;
        }
      }
    }
    for (int i = 2; i <= limit; i++) {
      if (isPrime[i]) primes.add(i);
    }
    return primes;
  }

  Set<int> _generateFibonacci(int limit) {
    Set<int> fibs = {1};
    int a = 1;
    int b = 1;
    while (b <= limit) {
      fibs.add(b);
      int temp = a + b;
      a = b;
      b = temp;
    }
    return fibs;
  }
}
