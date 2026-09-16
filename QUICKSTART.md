# 🚀 THE LEGACY Workflow - Quick Start Guide

Get up and running with THE LEGACY workflow in **5 minutes**!

---

## 📋 Prerequisites

- Docker & Docker Compose (optional but recommended)
- Node.js 18+
- Git
- Text editor (VS Code recommended)

---

## ⚡ Quick Start (5 minutes)

### 1. Clone & Setup (1 min)

```bash
# Clone the repository
git clone https://github.com/your-username/the-legacy-workflow.git
cd the-legacy-workflow

# Copy environment file
cp .env.example .env

# Edit .env with your credentials (see Step 2)
nano .env  # or open in your editor
```

### 2. Get Your Credentials (2 min)

You'll need these API keys:

#### Google Drive
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create new project or select existing
3. Enable Google Drive API
4. Create OAuth 2.0 credentials (Desktop application)
5. Add credentials to `.env`:
   ```
   GOOGLE_DRIVE_CLIENT_ID=your_client_id
   GOOGLE_DRIVE_CLIENT_SECRET=your_client_secret
   ```

#### Anthropic Claude
1. Visit [Anthropic Console](https://console.anthropic.com/)
2. Create API key
3. Add to `.env`:
   ```
   ANTHROPIC_API_KEY=sk-ant-your-api-key
   ```

#### GitHub (Optional)
1. Go to [GitHub Settings > Tokens](https://github.com/settings/tokens)
2. Create Personal Access Token with `repo` scope
3. Add to `.env`:
   ```
   GITHUB_TOKEN=ghp_your_token
   ```

#### Slack (Optional)
1. Create Slack App at [Slack API](https://api.slack.com/apps)
2. Get Bot Token from "OAuth & Permissions"
3. Add to `.env`:
   ```
   SLACK_BOT_TOKEN=xoxb-your-token
   ```

### 3. Start Services with Docker (1 min)

```bash
# Start all services
docker-compose up -d

# Verify services are running
docker-compose ps

# Expected output:
# NAME                      STATUS
# n8n-workflow-engine       Up (healthy)
# the-legacy-postgres       Up (healthy)
# the-legacy-redis          Up (healthy)
```

### 4. Import Workflow (1 min)

**Option A: Via Web UI (Easiest)**

1. Open N8N: http://localhost:5678
2. Menu → Import Workflow
3. Select: `THE_LEGACY_Enterprise_Workflow_v1.json`
4. Click Import

**Option B: Via CLI**

```bash
npm install -g n8n
n8n workflow:import --file THE_LEGACY_Enterprise_Workflow_v1.json
```

### 5. Verify & Test (Optional)

```bash
# Test database connection
npm run credentials:test

# Expected: ✅ All credentials connected successfully

# Run health check
npm run health:check

# Execute workflow manually
curl -X POST http://localhost:5678/webhook/the-legacy-workflow
```

---

## 📊 Next Steps

### Access Administrative UIs

| Tool | URL | Purpose |
|------|-----|---------|
| N8N | http://localhost:5678 | Workflow editor |
| PgAdmin | http://localhost:5050 | Database management |
| Redis Commander | http://localhost:8081 | Cache management |
| Adminer | http://localhost:8080 | Database browser |

### Common Tasks

#### Run Workflow Manually
```bash
# Via N8N UI
1. Open http://localhost:5678
2. Select "THE LEGACY" workflow
3. Click "Execute Workflow" button

# Via API
curl -X POST http://localhost:5678/webhook/the-legacy-workflow
```

#### View Logs
```bash
# View N8N logs
docker-compose logs -f n8n

# View database logs
docker-compose logs -f postgres

# View recent logs (last 100 lines)
docker-compose logs --tail=100 n8n
```

#### Stop Services
```bash
# Stop all services
docker-compose down

# Stop and remove volumes (WARNING: deletes data!)
docker-compose down -v

# Stop specific service
docker-compose stop n8n
```

#### Reset Everything
```bash
# Remove all containers and volumes
docker-compose down -v

# Remove workflow data
rm -rf n8n_data

# Restart fresh
docker-compose up -d
```

---

## 🔧 Configuration

### Database Setup

After starting, the database schema is created automatically. To verify:

```bash
# Connect to database
docker-compose exec postgres psql -U postgres -d the_legacy

# List tables
\dt

# Exit
\q
```

### Workflow Customization

Edit the workflow in N8N UI:
1. Open http://localhost:5678
2. Select "THE LEGACY" workflow
3. Modify nodes as needed
4. Save and test

---

## 🐛 Troubleshooting

### Issue: Cannot connect to Docker

```bash
# Solution: Start Docker Desktop or daemon
# macOS/Windows: Open Docker Desktop application
# Linux: sudo systemctl start docker
```

### Issue: Port already in use

```bash
# Find which process is using the port
lsof -i :5678

# Either kill the process or change the port in .env
N8N_PORT=5679
```

### Issue: Database connection failed

```bash
# Check if postgres is healthy
docker-compose ps

# If not healthy, restart it
docker-compose restart postgres

# View postgres logs
docker-compose logs postgres
```

### Issue: Google Drive credentials invalid

```bash
# Re-generate credentials
# 1. Go to Google Cloud Console
# 2. Delete old OAuth credentials
# 3. Create new OAuth 2.0 credentials
# 4. Update .env file
# 5. Restart N8N: docker-compose restart n8n
```

### Issue: Workflow not executing

```bash
# Check N8N logs
docker-compose logs -f n8n

# Verify workflow is enabled
# In N8N UI: Workflow > Settings > Active/Inactive toggle

# Check database connectivity
npm run credentials:test
```

---

## 📚 Learning Resources

### Documentation
- [Full README](README.md) - Complete documentation
- [Architecture Guide](docs/ARCHITECTURE.md) - System design
- [API Reference](docs/API_REFERENCE.md) - Endpoint documentation
- [Best Practices](docs/BEST_PRACTICES.md) - Operational guidelines

### N8N Resources
- [N8N Documentation](https://docs.n8n.io/)
- [N8N Community](https://community.n8n.io/)
- [N8N YouTube](https://www.youtube.com/c/n8nofficial)

### Video Tutorials (Coming Soon)
- Installation & Setup
- Workflow Configuration
- API Integration Guide
- Monitoring & Troubleshooting

---

## 🎯 Common Use Cases

### Use Case 1: Daily Asset Sync

**Objective**: Automatically sync assets from Google Drive daily

**Steps**:
1. Open workflow in N8N UI
2. Find the "Google Drive Asset Discovery" node
3. Configure Google Drive folder ID
4. Set schedule to daily (2 AM UTC)
5. Save and activate

### Use Case 2: Real-Time Slack Alerts

**Objective**: Send Slack notifications on workflow failures

**Steps**:
1. Add Slack node to error handler
2. Configure Slack channel
3. Set message template
4. Test with manual execution
5. Deploy to production

### Use Case 3: Generate AI Insights

**Objective**: Use Claude to analyze production assets

**Steps**:
1. Customize Claude prompt in workflow
2. Configure analysis focus areas
3. Set up result database persistence
4. Schedule analysis frequency
5. Monitor results in dashboards

---

## 📞 Need Help?

### Quick Resources
- 📖 [Documentation](docs/)
- 🔍 [GitHub Issues](https://github.com/your-username/the-legacy-workflow/issues)
- 💬 [GitHub Discussions](https://github.com/your-username/the-legacy-workflow/discussions)
- 📧 Support: support@yourcompany.com

### Reporting Bugs
When reporting issues, include:
1. Error message (full text)
2. Steps to reproduce
3. Environment info (OS, Node version, Docker version)
4. Screenshot or log output
5. What you expected vs. what happened

---

## 🚀 Production Deployment

Ready to deploy to production? See [DEPLOYMENT.md](docs/DEPLOYMENT.md)

Quick checklist:
- ✅ All credentials configured
- ✅ Database backups enabled
- ✅ Monitoring stack running
- ✅ SSL/TLS configured
- ✅ Rate limiting enabled
- ✅ Error alerting set up
- ✅ Documentation reviewed
- ✅ Team trained

---

## 📊 System Requirements

### Minimum
- 2 CPU cores
- 4GB RAM
- 10GB storage
- PostgreSQL 12+
- Redis 6+

### Recommended
- 4+ CPU cores
- 8GB+ RAM
- 50GB+ storage
- PostgreSQL 15+
- Redis 7+

### Production
- 8+ CPU cores
- 16GB+ RAM
- 100GB+ storage
- High-availability PostgreSQL
- Redis Cluster
- Load balancer (Nginx/HAProxy)

---

## 💾 Backup & Recovery

### Backup Workflow

```bash
# Export workflow
npm run workflow:export

# Backup database
docker-compose exec postgres pg_dump -U postgres -d the_legacy > backup.sql

# Backup volumes
docker run --rm -v n8n_data:/data -v $(pwd):/backup \
  alpine tar czf /backup/n8n_data.tar.gz /data
```

### Restore Workflow

```bash
# Restore database
docker-compose exec -T postgres psql -U postgres -d the_legacy < backup.sql

# Restore volumes
docker run --rm -v n8n_data:/data -v $(pwd):/backup \
  alpine tar xzf /backup/n8n_data.tar.gz -C /
```

---

## 🎓 Next Learning Steps

1. **Understand the Workflow** (15 min)
   - Read workflow overview in N8N UI
   - Review each node's configuration
   - Understand data flow

2. **Customize for Your Use Case** (30 min)
   - Modify API endpoints
   - Configure database tables
   - Set up custom fields

3. **Set Up Monitoring** (20 min)
   - Enable performance metrics
   - Configure alerting thresholds
   - Create custom dashboards

4. **Deploy to Production** (1 hour)
   - Set up Kubernetes manifests
   - Configure CI/CD pipeline
   - Set up SSL certificates

---

## 🎉 Success!

You now have THE LEGACY workflow running! Next steps:

1. Open N8N at http://localhost:5678
2. Explore the workflow nodes
3. Test with sample data
4. Customize for your needs
5. Join the community for support

Happy automating! 🚀

---

<div align="center">

**Made with ❤️ by the Community**

[📖 Back to README](README.md) | [🔧 Configuration Guide](docs/CONFIGURATION.md) | [📚 Full Documentation](docs/)

</div>
