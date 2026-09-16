# 🤝 Contributing to THE LEGACY Workflow

Thank you for your interest in contributing to THE LEGACY workflow! This document provides guidelines and instructions for contributing.

---

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Making Changes](#making-changes)
- [Testing](#testing)
- [Submitting Changes](#submitting-changes)
- [Pull Request Process](#pull-request-process)
- [Coding Standards](#coding-standards)
- [Commit Message Guidelines](#commit-message-guidelines)

---

## 📜 Code of Conduct

### Our Commitment

We are committed to providing a welcoming and inclusive environment for all contributors regardless of:
- Age, body size, disability, ethnicity, gender identity and expression
- Level of experience, education, socioeconomic status
- Nationality, personal appearance, race, religion
- Sexual identity and orientation

### Expected Behavior

- Use welcoming and inclusive language
- Be respectful of differing opinions, viewpoints, and experiences
- Accept constructive criticism gracefully
- Focus on what is best for the community
- Show empathy towards other community members

### Unacceptable Behavior

- Harassment or discrimination in any form
- Insulting or derogatory comments
- Personal attacks or trolling
- Publishing others' private information
- Other conduct which could reasonably be considered inappropriate

### Reporting Issues

Report Code of Conduct violations to: conduct@yourcompany.com

---

## 🚀 Getting Started

### 1. Fork the Repository

```bash
# Visit https://github.com/your-username/the-legacy-workflow
# Click "Fork" button in top-right corner
```

### 2. Clone Your Fork

```bash
git clone https://github.com/YOUR-USERNAME/the-legacy-workflow.git
cd the-legacy-workflow
```

### 3. Add Upstream Remote

```bash
git remote add upstream https://github.com/your-username/the-legacy-workflow.git
git remote -v  # Verify both origin and upstream
```

### 4. Create a Branch

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-bug-fix
# or
git checkout -b docs/your-documentation
```

---

## 💻 Development Setup

### Prerequisites

- Node.js 18+
- npm or yarn
- Docker & Docker Compose
- Git
- Text Editor (VS Code recommended)

### Initial Setup

```bash
# Install dependencies
npm install

# Install N8N globally
npm install -g n8n

# Copy environment template
cp .env.example .env

# Edit .env with your local configuration
nano .env

# Start N8N locally
docker-compose up -d

# Run development server
npm run dev
```

### Project Structure

```
the-legacy-workflow/
├── workflows/
│   ├── THE_LEGACY_Enterprise_Workflow_v1.json
│   ├── THE_LEGACY_Advanced_Extensions_v2.0.json
│   └── THE_LEGACY_Implementation_Guide_v3.0.json
├── docs/
│   ├── ARCHITECTURE.md
│   ├── API_REFERENCE.md
│   ├── CONFIGURATION.md
│   ├── TROUBLESHOOTING.md
│   └── BEST_PRACTICES.md
├── tests/
│   ├── unit/
│   ├── integration/
│   └── e2e/
├── migrations/
│   └── *.sql
├── src/
│   ├── utils/
│   ├── validators/
│   └── transformers/
├── .github/
│   ├── workflows/
│   └── ISSUE_TEMPLATE/
├── .env.example
├── package.json
├── README.md
├── CONTRIBUTING.md
└── LICENSE
```

---

## 🔄 Making Changes

### Types of Contributions

#### 🐛 Bug Fixes
- Fix workflow logic errors
- Correct integration issues
- Improve error handling
- Update dependencies

#### ✨ Features
- Add new integration points
- Enhance data processing
- Improve monitoring
- Expand AI capabilities

#### 📚 Documentation
- Update README
- Write API documentation
- Create tutorials
- Improve comments

#### 🧪 Tests
- Add unit tests
- Create integration tests
- Write e2e tests
- Improve test coverage

### Workflow Changes

#### Modifying a Workflow Node

1. Open N8N UI: `http://localhost:5678`
2. Navigate to THE LEGACY workflow
3. Make your changes to the node
4. Export the updated workflow:
   - Menu → Download → JSON
5. Save to `workflows/` directory
6. Update version number in file name

#### Example: Updating a Node

```json
{
  "name": "Updated Node Name",
  "type": "n8n-nodes-base.httpRequest",
  "typeVersion": 4.1,
  "position": [450, 100],
  "parameters": {
    "method": "POST",
    "url": "=https://api.example.com/endpoint",
    "authentication": "genericCredentialType",
    "sendBody": true,
    "bodyParameters": {
      "parameters": [
        {
          "name": "param1",
          "value": "={{$node[\"Previous Node\"].json.data}}"
        }
      ]
    }
  }
}
```

---

## 🧪 Testing

### Running Tests

```bash
# Run all tests
npm run test

# Run unit tests only
npm run test:unit

# Run integration tests
npm run test:integration

# Run e2e tests
npm run test:e2e

# Run tests with coverage
npm run test:coverage

# Watch mode (re-run on file changes)
npm run test:watch
```

### Writing Tests

#### Unit Test Example

```javascript
// tests/unit/validators.test.js
const { validateWorkflowData } = require('../../src/validators');

describe('Workflow Data Validation', () => {
  test('should validate correct data structure', () => {
    const data = {
      file_id: '123abc',
      file_type: 'application/json',
      timestamp: new Date().toISOString()
    };
    
    expect(() => validateWorkflowData(data)).not.toThrow();
  });

  test('should reject invalid file_id', () => {
    const data = {
      file_id: 123, // Should be string
      file_type: 'application/json',
      timestamp: new Date().toISOString()
    };
    
    expect(() => validateWorkflowData(data)).toThrow('Invalid file_id');
  });

  test('should require all required fields', () => {
    const data = {
      file_id: '123abc'
      // Missing file_type and timestamp
    };
    
    expect(() => validateWorkflowData(data)).toThrow('Missing required field');
  });
});
```

#### Integration Test Example

```javascript
// tests/integration/google-drive.integration.test.js
const { GoogleDriveIntegration } = require('../../src/integrations');

describe('Google Drive Integration', () => {
  let integration;

  beforeEach(() => {
    integration = new GoogleDriveIntegration({
      clientId: process.env.GOOGLE_CLIENT_ID,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET
    });
  });

  test('should authenticate successfully', async () => {
    const result = await integration.authenticate();
    expect(result.authenticated).toBe(true);
    expect(result.token).toBeDefined();
  });

  test('should list files from Drive', async () => {
    const files = await integration.listFiles('root');
    expect(Array.isArray(files)).toBe(true);
    expect(files[0]).toHaveProperty('id');
    expect(files[0]).toHaveProperty('name');
  });

  test('should handle authentication errors', async () => {
    const badIntegration = new GoogleDriveIntegration({
      clientId: 'invalid',
      clientSecret: 'invalid'
    });
    
    await expect(badIntegration.authenticate()).rejects.toThrow();
  });
});
```

### Test Coverage Goals

- Minimum 85% code coverage
- 100% coverage for critical paths
- All integration points tested
- Error scenarios covered

---

## 📮 Submitting Changes

### Before Submitting

1. ✅ Code follows project style guide
2. ✅ Self-review of your changes
3. ✅ Comments added for complex logic
4. ✅ No console logs or debug code
5. ✅ Tests written and passing
6. ✅ Documentation updated
7. ✅ No merge conflicts

### Commit Your Changes

```bash
# Stage changes
git add .

# Commit with meaningful message
git commit -m "feat: add new integration feature"

# Push to your fork
git push origin feature/your-feature-name
```

---

## 🔀 Pull Request Process

### Creating a Pull Request

1. **Update your branch**: 
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

2. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

3. **Create PR on GitHub**:
   - Visit your fork on GitHub
   - Click "Compare & Pull Request"
   - Fill in PR template

### PR Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Performance improvement

## Related Issues
Fixes #(issue number)

## How Has This Been Tested?
Describe testing approach

## Checklist
- [ ] Code follows style guidelines
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] No breaking changes
- [ ] All tests passing
- [ ] Approved by 2 reviewers
```

### PR Review Process

1. **Automated Checks**:
   - CI/CD pipeline runs
   - Code quality checks
   - Test coverage validation

2. **Manual Review**:
   - Code review by maintainers
   - Feedback and suggestions
   - Requested changes

3. **Approval**:
   - Minimum 2 approvals required
   - All conversations resolved
   - CI/CD passing

4. **Merge**:
   - Squash and merge (for cleaner history)
   - Delete feature branch
   - Close related issues

---

## 📝 Coding Standards

### JavaScript/JSON Standards

```javascript
// ✅ Good
const fetchUserData = async (userId) => {
  try {
    const response = await fetch(`/api/users/${userId}`);
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    const data = await response.json();
    return data;
  } catch (error) {
    logger.error('Failed to fetch user data:', error);
    throw error;
  }
};

// ❌ Bad
const fetch_user_data = (user_id) => {
  let data = fetch("/api/users/" + user_id);
  return data;
};
```

### Naming Conventions

- **Variables & Functions**: `camelCase`
- **Constants**: `UPPER_SNAKE_CASE`
- **Classes**: `PascalCase`
- **Files**: `kebab-case.js` or `PascalCase.js`

### Comments & Documentation

```javascript
/**
 * Fetches user data from the API
 * @param {string} userId - The user ID to fetch
 * @returns {Promise<Object>} User data object
 * @throws {Error} If API request fails
 * @example
 * const user = await fetchUserData('12345');
 */
const fetchUserData = async (userId) => {
  // Implementation...
};
```

### Workflow Node Standards

```json
{
  "parameters": {
    "description": "Clear, descriptive parameter names",
    "method": "POST",
    "url": "=https://api.example.com/endpoint",
    "authentication": "oauth2"
  },
  "name": "Descriptive Node Name",
  "type": "n8n-nodes-base.httpRequest",
  "typeVersion": 4.1,
  "position": [450, 100],
  "id": "node_id_descriptive"
}
```

---

## 💬 Commit Message Guidelines

### Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Type

- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only
- `style`: Code style changes (formatting, etc)
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Test additions or updates
- `chore`: Build, dependencies, tooling
- `ci`: CI/CD configuration

### Examples

```bash
# Feature
git commit -m "feat(google-drive): add batch file upload support"

# Bug fix
git commit -m "fix(error-handler): resolve exponential backoff timeout"

# Documentation
git commit -m "docs(readme): update installation instructions"

# Performance
git commit -m "perf(caching): implement three-tier cache strategy"

# Test
git commit -m "test(integration): add Supabase persistence tests"
```

### Commit Message Body

- Explain **what** and **why**, not **how**
- Include relevant context
- Reference issues: `Fixes #123`
- Keep lines under 72 characters

```
feat(workflow): add AI-powered analysis engine

Implement Claude Opus 5 integration for intelligent content analysis.
This enables automatic generation of insights and recommendations
for production assets.

- Add Claude API connector node
- Implement prompt engineering framework
- Add context management for token optimization
- Include error handling for API failures

Fixes #456
Relates to #789
```

---

## 📊 Development Workflow

### Feature Development

```bash
# 1. Create feature branch
git checkout -b feature/amazing-feature

# 2. Make changes and test
npm run dev
npm run test

# 3. Commit changes
git commit -m "feat: add amazing feature"

# 4. Push to fork
git push origin feature/amazing-feature

# 5. Create Pull Request on GitHub
```

### Bug Fixing

```bash
# 1. Create fix branch
git checkout -b fix/bug-description

# 2. Reproduce bug
# 3. Fix the issue
# 4. Add test case
npm run test

# 5. Commit and push
git commit -m "fix: resolve bug in error handling"
git push origin fix/bug-description
```

### Documentation Updates

```bash
# 1. Create docs branch
git checkout -b docs/topic

# 2. Update documentation
# 3. Verify formatting
npm run docs:build

# 4. Commit and push
git commit -m "docs: update configuration guide"
git push origin docs/topic
```

---

## 🆘 Getting Help

### Questions?

- 📖 Check [Documentation](docs/)
- 💬 Ask in [GitHub Discussions](https://github.com/your-username/the-legacy-workflow/discussions)
- 🐛 Search [GitHub Issues](https://github.com/your-username/the-legacy-workflow/issues)
- 📧 Email: support@yourcompany.com

### Found a Bug?

1. Check existing issues
2. Create detailed bug report
3. Include reproduction steps
4. Attach logs/screenshots

---

## 🎉 Recognition

All contributors will be recognized in:
- README.md Contributors section
- Release notes
- Project history

Thank you for contributing to THE LEGACY workflow! 🙏

---

<div align="center">

**Happy Contributing!** ⭐

Made with ❤️ by the Community

</div>
