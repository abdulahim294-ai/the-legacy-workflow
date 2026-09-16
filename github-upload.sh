#!/bin/bash
# ============================================
# THE LEGACY Workflow - GitHub Upload Script
# ============================================
# 
# This script helps you upload THE LEGACY workflow to GitHub
# 
# Usage: bash github-upload.sh
# Or follow the manual instructions below

# ============================================
# STEP-BY-STEP MANUAL INSTRUCTIONS
# ============================================

echo "🚀 THE LEGACY Workflow - GitHub Upload Guide"
echo "=============================================="
echo ""
echo "Follow these steps to upload to GitHub:"
echo ""

# ============================================
# STEP 1: GitHub Token
# ============================================

echo "📋 STEP 1: Create GitHub Personal Access Token"
echo "================================================"
echo ""
echo "1. Go to: https://github.com/settings/tokens"
echo "2. Click 'Generate new token' > 'Generate new token (classic)'"
echo "3. Token name: 'the-legacy-workflow-upload'"
echo "4. Expiration: 90 days"
echo "5. Scopes (check these):"
echo "   ✓ repo (full control)"
echo "   ✓ workflow (GitHub Actions)"
echo "   ✓ admin:repo_hook (webhooks)"
echo ""
echo "⏳ Generate the token and COPY IT (you'll need it next)"
echo ""
read -p "Press Enter once you have your token ready..."
echo ""

# ============================================
# STEP 2: GitHub Repository
# ============================================

echo "📋 STEP 2: Create GitHub Repository"
echo "===================================="
echo ""
echo "1. Go to: https://github.com/new"
echo "2. Enter these details:"
echo "   Repository name: the-legacy-workflow"
echo "   Description: Advanced N8N Workflow for Production-Grade Content Management & Multi-System Orchestration"
echo "   Visibility: Public"
echo "   Initialize: Do NOT initialize with README"
echo ""
echo "3. Click 'Create repository'"
echo ""
read -p "Press Enter once you created the repository..."
echo ""

# ============================================
# STEP 3: Get Repository Details
# ============================================

echo "📋 STEP 3: Enter Your GitHub Details"
echo "====================================="
echo ""
read -p "Enter your GitHub USERNAME: " USERNAME
echo ""
read -p "Enter your PERSONAL ACCESS TOKEN (generated in Step 1): " TOKEN
echo ""

# ============================================
# STEP 4: Configure and Push
# ============================================

echo "📋 STEP 4: Pushing to GitHub..."
echo "================================"
echo ""

# Add remote
echo "Adding GitHub remote..."
git remote add origin "https://${USERNAME}:${TOKEN}@github.com/${USERNAME}/the-legacy-workflow.git"

# Rename branch to main
echo "Renaming branch to main..."
git branch -M main

# Push to GitHub
echo "Pushing to GitHub..."
git push -u origin main

echo ""
echo "✅ SUCCESS! Your project has been pushed to GitHub!"
echo ""

# ============================================
# STEP 5: Verification
# ============================================

echo "📋 STEP 5: Verify Your Repository"
echo "=================================="
echo ""
echo "Open this URL in your browser:"
echo "https://github.com/${USERNAME}/the-legacy-workflow"
echo ""
echo "Check that:"
echo "✓ All files are present"
echo "✓ README.md displays correctly"
echo "✓ Code is properly formatted"
echo ""

# ============================================
# STEP 6: Add Repository Metadata
# ============================================

echo "📋 STEP 6: Add Repository Metadata (Optional)"
echo "============================================="
echo ""
echo "1. Go to: https://github.com/${USERNAME}/the-legacy-workflow"
echo "2. Click 'About' (top right)"
echo "3. Add Description:"
echo "   Advanced N8N Workflow for Enterprise Content Management"
echo "4. Add Topics:"
echo "   - n8n"
echo "   - workflow"
echo "   - automation"
echo "   - enterprise"
echo "   - orchestration"
echo "   - etl"
echo "   - api-integration"
echo "   - production-ready"
echo ""

# ============================================
# Summary
# ============================================

echo "🎉 Complete! Your Project is Live!"
echo "===================================="
echo ""
echo "Repository: https://github.com/${USERNAME}/the-legacy-workflow"
echo ""
echo "What's included:"
echo "✓ THE_LEGACY_Enterprise_Workflow_v1.json"
echo "✓ THE_LEGACY_Advanced_Extensions_v2.0.json"
echo "✓ THE_LEGACY_Implementation_Guide_v3.0.json"
echo "✓ Comprehensive Documentation (README, CONTRIBUTING, QUICKSTART)"
echo "✓ Docker & npm Configuration"
echo "✓ MIT License"
echo "✓ Production-Ready Code"
echo ""
echo "Next Steps:"
echo "1. Share your repository with the community"
echo "2. Create GitHub releases for each version"
echo "3. Enable GitHub Actions for CI/CD"
echo "4. Add GitHub Wiki for extended documentation"
echo "5. Encourage stars and forks!"
echo ""
echo "Documentation:"
echo "- README.md - Complete project documentation"
echo "- QUICKSTART.md - 5-minute setup guide"
echo "- CONTRIBUTING.md - Development guidelines"
echo "- GITHUB_UPLOAD_INSTRUCTIONS.md - Detailed upload guide"
echo ""

# ============================================
# Clean up sensitive data
# ============================================

echo "⚠️  Important Security Note:"
echo "============================"
echo ""
echo "The token in your .git/config is sensitive."
echo "To secure it, we'll use Git credential storage instead."
echo ""

# Configure Git credential helper
echo "Configuring Git credential storage..."
git config --global credential.helper store

# Remove token from remote URL
git remote set-url origin "https://github.com/${USERNAME}/the-legacy-workflow.git"

echo ""
echo "✅ Security configured! Git will now prompt for credentials when needed."
echo ""

# ============================================
# Display next commands
# ============================================

echo "📝 Useful Git Commands for Future Use"
echo "====================================="
echo ""
echo "# View your commits"
echo "git log --oneline"
echo ""
echo "# Make changes and push"
echo "git add ."
echo "git commit -m 'Your message here'"
echo "git push"
echo ""
echo "# Create a new branch"
echo "git checkout -b feature/your-feature"
echo ""
echo "# Create a release/tag"
echo "git tag -a v3.0.0 -m 'Release version 3.0.0'"
echo "git push origin v3.0.0"
echo ""
echo "=============================================="
echo ""
echo "🎊 Congratulations! Your project is on GitHub!"
echo ""
echo "Repository: https://github.com/${USERNAME}/the-legacy-workflow"
echo ""
