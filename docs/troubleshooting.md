# Troubleshooting

## Common Issues

### Container Won't Start

```bash
docker compose logs
docker compose ps
```

### Permission Denied

```bash
chmod +x *.sh
```

### Network Issues

```bash
docker compose down
docker network prune
docker compose up
```

### Disk Space

```bash
docker system prune -a
```