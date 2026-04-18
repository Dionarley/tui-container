# RELEASE.md - Release Procedures

This document describes the release process for TUI Container project.

---

## Versioning

We use **Semantic Versioning (SemVer)**:

```
v<major>.<minor>.<patch>
```

- **MAJOR**: Breaking changes (e.g., removed features, changed behavior)
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

### Version History

| Version | Date | Status |
|---------|-----|--------|
| v1.0.0 | 2026-04-18 | Current |

---

## Release Schedule

Releases are done **per feature complete**, meaning:

1. Features, fixes, or refactoring are completed in `feature/*`, `bugfix/*`, or `refactor/*` branches
2. Merged into `develop` after code review
3. When enough changes accumulate, create a `release/*` branch
4. Final testing and documentation
5. Merge to `main` and tag release

---

## Release Checklist

Before releasing, ensure:

- [ ] All features/fixes merged to `develop`
- [ ] Dockerfile builds pass
- [ ] Containers start correctly (DEV and KIOSK)
- [ ] Interactive testing passed
- [ ] CHANGELOG.md updated
- [ ] Documentation updated
- [ ] No sensitive data in repository

---

## Release Process

### 1. Prepare Release Branch

```bash
# Ensure clean develop
git checkout develop
git pull origin develop

# Create release branch
git checkout -b release/v1.1.0 develop
```

### 2. Update Version and Changelog

```bash
# Edit CHANGELOG.md
# Update version if needed
```

### 3. Final Testing

```bash
# Build and test
./build.sh all

# Test dev container
./run-dev.sh

# Test kiosk container
./run-kiosk.sh
```

### 4. Merge to Main

```bash
# Checkout main
git checkout main

# Merge release
git merge release/v1.1.0

# Tag release
git tag v1.1.0

# Push
git push origin main --tags
```

### 5. Merge Back to Develop

```bash
# Checkout develop
git checkout develop

# Merge main
git merge main

# Push
git push origin develop
```

### 6. Cleanup

```bash
# Delete release branch
git branch -d release/v1.1.0
git push origin --delete release/v1.1.0
```

---

## Hotfix Process (Urgent Fixes)

For critical fixes in production:

```bash
# Create hotfix from main
git checkout -b hotfix/fix-description main

# Make fix
# Test
git commit -m "fix: description"

# Merge to main
git checkout main
git merge hotfix/fix-description

# Tag patch
git tag v1.0.1

# Push
git push origin main --tags

# Merge to develop
git checkout develop
git merge main
git push origin develop

# Cleanup
git branch -d hotfix/fix-description
```

---

## Rollback Procedure

If release causes issues:

```bash
# Revert to previous tag
git checkout <previous-tag>
docker compose build

# Document issue in issues tracker
```

---

## Distribution

After release, consider:

- Push images to registry
- Update documentation links
- Announce release (if applicable)

---

## Support

For release issues or questions, please open an issue.