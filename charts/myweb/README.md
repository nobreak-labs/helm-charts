# MyWeb Helm Chart

Go로 작성된 웹 애플리케이션을 Kubernetes에 배포하기 위한 Helm 차트입니다.

## 요구사항

- Kubernetes 1.19+
- Helm 3.0+

## 파라미터

### 기본 설정

| 파라미터 | 설명 | 기본값 | 사용 가능한 값 |
|----------|------|--------|--------------|
| replicaCount | 복제본 수 | 1 | 양의 정수 |

### 이미지 설정

| 파라미터 | 설명 | 기본값 | 사용 가능한 값 |
|----------|------|--------|--------------|
| image.repository | 컨테이너 이미지 저장소 | ghcr.io/nobreak-labs/myweb | - |
| image.tag | 이미지 태그 | stable | 1.0, 1.1, 1.2, stable, latest ... |
| image.pullPolicy | 이미지 풀 정책 | IfNotPresent | Always, IfNotPresent, Never |

### 서비스 설정

| 파라미터 | 설명 | 기본값 | 사용 가능한 값 |
|----------|------|--------|--------------|
| service.type | 서비스 타입 | ClusterIP | ClusterIP, NodePort, LoadBalancer |
| service.port | 서비스 포트 | 80 | 1-65535 |
| service.nodePort | 노드 포트 (NodePort/LoadBalancer 타입 시) | - | 30000-32767 |

### 리소스 설정

| 파라미터 | 설명 | 기본값 |
|----------|------|--------|
| resources.requests.cpu | CPU 요청량 | 100m |
| resources.requests.memory | 메모리 요청량 | 64Mi |
| resources.limits.cpu | CPU 제한량 | 500m |
| resources.limits.memory | 메모리 제한량 | 256Mi |

### 헬스체크 설정

| 파라미터 | 설명 | 기본값 |
|----------|------|--------|
| livenessProbe.httpGet.path | Liveness 프로브 경로 | /live |
| livenessProbe.httpGet.port | Liveness 프로브 포트 | 8080 |
| livenessProbe.initialDelaySeconds | Liveness 프로브 시작 지연 | 3 |
| livenessProbe.periodSeconds | Liveness 프로브 주기 | 10 |
| readinessProbe.httpGet.path | Readiness 프로브 경로 | /ready |
| readinessProbe.httpGet.port | Readiness 프로브 포트 | 8080 |
| readinessProbe.initialDelaySeconds | Readiness 프로브 시작 지연 | 2 |
| readinessProbe.periodSeconds | Readiness 프로브 주기 | 5 |
| startupProbe.httpGet.path | Startup 프로브 경로 | /startup |
| startupProbe.httpGet.port | Startup 프로브 포트 | 8080 |
| startupProbe.failureThreshold | Startup 프로브 실패 임계값 | 30 |
| startupProbe.periodSeconds | Startup 프로브 주기 | 2 |

## 차트 설치

### 기본 설치

```bash
helm install myweb nobreak-labs/myweb
```

### 사용자 정의 설치

```bash
# values.yaml 파일로 설치
helm install myweb nobreak-labs/myweb -f values.yaml

# 명령행에서 직접 값 설정
helm install myweb nobreak-labs/myweb \
  --set replicaCount=3 \
  --set service.type=LoadBalancer
```

## 차트 업그레이드

```bash
# 기본 업그레이드
helm upgrade myweb nobreak-labs/myweb

# 새로운 값과 함께 업그레이드
helm upgrade myweb nobreak-labs/myweb -f values.yaml

# 특정 값 변경
helm upgrade myweb nobreak-labs/myweb \
  --set image.tag="1.1" \
  --set replicaCount=5
```

## 차트 삭제

```bash
helm uninstall myweb
```
