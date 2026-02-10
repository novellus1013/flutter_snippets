import 'package:flutter/material.dart';
import 'package:flutter_snippets/constants/app_color.dart';
import 'package:flutter_snippets/constants/app_spacing.dart';
import 'package:flutter_snippets/constants/app_theme.dart';
import 'package:flutter_snippets/constants/gaps.dart';
import 'package:flutter_snippets/responsive/app_responsive.dart';
import 'package:flutter_snippets/responsive/responsive_builder.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode,
      home: TestScreen(onToggleTheme: _toggleTheme, themeMode: _themeMode),
    );
  }
}

class TestScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;

  const TestScreen({
    super.key,
    required this.onToggleTheme,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Design System'),
        actions: [
          // 라이트/다크 모드 토글 버튼
          IconButton(
            onPressed: onToggleTheme,
            icon: Icon(
              themeMode == ThemeMode.light
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
            ),
          ),
        ],
      ),
      body: ResponsiveBuilder(
        // 모바일: 단일 컬럼 스크롤
        mobile: (context) =>
            _MobileLayout(textTheme: textTheme, colorScheme: colorScheme),
        // 태블릿: 최대 너비 제한 + 넓은 패딩
        tablet: (context) => ResponsiveContainer(
          maxWidth: 700,
          child: _MobileLayout(textTheme: textTheme, colorScheme: colorScheme),
        ),
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const _MobileLayout({required this.textTheme, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: context.responsive(
          mobile: AppSpacing.lg,
          tablet: AppSpacing.xl,
        ),
        vertical: AppSpacing.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 디바이스 정보 ──
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                children: [
                  Icon(
                    context.isMobile ? Icons.phone_android : Icons.tablet_mac,
                    color: colorScheme.primary,
                  ),
                  Gaps.h12,
                  Text(
                    '현재 디바이스: ${context.isMobile ? "모바일" : "태블릿"}',
                    style: textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          ),

          Gaps.v24,

          // ── 텍스트 스타일 미리보기 ──
          Text('텍스트 스타일', style: textTheme.headlineLarge),
          Gaps.v16,
          Text('displayLarge (40px)', style: textTheme.displayLarge),
          Gaps.v8,
          Text('displayMedium (32px)', style: textTheme.displayMedium),
          Gaps.v8,
          Text('displaySmall (24px)', style: textTheme.displaySmall),
          Gaps.v8,
          Text('headlineLarge (20px)', style: textTheme.headlineLarge),
          Gaps.v8,
          Text('titleLarge (20px)', style: textTheme.titleLarge),
          Gaps.v8,
          Text('titleMedium (18px)', style: textTheme.titleMedium),
          Gaps.v8,
          Text('bodyLarge (16px)', style: textTheme.bodyLarge),
          Gaps.v8,
          Text('bodyMedium (14px)', style: textTheme.bodyMedium),
          Gaps.v8,
          Text('bodySmall (12px)', style: textTheme.bodySmall),
          Gaps.v8,
          Text('labelSmall (10px)', style: textTheme.labelSmall),

          Gaps.v32,

          // ── 버튼 미리보기 ──
          Text('버튼 스타일', style: textTheme.headlineLarge),
          Gaps.v16,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('ElevatedButton'),
            ),
          ),
          Gaps.v12,
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('OutlinedButton'),
            ),
          ),
          Gaps.v12,
          TextButton(onPressed: () {}, child: const Text('TextButton')),

          Gaps.v32,

          // ── 의미 색상 미리보기 ──
          Text('의미 색상', style: textTheme.headlineLarge),
          Gaps.v16,
          _ColorChip(label: 'Success', color: AppColor.success),
          Gaps.v8,
          _ColorChip(label: 'Warning', color: AppColor.warning),
          Gaps.v8,
          _ColorChip(label: 'Error', color: AppColor.error),
          Gaps.v8,
          _ColorChip(label: 'Info', color: AppColor.info),

          Gaps.v32,
        ],
      ),
    );
  }
}

class _ColorChip extends StatelessWidget {
  final String label;
  final Color color;

  const _ColorChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Gaps.h12,
        Text(label, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
