# Helm Chart Release Guide

이 문서는 Nobreak Labs Helm 차트 저장소에서 차트 패키징 및 배포 프로세스를 설명합니다.

## 차트 배포 프로세스

### 1. 차트 개발 (main 브랜치)

```bash
# 차트 수정 및 커밋
git checkout main
git add charts/
git commit -m "Update chart"
git push origin main
```

### 2. gh-pages 브랜치로 전환

```bash
git checkout gh-pages
```

### 3. 기존 패키지 정리

```bash
rm *.tgz
```

### 4. 최신 차트 가져오기

```bash
git checkout main -- charts/
```

### 5. 차트 패키징

```bash
# go-myweb 차트 패키징
helm package charts/go-myweb

# 또는 특정 차트
helm package charts/chart-name
```

### 6. 저장소 인덱스 생성

```bash
helm repo index . --url https://nobreak-labs.github.io/helm-charts
```

### 7. 소스 디렉토리 정리

```bash
rm -rf charts/
```

### 8. 변경사항 커밋 및 푸시

```bash
git add .
git commit -m "Release: Update charts and index"
git push origin gh-pages
```
