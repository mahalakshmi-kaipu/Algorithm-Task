import 'package:algorithm_task/app/modules/common/constants/enums.dart';

String getRuleName(HighlightRule rule) {
  switch (rule) {
    case HighlightRule.none:
      return 'All';
    case HighlightRule.odd:
      return 'Odd';
    case HighlightRule.even:
      return 'Even';
    case HighlightRule.prime:
      return 'Primes';
    case HighlightRule.fibonacci:
      return 'Fibonacci';
  }
}
