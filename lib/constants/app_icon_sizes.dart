/// 아이콘 크기 상수
/// 일관된 아이콘 크기 사용을 위한 표준 값
///
/// 사용 예:
/// ```dart
/// Icon(
///   Icons.home,
///   size: AppIconSizes.md,  // 24px (Flutter 기본 아이콘 크기)
/// )
/// ```
class AppIconSizes {
  const AppIconSizes._();

  /// 16px - 인라인 아이콘 (텍스트 옆 상태 표시, 작은 뱃지)
  static const double xs = 16.0;

  /// 20px - 작은 아이콘 (입력 필드 접미사, 작은 액션 버튼)
  static const double sm = 20.0;

  /// 24px - 기본 아이콘 크기 (AppBar, 리스트 타일, 일반 버튼)
  /// Flutter Icon 위젯의 기본 크기와 동일
  static const double md = 24.0;

  /// 32px - 큰 아이콘 (탭 바, 하단 네비게이션)
  static const double lg = 32.0;

  /// 48px - 매우 큰 아이콘 (빈 상태 안내, 기능 소개 아이콘)
  static const double xl = 48.0;

  /// 64px - 특대 아이콘 (에러 화면, 완료 화면 중앙 아이콘)
  static const double xxl = 64.0;
}
