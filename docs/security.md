# Security

## Security Features

| Feature | Implementation | DEV | KIOSK |
|---------|---------------|-----|------|
| Non-root user | dev/tui | ✅ | ✅ |
| No sudo | N/A | ✅ | ❌ |
| Immutable | Read-only config | ❌ | ✅ |
| Network isolation | Bridge network | ✅ | ✅ |

## Best Practices

- Never run as root in production
- Use KIOSK mode for public endpoints
- Update base images regularly
- Scan images for vulnerabilities