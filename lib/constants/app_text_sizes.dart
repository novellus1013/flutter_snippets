/// 앱 전체에서 사용하는 텍스트 크기 상수
/// 주석에 추천 fontWeight 포함
///
/// 크기 체계:
///   xs(10) → sm(12) → md(14) → base(16) → lg(18) → xl(20)
///   → display1(24) → display2(32) → display3(40)
///
/// 사용 예:
/// ```dart
/// Text(
///   '제목',
///   style: TextStyle(
///     fontSize: AppTextSizes.xl,
///     fontWeight: FontWeight.w600,
///   ),
/// )
/// ```
class AppTextSizes {
  const AppTextSizes._();

  /// 10px - 타임스탬프, 아주 작은 보조 텍스트, w300 또는 w400
  static const double xs = 10.0;

  /// 12px - 작은 라벨, 입력 필드 설명 텍스트, w400 또는 w500
  static const double sm = 12.0;

  /// 14px - 본문 보조 텍스트, 서브 설명, w400
  static const double md = 14.0;

  /// 16px - 기본 본문 텍스트, w400 또는 w500
  static const double base = 16.0;

  /// 18px - 카드 제목, 리스트 섹션 제목, w600
  static const double lg = 18.0;

  /// 20px - 화면 제목(AppBar), 큰 섹션 제목, w600 또는 w700
  static const double xl = 20.0;

  /// 24px - 홈 화면 헤더, 매우 큰 제목, w700
  static const double display1 = 24.0;

  /// 32px - 히어로 텍스트, 스플래시/온보딩 화면 제목, w700 또는 w800
  static const double display2 = 32.0;

  /// 40px - 매우 큰 숫자 표시 (가격, 통계 대시보드 등), w700 또는 w800
  static const double display3 = 40.0;
}
