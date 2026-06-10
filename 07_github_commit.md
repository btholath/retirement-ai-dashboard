You can make the prompt more precise and structured so Claude Code understands exactly what you want.

### Version 1 — Professional and Direct

```text
Analyze the current project and generate:

1. A professional GitHub repository name suitable for a retirement services, annuity, and Claude Code learning project.

2. A GitHub repository description that is:
   - Maximum 255 characters
   - Professional and concise
   - Optimized for recruiters, architects, and developers
   - Clearly highlights Next.js, TypeScript, Claude Code, MCP, agentic workflows, retirement services, and annuity domain expertise

3. A Bash shell script that:
   - Creates a new Git repository if one does not exist
   - Adds all project files
   - Creates a meaningful initial commit
   - Adds a remote GitHub repository URL as a parameter
   - Pushes the code to the main branch
   - Includes error handling and status messages
   - Is compatible with Ubuntu WSL

4. Explain the reasoning behind the repository name and description.

Return the repository name, description, and shell script in separate sections.
```

---

### Version 2 — Optimized for Claude Code

```text
Act as a senior software architect and open-source maintainer.

Review the entire project structure, business domain, technologies, and learning objectives.

Generate:

- A professional GitHub repository name
- A GitHub repository description (maximum 255 characters)
- Relevant repository topics/tags
- A production-ready Bash script for Ubuntu WSL that:
  - Initializes Git if needed
  - Creates a .gitignore if missing
  - Stages all files
  - Creates a meaningful commit message
  - Accepts a GitHub repository URL as input
  - Adds or updates the remote origin
  - Pushes to the main branch
  - Displays clear success and error messages

Follow best practices for Git, GitHub, and open-source project management.

Output:
1. Repository Name
2. Repository Description
3. Repository Topics
4. Shell Script
5. Explanation of Design Decisions
```

---

### Version 3 — Best for Learning Claude Certified Architect Concepts

```text
Analyze this project as if it were a portfolio project demonstrating:

- Claude Code
- Agentic Architecture
- MCP Integration
- Next.js
- TypeScript
- Retirement Services
- Annuity Processing
- API Design
- Prompt Engineering
- Multi-Agent Workflows

Create:

1. A professional GitHub repository name.
2. A recruiter-friendly GitHub description limited to 255 characters.
3. 15 GitHub topics/tags.
4. A production-quality Ubuntu shell script that:
   - Initializes Git
   - Creates commits using conventional commit standards
   - Configures the remote repository
   - Pushes code to GitHub
   - Can be executed repeatedly without failure (idempotent)
5. Recommendations for improving repository professionalism.

Provide all output in clearly separated sections.
```

Version 3 will usually produce the highest-quality result from Claude Code because it gives domain context, technical context, and output requirements.
================================================================================
You can enhance Version 3 by explicitly telling Claude Code to use your GitHub profile as context for naming, branding, and repository setup.

Analyze this project as if it were a portfolio project demonstrating:

* Claude Code
* Agentic Architecture
* MCP Integration
* Next.js
* TypeScript
* Retirement Services
* Annuity Processing
* API Design
* Prompt Engineering
* Multi-Agent Workflows

Use my GitHub profile as context when recommending repository naming conventions, repository organization, and Git remote configuration:

GitHub Profile: [https://github.com/btholath](https://github.com/btholath)

Review my existing repository naming patterns if relevant and ensure the proposed repository name aligns with a professional software architect portfolio.

Create:

1. A professional GitHub repository name.

2. A recruiter-friendly GitHub repository description limited to 255 characters.

3. 15 relevant GitHub topics/tags.

4. A production-quality Ubuntu WSL shell script that:

   * Initializes Git if needed
   * Creates or validates .gitignore
   * Creates commits using Conventional Commit standards
   * Accepts a GitHub repository name as a parameter
   * Configures the Git remote using my GitHub account (btholath)
   * Creates commands needed to push to GitHub
   * Pushes code to the main branch
   * Can be executed repeatedly without failure (idempotent)
   * Includes error handling and status messages

5. Recommendations for improving repository professionalism, including:

   * README structure
   * Project badges
   * Documentation organization
   * Portfolio presentation
   * Claude Code best practices

Provide all output in clearly separated sections.

Before generating recommendations, analyze the project structure, technologies used, business domain, and learning objectives.

A small improvement: instead of only providing your GitHub profile URL, also provide your GitHub username (`btholath`) because Claude Code can use it directly when generating commands such as:

```bash
git remote add origin git@github.com:btholath/<repository-name>.git
```

or

```bash
git remote add origin https://github.com/btholath/<repository-name>.git
```

which makes the generated script immediately usable.
==========================================================================================
prompt for github
==========================================================================================
Analyze this project as if it were a portfolio project demonstrating:

Claude Code
Agentic Architecture
MCP Integration
Next.js
TypeScript
Retirement Services
Annuity Processing
API Design
Prompt Engineering
Multi-Agent Workflows

Use my GitHub profile as context when recommending repository naming conventions, repository organization, and Git remote configuration:

GitHub Profile: https://github.com/btholath

Review my existing repository naming patterns if relevant and ensure the proposed repository name aligns with a professional software architect portfolio.

Create:

A professional GitHub repository name.
A recruiter-friendly GitHub repository description limited to 255 characters.
15 relevant GitHub topics/tags.
A production-quality Ubuntu WSL shell script that:
Initializes Git if needed
Creates or validates .gitignore
Creates commits using Conventional Commit standards
Accepts a GitHub repository name as a parameter
Configures the Git remote using my GitHub account (btholath)
Creates commands needed to push to GitHub
Pushes code to the main branch
Can be executed repeatedly without failure (idempotent)
Includes error handling and status messages
Recommendations for improving repository professionalism, including:
README structure
Project badges
Documentation organization
Portfolio presentation
Claude Code best practices

Provide all output in clearly separated sections.

Before generating recommendations, analyze the project structure, technologies used, business domain, and learning objectives.
