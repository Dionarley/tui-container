# Contributing

## Development Workflow

```bash
git checkout -b feature/description develop
# Make changes
# Test
git commit -m "feat: description"
git push origin feature/description
# Create PR
```

## Testing

```bash
bash tests/test-all.sh
```

## Commit Message Format

```
<type>(<scope>): <description>

Types: feat, fix, refactor, docs, chore, test
```

## Submit

1. Fork repository
2. Create feature branch
3. Make changes
4. Test
5. Submit PR