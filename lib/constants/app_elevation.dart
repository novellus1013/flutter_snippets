/// 그림자 높이(elevation) 상수
/// Material Design 기반의 깊이 표현
///
/// 사용 예:
/// ```dart
/// Material(
///   elevation: AppElevation.sm,
///   child: MyWidget(),
/// )
/// ```
class AppElevation {
  const AppElevation._();

  /// 0 - 그림자 없음 (플랫 요소)
  static const double none = 0.0;

  /// 1 - 미세한 그림자 (카드 기본값)
  static const double xs = 1.0;

  /// 2 - 작은 그림자 (호버 상태의 카드, 눌림 상태의 버튼)
  static const double sm = 2.0;

  /// 4 - 중간 그림자 (플로팅 카드, 드롭다운 메뉴)
  static const double md = 4.0;

  /// 8 - 큰 그림자 (모달, 다이얼로그)
  static const double lg = 8.0;

  /// 16 - 매우 큰 그림자 (드래그 중인 요소, 네비게이션 드로어)
  static const double xl = 16.0;
}
