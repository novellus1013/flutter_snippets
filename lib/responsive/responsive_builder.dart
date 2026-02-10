import 'package:flutter/material.dart';
import 'package:flutter_snippets/responsive/app_responsive.dart';

/// 반응형 레이아웃 빌더 위젯
/// 모바일과 태블릿에서 완전히 다른 위젯을 보여줄 때 사용
///
/// [tablet]이 지정되지 않으면 [mobile] 레이아웃이 모든 디바이스에서 사용됨
/// → 모바일 먼저 개발하고, 나중에 태블릿 레이아웃을 추가할 수 있음
///
/// 사용 예:
/// ```dart
/// ResponsiveBuilder(
///   mobile: (context) => MobileHomeScreen(),
///   tablet: (context) => TabletHomeScreen(),
/// )
/// ```
class ResponsiveBuilder extends StatelessWidget {
  /// 모바일 레이아웃 빌더 (필수)
  final Widget Function(BuildContext context) mobile;

  /// 태블릿 레이아웃 빌더 (선택 - 미지정 시 모바일 레이아웃 사용)
  final Widget Function(BuildContext context)? tablet;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
  });

  @override
  Widget build(BuildContext context) {
    switch (context.deviceType) {
      case DeviceType.mobile:
        return mobile(context);
      case DeviceType.tablet:
        return tablet?.call(context) ?? mobile(context);
    }
  }
}

/// 반응형 패딩 위젯
/// 디바이스에 따라 자동으로 패딩이 조절됨
///
/// 기본값:
///   - 모바일: 좌우 16px
///   - 태블릿: 좌우 24px
///
/// 사용 예:
/// ```dart
/// // 기본 패딩 사용
/// ResponsivePadding(
///   child: MyWidget(),
/// )
///
/// // 커스텀 패딩 지정
/// ResponsivePadding(
///   mobilePadding: EdgeInsets.all(16),
///   tabletPadding: EdgeInsets.all(32),
///   child: MyWidget(),
/// )
/// ```
class ResponsivePadding extends StatelessWidget {
  final Widget child;

  /// 커스텀 모바일 패딩 (미지정 시 기본값 좌우 16px)
  final EdgeInsets? mobilePadding;

  /// 커스텀 태블릿 패딩 (미지정 시 기본값 좌우 24px)
  final EdgeInsets? tabletPadding;

  const ResponsivePadding({
    super.key,
    required this.child,
    this.mobilePadding,
    this.tabletPadding,
  });

  @override
  Widget build(BuildContext context) {
    final padding = context.responsive(
      mobile: mobilePadding ?? const EdgeInsets.symmetric(horizontal: 16.0),
      tablet: tabletPadding ?? const EdgeInsets.symmetric(horizontal: 24.0),
    );
    return Padding(padding: padding, child: child);
  }
}

/// 반응형 최대 너비 컨테이너
/// 태블릿에서 콘텐츠가 너무 넓어지는 것을 방지
/// 콘텐츠를 중앙 정렬하고 최대 너비를 제한함
///
/// 사용 예:
/// ```dart
/// // 모바일에서는 전체 너비, 태블릿에서는 최대 600px로 제한
/// ResponsiveContainer(
///   child: MyContent(),
/// )
///
/// // 최대 너비 커스텀
/// ResponsiveContainer(
///   maxWidth: 800,
///   child: MyContent(),
/// )
/// ```
class ResponsiveContainer extends StatelessWidget {
  final Widget child;

  /// 최대 너비 (기본값: 600)
  final double maxWidth;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.maxWidth = 600.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
