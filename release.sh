#!/bin/bash
# release.sh

set -e

echo "🚀 Starting chart release process..."

# Switch to gh-pages
git checkout gh-pages

# Clean old packages
echo "🧹 Cleaning old packages..."
rm -f *.tgz

# Get latest charts
echo "📦 Getting latest charts..."
git checkout main -- charts/

# Package all charts
echo "📦 Packaging charts..."
for chart in charts/*/; do
  if [ -f "$chart/Chart.yaml" ]; then
    helm package "$chart"
  fi
done

# Update index
echo "📝 Updating repository index..."
helm repo index . --url https://nobreak-labs.github.io/helm-charts

# Clean up
rm -rf charts/

# Commit and push
echo "🚀 Publishing changes..."
git add .
git commit -m "Release: Update charts and index $(date)"
git push origin gh-pages

echo "✅ Release completed successfully!"
git checkout main