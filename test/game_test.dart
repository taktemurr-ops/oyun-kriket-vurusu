import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kriket_vurusu/oyun_kriket_vurusu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kriketConfig.title.length, 33);
    expect(kriketConfig.tagline.length, 33);
    for (final s in kriketConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kriketRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kriketId, optionalMechanics: kriketRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kriketRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
