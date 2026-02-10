import 'package:flutter/material.dart';
import 'package:flutter_snippets/constants/app_spacing.dart';

/// 자주 사용하는 SizedBox 간격 위젯 모음
/// v = vertical(세로), h = horizontal(가로)
/// 숫자는 픽셀 값을 의미 (예: v16 = 세로 16px 간격)
///
/// 사용 예:
/// ```dart
/// Column(
///   children: [
///     Text('제목'),
///     Gaps.v8,       // 세로 8px 간격
///     Text('본문'),
///   ],
/// )
/// ```
class Gaps {
  const Gaps._();

  // ── 세로 간격 ──────────────────────────────
  static const v2 = SizedBox(height: AppSpacing.xxs);
  static const v4 = SizedBox(height: AppSpacing.xs);
  static const v8 = SizedBox(height: AppSpacing.sm);
  static const v12 = SizedBox(height: AppSpacing.md);
  static const v16 = SizedBox(height: AppSpacing.lg);
  static const v24 = SizedBox(height: AppSpacing.xl);
  static const v32 = SizedBox(height: AppSpacing.xxl);
  static const v48 = SizedBox(height: AppSpacing.xxxl);
  static const v64 = SizedBox(height: AppSpacing.xxxxl);

  // ── 가로 간격 ──────────────────────────────
  static const h2 = SizedBox(width: AppSpacing.xxs);
  static const h4 = SizedBox(width: AppSpacing.xs);
  static const h8 = SizedBox(width: AppSpacing.sm);
  static const h12 = SizedBox(width: AppSpacing.md);
  static const h16 = SizedBox(width: AppSpacing.lg);
  static const h24 = SizedBox(width: AppSpacing.xl);
  static const h32 = SizedBox(width: AppSpacing.xxl);
  static const h48 = SizedBox(width: AppSpacing.xxxl);
  static const h64 = SizedBox(width: AppSpacing.xxxxl);
}
