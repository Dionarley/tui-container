# CI/CD Pipeline

## Workflow

```
canary → main → release
  │         │
  ▼         ▼
tests/*   Docker Hub
```

## Branches

| Branch | Purpose | Auto-deploy |
|--------|---------|-------------|
| main | Production | ✅ |
| canary | Testing | ✅ |
| feature/* | Development | ❌ |

## Tags

- `v*` - Release tags

## Tests

Tests run on every push to `main` and `canary` branches.