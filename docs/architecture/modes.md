# Modes

## Comparison

| Feature | DEV Mode | KIOSK Mode |
|---------|---------|-----------|
| User | `dev` | `tui` |
| sudo | ✅ Yes | ❌ No |
| apk add | ✅ Yes | ❌ No |
| vim | ✅ Yes | ❌ No |
| Free shell | ✅ Yes | ❌ No |
| Fixed layout | ❌ No | ✅ Yes |
| Auto tmux | ❌ No | ✅ Yes |

## DEV Mode

Use for:
- Development
- Testing configurations
- Installing packages
- Editing files

```bash
./run-dev.sh
```

## KIOSK Mode

Use for:
- Production environments
- Thin clients
- Restricted environments

```bash
./run-kiosk.sh
```