import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_radius.dart';
import 'app_spacing.dart';
import 'app_text_sizes.dart';

/// 앱 테마 정의 (라이트 모드 / 다크 모드)
/// getter를 사용하므로 AppTheme.light / AppTheme.dark 로 호출 가능
///
/// 사용 예:
/// ```dart
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
///   themeMode: ThemeMode.system,  // 시스템 설정에 따라 자동 전환
/// )
/// ```
class AppTheme {
  const AppTheme._();

  // ══════════════════════════════════════════════
  //  라이트 테마
  // ══════════════════════════════════════════════
  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);

    final colorScheme = ColorScheme.light(
      primary: AppColor.primary,
      secondary: AppColor.secondary,
      surface: AppColor.surface,
      error: AppColor.error,
      onPrimary: AppColor.black,
      onSecondary: AppColor.white,
      onSurface: AppColor.black,
      onError: AppColor.white,
      outline: AppColor.borderGrey,
    );

    final textTheme = _buildTextTheme(
      base.textTheme,
      AppColor.black,
      AppColor.textGrey,
    );

    return base.copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColor.backgroundGrey,
      textTheme: textTheme,
      appBarTheme: _buildAppBarTheme(colorScheme, textTheme),
      elevatedButtonTheme: _buildElevatedButtonTheme(colorScheme),
      outlinedButtonTheme: _buildOutlinedButtonTheme(colorScheme),
      textButtonTheme: _buildTextButtonTheme(colorScheme),
      inputDecorationTheme: _buildInputDecorationTheme(colorScheme),
      cardTheme: _buildCardTheme(colorScheme),
      navigationBarTheme: _buildNavigationBarTheme(colorScheme),
      dividerColor: AppColor.borderGrey,
      dividerTheme: const DividerThemeData(
        color: AppColor.borderGrey,
        thickness: 1,
        space: 1,
      ),
    );
  }

  // ══════════════════════════════════════════════
  //  다크 테마
  // ══════════════════════════════════════════════
  static ThemeData get dark {
    final base = ThemeData.dark(useMaterial3: true);

    final colorScheme = ColorScheme.dark(
      primary: AppColor.primary,
      secondary: AppColor.secondary,
      surface: AppColor.darkSurface,
      error: AppColor.error,
      onPrimary: AppColor.black,
      onSecondary: AppColor.black,
      onSurface: AppColor.white,
      onError: AppColor.white,
      outline: AppColor.darkBorderGrey,
    );

    final textTheme = _buildTextTheme(
      base.textTheme,
      AppColor.white,
      AppColor.darkTextGrey,
    );

    return base.copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColor.darkBackground,
      textTheme: textTheme,
      appBarTheme: _buildAppBarTheme(colorScheme, textTheme),
      elevatedButtonTheme: _buildElevatedButtonTheme(colorScheme),
      outlinedButtonTheme: _buildOutlinedButtonTheme(colorScheme),
      textButtonTheme: _buildTextButtonTheme(colorScheme),
      inputDecorationTheme: _buildInputDecorationTheme(colorScheme),
      cardTheme: _buildCardTheme(colorScheme),
      navigationBarTheme: _buildNavigationBarTheme(colorScheme),
      dividerColor: AppColor.darkBorderGrey,
      dividerTheme: DividerThemeData(
        color: AppColor.darkBorderGrey,
        thickness: 1,
        space: 1,
      ),
    );
  }

  // ══════════════════════════════════════════════
  //  텍스트 테마 (라이트/다크 공통 구조, 색상만 다름)
  // ══════════════════════════════════════════════
  static TextTheme _buildTextTheme(
    TextTheme base,
    Color primaryTextColor,
    Color secondaryTextColor,
  ) {
    return base.copyWith(
      // ── Display 스타일 (히어로, 스플래시 등 매우 큰 텍스트) ──
      displayLarge: base.displayLarge?.copyWith(
        fontSize: AppTextSizes.display3, // 40px
        fontWeight: FontWeight.w700,
        color: primaryTextColor,
      ),
      displayMedium: base.displayMedium?.copyWith(
        fontSize: AppTextSizes.display2, // 32px
        fontWeight: FontWeight.w700,
        color: primaryTextColor,
      ),
      displaySmall: base.displaySmall?.copyWith(
        fontSize: AppTextSizes.display1, // 24px
        fontWeight: FontWeight.w700,
        color: primaryTextColor,
      ),

      // ── Headline 스타일 (섹션 제목 등) ──
      headlineLarge: base.headlineLarge?.copyWith(
        fontSize: AppTextSizes.xl, // 20px
        fontWeight: FontWeight.w600,
        color: primaryTextColor,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontSize: AppTextSizes.lg, // 18px
        fontWeight: FontWeight.w600,
        color: primaryTextColor,
      ),
      headlineSmall: base.headlineSmall?.copyWith(
        fontSize: AppTextSizes.base, // 16px
        fontWeight: FontWeight.w600,
        color: primaryTextColor,
      ),

      // ── Title 스타일 (AppBar, 다이얼로그 제목 등) ──
      titleLarge: base.titleLarge?.copyWith(
        fontSize: AppTextSizes.xl, // 20px
        fontWeight: FontWeight.w600,
        color: primaryTextColor,
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontSize: AppTextSizes.lg, // 18px
        fontWeight: FontWeight.w600,
        color: primaryTextColor,
      ),
      titleSmall: base.titleSmall?.copyWith(
        fontSize: AppTextSizes.base, // 16px
        fontWeight: FontWeight.w500,
        color: primaryTextColor,
      ),

      // ── Body 스타일 (본문 텍스트) ──
      bodyLarge: base.bodyLarge?.copyWith(
        fontSize: AppTextSizes.base, // 16px
        fontWeight: FontWeight.w400,
        color: primaryTextColor,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        fontSize: AppTextSizes.md, // 14px
        fontWeight: FontWeight.w400,
        color: primaryTextColor,
      ),
      bodySmall: base.bodySmall?.copyWith(
        fontSize: AppTextSizes.sm, // 12px
        fontWeight: FontWeight.w400,
        color: secondaryTextColor,
      ),

      // ── Label 스타일 (버튼 텍스트, 작은 라벨) ──
      labelLarge: base.labelLarge?.copyWith(
        fontSize: AppTextSizes.base, // 16px
        fontWeight: FontWeight.w600,
        color: primaryTextColor,
      ),
      labelMedium: base.labelMedium?.copyWith(
        fontSize: AppTextSizes.md, // 14px
        fontWeight: FontWeight.w500,
        color: primaryTextColor,
      ),
      labelSmall: base.labelSmall?.copyWith(
        fontSize: AppTextSizes.xs, // 10px
        fontWeight: FontWeight.w500,
        color: secondaryTextColor,
      ),
    );
  }

  // ── AppBar 테마 ──────────────────────────────
  static AppBarTheme _buildAppBarTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return AppBarTheme(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: textTheme.titleLarge,
      iconTheme: IconThemeData(color: colorScheme.onSurface),
    );
  }

  // ── ElevatedButton 테마 ──────────────────────
  // 주요 액션 버튼 (회원가입, 저장, 확인 등)
  static ElevatedButtonThemeData _buildElevatedButtonTheme(
    ColorScheme colorScheme,
  ) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        minimumSize: const Size(80, 48), // 48dp = 접근성 최소 터치 영역
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg, // 16px
          vertical: AppSpacing.md, // 12px
        ),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
        textStyle: const TextStyle(
          inherit: false,
          fontSize: AppTextSizes.base,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ── OutlinedButton 테마 ──────────────────────
  // 보조 액션 버튼 (취소, 나중에 등)
  static OutlinedButtonThemeData _buildOutlinedButtonTheme(
    ColorScheme colorScheme,
  ) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.primary,
        minimumSize: const Size(80, 48),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
        side: BorderSide(color: colorScheme.outline),
        textStyle: const TextStyle(
          inherit: false,
          fontSize: AppTextSizes.base,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ── TextButton 테마 ──────────────────────────
  // 텍스트만 있는 버튼 (더 보기, 건너뛰기 등)
  static TextButtonThemeData _buildTextButtonTheme(
    ColorScheme colorScheme,
  ) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.primary,
        minimumSize: const Size(64, 40),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
        textStyle: const TextStyle(
          inherit: false,
          fontSize: AppTextSizes.md,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ── InputDecoration 테마 ──────────────────────
  // 텍스트 입력 필드 (TextField, TextFormField)
  static InputDecorationTheme _buildInputDecorationTheme(
    ColorScheme colorScheme,
  ) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surface,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg, // 16px
        vertical: AppSpacing.md, // 12px
      ),
      border: OutlineInputBorder(
        borderRadius: AppRadius.md,
        borderSide: BorderSide(color: colorScheme.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppRadius.md,
        borderSide: BorderSide(color: colorScheme.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppRadius.md,
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppRadius.md,
        borderSide: BorderSide(color: colorScheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: AppRadius.md,
        borderSide: BorderSide(color: colorScheme.error, width: 2),
      ),
      hintStyle: TextStyle(
        fontSize: AppTextSizes.md,
        color: colorScheme.onSurface.withAlpha(128),
      ),
      errorStyle: TextStyle(
        fontSize: AppTextSizes.sm,
        color: colorScheme.error,
      ),
    );
  }

  // ── Card 테마 ──────────────────────────────
  static CardThemeData _buildCardTheme(ColorScheme colorScheme) {
    return CardThemeData(
      color: colorScheme.surface,
      elevation: 1,
      margin: const EdgeInsets.all(AppSpacing.xs), // 4px
      shape: RoundedRectangleBorder(borderRadius: AppRadius.md),
    );
  }

  // ── NavigationBar 테마 (하단 네비게이션) ──────────
  static NavigationBarThemeData _buildNavigationBarTheme(
    ColorScheme colorScheme,
  ) {
    return NavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.primary.withAlpha(51),
      labelTextStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: AppTextSizes.sm,
          fontWeight: FontWeight.w500,
        ),
      ),
      height: 64,
    );
  }
}
