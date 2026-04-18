# GitHub Actions

## Workflows

### Deploy Documentation

File: `.github/workflows/deploy-docs.yml`

Trigger: Push to `main` when `docs/**` or `mkdocs.yml` changes

Jobs:
1. Checkout
2. Setup Python
3. Install dependencies
4. Build documentation
5. Setup Pages
6. Upload artifact
7. Deploy to GitHub Pages

## Required Secrets

None required for public repository.

## Required Permissions

- `contents: read`
- `pages: write`
- `id-token: write`