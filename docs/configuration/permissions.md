# Permissions

## Fix Permissions

### Scripts

```bash
chmod +x run-dev.sh run-kiosk.sh build.sh
```

### Workspace

```bash
chown -R $(id -u):$(id -g) workspace/
```

### Config

```bash
chown -R $(id -u):$(id -g) config/
```

## Verify

```bash
ls -la *.sh
ls -la workspace/
```