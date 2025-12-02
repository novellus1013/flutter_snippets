import 'package:flutter/material.dart';
import 'package:flutter_snippets/constants/app_spacing.dart';

class Gaps {
  //Vetical Gaps
  static const v4 = SizedBox(height: AppSpacing.xs);
  static const v8 = SizedBox(height: AppSpacing.sm);
  static const v12 = SizedBox(height: AppSpacing.md);
  static const v16 = SizedBox(height: AppSpacing.basic);
  static const v24 = SizedBox(height: AppSpacing.lg);
  static const v32 = SizedBox(height: AppSpacing.xl);

  //Horizontal Gaps
  static const h4 = SizedBox(width: AppSpacing.xs);
  static const h8 = SizedBox(width: AppSpacing.sm);
  static const h12 = SizedBox(width: AppSpacing.md);
  static const h16 = SizedBox(width: AppSpacing.basic);
  static const h24 = SizedBox(width: AppSpacing.lg);
  static const h32 = SizedBox(width: AppSpacing.xl);
}
