# Flutter Design System

주니어 개발자가 디자인 고민 없이 앱을 만들 수 있도록 설계한 Flutter 디자인 시스템입니다.
색상, 간격, 텍스트, 반응형, 테마(라이트/다크)를 포함하며, 프로젝트에 복사해서 바로 사용할 수 있습니다.

## 파일 구조

```
lib/
  constants/
    app_breakpoints.dart   - 화면 크기 기준점 (모바일/태블릿)
    app_color.dart         - 색상 상수 (브랜드, 의미, 표면, 다크 모드)
    app_duration.dart      - 애니메이션 시간 상수
    app_elevation.dart     - 그림자 높이 상수
    app_icon_sizes.dart    - 아이콘 크기 상수
    app_opacity.dart       - 투명도 상수
    app_radius.dart        - 테두리 둥글기 상수
    app_spacing.dart       - 간격(패딩, 마진) 상수
    app_text_sizes.dart    - 텍스트 크기 상수
    app_theme.dart         - 라이트/다크 테마 정의
    gaps.dart              - SizedBox 간격 위젯 모음
  responsive/
    app_responsive.dart    - 반응형 유틸리티 + BuildContext 확장
    responsive_builder.dart - 반응형 빌더 위젯
```

## 주요 구성 요소

### AppColor
- 브랜드 색상: `primary`, `secondary`
- 중립 색상: `black`, `white`, `backgroundGrey`, `borderGrey`, `textGrey`
- 의미 색상: `error`, `success`, `warning`, `info`
- 표면/오버레이: `surface`, `overlay`
- 비활성화: `disabled`, `disabledText`
- 다크 모드: `darkBackground`, `darkSurface`, `darkBorderGrey`, `darkTextGrey`

### AppSpacing
4px 기반의 일관된 간격 체계 (티셔츠 사이징):

| 이름 | 값 | 용도 |
|------|-----|------|
| xxs | 2px | 극소 간격 (미세 조정) |
| xs | 4px | 아이콘과 텍스트 사이 |
| sm | 8px | 칩 나열, 태그 목록 |
| md | 12px | 제목과 부제 사이 |
| lg | 16px | 화면 좌우 패딩, 카드 내부 패딩 |
| xl | 24px | 큰 섹션 사이 간격 |
| xxl | 32px | 화면 상단/하단 큰 간격 |
| xxxl | 48px | 로그인/온보딩 섹션 간격 |
| xxxxl | 64px | 히어로 섹션, 스플래시 요소 배치 |

### AppTextSizes
| 이름 | 값 | 용도 | 추천 fontWeight |
|------|-----|------|----------------|
| xs | 10px | 타임스탬프, 작은 보조 텍스트 | w300~w400 |
| sm | 12px | 작은 라벨, 입력 필드 설명 | w400~w500 |
| md | 14px | 본문 보조 텍스트, 서브 설명 | w400 |
| base | 16px | 기본 본문 텍스트 | w400~w500 |
| lg | 18px | 카드 제목, 섹션 제목 | w600 |
| xl | 20px | 화면 제목(AppBar) | w600~w700 |
| display1 | 24px | 홈 화면 헤더 | w700 |
| display2 | 32px | 히어로/온보딩 제목 | w700~w800 |
| display3 | 40px | 큰 숫자 표시 (가격, 통계) | w700~w800 |

### Gaps
`AppSpacing`을 사용한 SizedBox 위젯 모음:
```dart
Column(
  children: [
    Text('제목'),
    Gaps.v8,       // 세로 8px 간격
    Text('본문'),
  ],
)
```

### AppRadius / AppDuration / AppElevation / AppIconSizes / AppOpacity
자주 사용하는 값들을 상수로 정의하여 일관성 유지:
```dart
Container(
  decoration: BoxDecoration(
    borderRadius: AppRadius.md,                    // 8px 둥글기
    boxShadow: [BoxShadow(blurRadius: AppElevation.sm)],
  ),
)

AnimatedContainer(duration: AppDuration.normal)    // 300ms

Icon(Icons.home, size: AppIconSizes.md)            // 24px
```

### 반응형 시스템
모바일(< 600px)과 태블릿(>= 600px) 레이아웃을 지원:
```dart
// BuildContext 확장으로 간편하게 사용
final columns = context.responsive(mobile: 2, tablet: 4);

if (context.isMobile) { ... }

// 완전히 다른 레이아웃이 필요할 때
ResponsiveBuilder(
  mobile: (context) => MobileLayout(),
  tablet: (context) => TabletLayout(),
)

// 태블릿에서 콘텐츠 너비 제한
ResponsiveContainer(
  maxWidth: 600,
  child: MyContent(),
)
```

### AppTheme
라이트/다크 테마를 모두 지원하며, 다음 컴포넌트 테마가 포함되어 있습니다:
- TextTheme (display, headline, title, body, label 전체)
- AppBar, ElevatedButton, OutlinedButton, TextButton
- InputDecoration, Card, NavigationBar, Divider

## 사용 방법

프로젝트에 `constants/`와 `responsive/` 폴더를 복사한 뒤:
```dart
MaterialApp(
  theme: AppTheme.light,
  darkTheme: AppTheme.dark,
  themeMode: ThemeMode.system,  // 시스템 설정에 따라 자동 전환
  home: HomePage(),
)
```

## 커스텀 폰트 적용 방법

### 방법 1: 로컬 폰트 파일 (Pretendard 등)

**1단계:** 폰트 파일을 `assets/fonts/` 폴더에 넣기

**2단계:** `pubspec.yaml`에 폰트 등록:

**3단계:** `app_theme.dart`에서 적용:
```dart
// light / dark getter 내부에서 textTheme 빌드 후 fontFamily 적용
final textTheme = _buildTextTheme(
  base.textTheme,
  AppColor.black,
  AppColor.textGrey,
).apply(fontFamily: 'Pretendard');
```

### 방법 2: Google Fonts 패키지 (Noto Sans KR 등)

**1단계:** 패키지 추가:
```bash
flutter pub add google_fonts
```

**2단계:** `app_theme.dart`에서 적용:
```dart
import 'package:google_fonts/google_fonts.dart';

// light / dark getter 내부에서 base.textTheme 대신 Google Fonts 텍스트 테마 전달
final textTheme = _buildTextTheme(
  GoogleFonts.notoSansKrTextTheme(base.textTheme),
  AppColor.black,
  AppColor.textGrey,
);
```