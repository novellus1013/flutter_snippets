/// 투명도 상수
/// 0.0 (완전 투명) ~ 1.0 (완전 불투명)
/// Material Design 표준 투명도 값을 기반으로 정의
///
/// 사용 예:
/// ```dart
/// Opacity(
///   opacity: isEnabled ? AppOpacity.opaque : AppOpacity.disabled,
///   child: MyWidget(),
/// )
/// ```
class AppOpacity {
  const AppOpacity._();

  /// 0.0 - 완전 투명
  static const double transparent = 0.0;

  /// 0.05 - 거의 보이지 않음 (호버 상태 배경 등)
  static const double hover = 0.05;

  /// 0.12 - 약간 보임 (눌림 상태 배경, 비활성화 오버레이)
  static const double pressed = 0.12;

  /// 0.38 - 비활성화 상태 (Material Design 표준 비활성화 투명도)
  static const double disabled = 0.38;

  /// 0.54 - 보조 텍스트 (힌트 텍스트, 보조 정보)
  static const double medium = 0.54;

  /// 0.87 - 주요 텍스트 (Material Design 표준 텍스트 투명도)
  static const double high = 0.87;

  /// 1.0 - 완전 불투명
  static const double opaque = 1.0;
}
