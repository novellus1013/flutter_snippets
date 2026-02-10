/// 애니메이션 지속 시간 상수
/// 일관된 모션 경험을 위한 표준 시간 값
///
/// 사용 예:
/// ```dart
/// AnimatedContainer(
///   duration: AppDuration.normal,  // 300ms
///   color: isActive ? Colors.blue : Colors.grey,
/// )
/// ```
class AppDuration {
  const AppDuration._();

  /// 100ms - 매우 빠른 전환 (아이콘 변경, 색상 변경 등)
  static const fastest = Duration(milliseconds: 100);

  /// 200ms - 빠른 전환 (페이드 인/아웃, 작은 요소 이동)
  static const fast = Duration(milliseconds: 200);

  /// 300ms - 기본 전환 (대부분의 애니메이션에 적합)
  static const normal = Duration(milliseconds: 300);

  /// 450ms - 느린 전환 (페이지 전환, 큰 요소 이동)
  static const slow = Duration(milliseconds: 450);

  /// 600ms - 매우 느린 전환 (강조 효과, 온보딩 애니메이션)
  static const slowest = Duration(milliseconds: 600);
}
