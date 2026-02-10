import 'package:flutter/material.dart';

/// 앱 전체에서 사용하는 색상 상수
/// 의미 기반으로 분류: 브랜드, 중립, 의미(상태), 표면, 비활성화, 다크 모드
///
/// 사용 예:
/// ```dart
/// Container(
///   color: AppColor.surface,
///   child: Text('성공!', style: TextStyle(color: AppColor.success)),
/// )
/// ```
class AppColor {
  const AppColor._();

  // ── 브랜드 색상 ──────────────────────────────
  /// 앱의 주요 색상 (버튼, 강조 요소 등)
  static const primary = Colors.yellow;

  /// 보조 색상 (보조 버튼, 보조 강조 등)
  static const secondary = Colors.green;

  // ── 중립 색상 ──────────────────────────────
  static const black = Colors.black;
  static const white = Colors.white;

  /// 배경용 밝은 회색 (shade 50-100)
  static const backgroundGrey = Color(0xFFF5F5F5);

  /// 테두리/구분선용 회색 (shade 200-300)
  static const borderGrey = Color(0xFFE0E0E0);

  /// 보조 텍스트용 회색 (shade 600-700)
  static const textGrey = Color(0xFF616161);

  // ── 의미 색상 (상태 표시) ──────────────────────
  /// 에러 상태 (삭제 확인, 유효성 검사 실패 등)
  static const error = Color(0xFFE53935);

  /// 성공 상태 (완료, 저장 성공 등)
  static const success = Color(0xFF43A047);

  /// 경고 상태 (주의 필요, 확인 요청 등)
  static const warning = Color(0xFFFFA726);

  /// 정보 안내 (도움말, 알림 등)
  static const info = Color(0xFF29B6F6);

  // ── 표면/오버레이 색상 ──────────────────────────
  /// 카드, 다이얼로그 등의 표면 색상
  static const surface = Color(0xFFFFFFFF);

  /// 모달, 바텀시트 뒤의 오버레이 색상 (black 약 32% 투명도)
  static const overlay = Color(0x52000000);

  // ── 비활성화 상태 색상 ──────────────────────────
  /// 비활성화된 버튼, 텍스트 등의 배경
  static const disabled = Color(0xFFBDBDBD);

  /// 비활성화된 텍스트 색상
  static const disabledText = Color(0xFF9E9E9E);

  // ── 다크 모드 전용 색상 ──────────────────────────
  /// 다크 모드 배경색
  static const darkBackground = Color(0xFF121212);

  /// 다크 모드 표면색 (카드, 다이얼로그 등)
  static const darkSurface = Color(0xFF1E1E1E);

  /// 다크 모드 테두리/구분선 색상
  static const darkBorderGrey = Color(0xFF2C2C2C);

  /// 다크 모드 보조 텍스트 색상
  static const darkTextGrey = Color(0xFFB0B0B0);
}
