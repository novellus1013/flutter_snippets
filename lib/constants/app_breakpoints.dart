/// 화면 크기 기준점 정의
/// 모바일과 태블릿 레이아웃을 구분하는 데 사용
///
/// 사용 예:
/// ```dart
/// if (screenWidth < AppBreakpoints.mobile) {
///   // 모바일 레이아웃
/// } else {
///   // 태블릿 레이아웃
/// }
/// ```
class AppBreakpoints {
  const AppBreakpoints._();

  /// 모바일 최대 너비 (이 값 미만이면 모바일)
  static const double mobile = 600.0;

  /// 태블릿 최대 너비 (이 값 미만이면 태블릿, 이상이면 데스크톱)
  static const double tablet = 1024.0;
}
