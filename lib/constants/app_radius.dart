import 'package:flutter/material.dart';

/// 테두리 둥글기(Border Radius) 상수
/// double 값과 BorderRadius 객체 모두 제공
///
/// 사용 예:
/// ```dart
/// // BorderRadius 객체 직접 사용 (모든 모서리 동일)
/// Container(
///   decoration: BoxDecoration(borderRadius: AppRadius.md),
/// )
///
/// // 특정 모서리만 둥글게 할 때는 double 값 사용
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.only(
///       topLeft: Radius.circular(AppRadius.lgValue),
///     ),
///   ),
/// )
/// ```
class AppRadius {
  const AppRadius._();

  // ── double 값 (특정 모서리만 둥글게 할 때 사용) ─────────
  /// 4px - 미세한 둥글기 (입력 필드, 작은 칩)
  static const double smValue = 4.0;

  /// 8px - 기본 둥글기 (카드, 버튼)
  static const double mdValue = 8.0;

  /// 12px - 중간 둥글기 (모달, 바텀시트)
  static const double lgValue = 12.0;

  /// 16px - 큰 둥글기 (이미지 카드, 배너)
  static const double xlValue = 16.0;

  /// 24px - 매우 큰 둥글기 (플로팅 카드, 특수 UI)
  static const double xxlValue = 24.0;

  /// 9999px - 완전한 원형 (아바타, 원형 버튼, 필(pill) 모양)
  static const double fullValue = 9999.0;

  // ── BorderRadius 객체 (모든 모서리 동일할 때 바로 사용) ────
  static const sm = BorderRadius.all(Radius.circular(smValue));
  static const md = BorderRadius.all(Radius.circular(mdValue));
  static const lg = BorderRadius.all(Radius.circular(lgValue));
  static const xl = BorderRadius.all(Radius.circular(xlValue));
  static const xxl = BorderRadius.all(Radius.circular(xxlValue));
  static const full = BorderRadius.all(Radius.circular(fullValue));
}
