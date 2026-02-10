import 'package:flutter/material.dart';
import 'package:flutter_snippets/constants/app_breakpoints.dart';

/// 디바이스 타입 (화면 너비 기준)
enum DeviceType {
  /// 600px 미만
  mobile,

  /// 600px 이상
  tablet,
}

/// 반응형 유틸리티 클래스
/// MediaQuery를 기반으로 디바이스 타입 판별 및 반응형 값 제공
///
/// 사용 예:
/// ```dart
/// // 정적 메서드로 사용
/// final isMobile = AppResponsive.isMobile(context);
/// final padding = AppResponsive.spacing(context, AppSpacing.lg);
///
/// // BuildContext 확장으로 사용 (더 간결)
/// final isMobile = context.isMobile;
/// final columns = context.responsive(mobile: 2, tablet: 4);
/// ```
class AppResponsive {
  const AppResponsive._();

  /// 화면 너비로 디바이스 타입 판별
  static DeviceType deviceType(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < AppBreakpoints.mobile) {
      return DeviceType.mobile;
    }
    return DeviceType.tablet;
  }

  /// 모바일 여부
  static bool isMobile(BuildContext context) =>
      deviceType(context) == DeviceType.mobile;

  /// 태블릿 여부
  static bool isTablet(BuildContext context) =>
      deviceType(context) == DeviceType.tablet;

  /// 디바이스 타입에 따라 다른 값 반환
  ///
  /// 사용 예:
  /// ```dart
  /// // 숫자 값
  /// final columns = AppResponsive.value(context, mobile: 2, tablet: 4);
  ///
  /// // 위젯도 가능
  /// final layout = AppResponsive.value(
  ///   context,
  ///   mobile: ListView(...),
  ///   tablet: GridView(...),
  /// );
  /// ```
  static T value<T>(
    BuildContext context, {
    required T mobile,
    required T tablet,
  }) {
    return isMobile(context) ? mobile : tablet;
  }

  /// 반응형 간격 스케일 팩터
  /// 모바일: 1.0 (기준), 태블릿: 1.25
  static double spacingScale(BuildContext context) =>
      isMobile(context) ? 1.0 : 1.25;

  /// 반응형 폰트 스케일 팩터
  /// 모바일: 1.0 (기준), 태블릿: 1.15
  static double fontScale(BuildContext context) =>
      isMobile(context) ? 1.0 : 1.15;

  /// 간격 값을 반응형으로 스케일링
  ///
  /// 사용 예:
  /// ```dart
  /// // 모바일에서 16px, 태블릿에서 20px (16 * 1.25)
  /// final padding = AppResponsive.spacing(context, AppSpacing.lg);
  /// ```
  static double spacing(BuildContext context, double value) =>
      value * spacingScale(context);

  /// 폰트 크기를 반응형으로 스케일링
  ///
  /// 사용 예:
  /// ```dart
  /// // 모바일에서 16px, 태블릿에서 18.4px (16 * 1.15)
  /// final fontSize = AppResponsive.fontSize(context, AppTextSizes.base);
  /// ```
  static double fontSize(BuildContext context, double value) =>
      value * fontScale(context);
}

/// BuildContext 확장 - 반응형 기능에 쉽게 접근
///
/// 사용 예:
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return Padding(
///     padding: EdgeInsets.symmetric(
///       horizontal: context.responsive(
///         mobile: AppSpacing.lg,     // 모바일: 16px
///         tablet: AppSpacing.xl,     // 태블릿: 24px
///       ),
///     ),
///     child: context.isMobile
///       ? MobileLayout()
///       : TabletLayout(),
///   );
/// }
/// ```
extension ResponsiveContext on BuildContext {
  /// 화면 너비
  double get screenWidth => MediaQuery.sizeOf(this).width;

  /// 화면 높이
  double get screenHeight => MediaQuery.sizeOf(this).height;

  /// 디바이스 타입
  DeviceType get deviceType => AppResponsive.deviceType(this);

  /// 모바일 여부
  bool get isMobile => AppResponsive.isMobile(this);

  /// 태블릿 여부
  bool get isTablet => AppResponsive.isTablet(this);

  /// 디바이스별 다른 값 반환
  ///
  /// 사용 예:
  /// ```dart
  /// final crossAxisCount = context.responsive(mobile: 2, tablet: 4);
  /// ```
  T responsive<T>({required T mobile, required T tablet}) =>
      AppResponsive.value(this, mobile: mobile, tablet: tablet);

  /// 간격 반응형 스케일링
  double responsiveSpacing(double value) =>
      AppResponsive.spacing(this, value);

  /// 폰트 크기 반응형 스케일링
  double responsiveFontSize(double value) =>
      AppResponsive.fontSize(this, value);
}
