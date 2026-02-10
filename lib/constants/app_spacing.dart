/// 앱 전체에서 사용하는 간격(패딩, 마진) 상수
/// 4px 기반의 일관된 간격 체계 (티셔츠 사이징)
///
/// 크기 체계:
///   xxs(2) → xs(4) → sm(8) → md(12) → lg(16) → xl(24) → xxl(32) → xxxl(48) → xxxxl(64)
///
/// 사용 예:
/// ```dart
/// Padding(
///   padding: EdgeInsets.all(AppSpacing.lg),  // 16px
///   child: MyWidget(),
/// )
/// ```
class AppSpacing {
  const AppSpacing._();

  /// 2px - 극소 간격 (아이콘 내부 미세 조정 등, 드물게 사용)
  static const double xxs = 2.0;

  /// 4px - 아이콘과 텍스트 사이 같이 아주 작은 틈
  static const double xs = 4.0;

  /// 8px - 칩 나열, 태그 목록, 폼 내 작은 요소 사이
  static const double sm = 8.0;

  /// 12px - 제목과 부제 사이, 리스트 아이템 내부 요소 사이
  static const double md = 12.0;

  /// 16px - 화면 좌우 패딩, 카드/박스 내부 패딩 (가장 많이 사용)
  static const double lg = 16.0;

  /// 24px - 큰 섹션(UI 블록) 사이의 간격
  static const double xl = 24.0;

  /// 32px - 화면 상단/하단 큰 간격, ScrollView 상하단 간격
  static const double xxl = 32.0;

  /// 48px - 매우 큰 섹션 구분, 로그인/온보딩 화면의 섹션 간격
  static const double xxxl = 48.0;

  /// 64px - 최대 간격, 히어로 섹션, 스플래시 화면 요소 배치
  static const double xxxxl = 64.0;
}
