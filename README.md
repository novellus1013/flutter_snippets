# flutter_snippets
개인 앱 개발 과정에서 반복적으로 발생하는 UI 통일성 부재 · 디자인 감각 부족 문제를 해결하기 위해 만든
최소 수준의 디자인 시스템 - Color, Spacing, TextSizes, ThemeData(light) - 입니다.
필요에 따라 추가, 수정, 삭제가 용이합니다.

## 📌 주요 구성 요소
### 1. AppColor
- 앱에서 자주 사용되는 black / white / error / grey 계열 3색
- primary , secondary
- primary와 secondary를 사용해 앱의 분위기 결정

### 2. AppSpacing
- 4px ~ 32px 범위의 6개의 값을 사용한 간격
- 앱 내 요소 간 간격을 일관성 있게 보여주기 위한 기본 단위

### 3. AppTextSizes
- 10px - 24px 범위의 7개의 값을 사용한 텍스트 크기 
- 앱 내 텍스트의 크기를 일관성 있게 보여주기 위한 기본 단위

### 4. Gaps
- AppSpacing을 사용한 vertical/horizontal 전용 Sizebox

### 5. AppTheme
- AppColor, AppSpacing, AppTextSizes를 사용해 만든 기본적인 ThemeData (현재 light만 구현)
- Scaffold 배경, TextTheme 일부, AppBar, ElevatedButton의 스타일 정의

## 📘 사용 방법
프로젝트에 필요한 파일을 복사한 뒤:
```
    import 'app_theme.dart';

    MaterialApp(
    theme: AppTheme.light,
    home: HomePage(),
    );
```

## 💡 Tips
- 코드 작성하다 궁금하거나 헷갈렸던 부분 주석으로 정리
- 디자인 기준점(spacing / text size / color)을 만들어두어 프로젝트가 커져도 유지보수 비용이 적음
- 앱 개발 중 필요하면 추가, 수정, 삭제


## 🚧 차후 업데이트 예정
- AppTheme.dark() 추가
- 개인 프로젝트에 적용해 보면서 필요한 개선 내용 누적 업데이트