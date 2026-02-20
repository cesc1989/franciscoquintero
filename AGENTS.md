# AGENTS.md - Developer Guidelines for franciscoquintero

This is a Jekyll static site (Ruby-based). Below are the conventions and commands for working in this repository.

---

## 1. Build, Serve, and Development Commands

### Running the Site Locally

```bash
# Install dependencies (first time only)
bundle install

# Serve the site locally with live reload
bundle exec jekyll serve

# Or use the shorter alias (if available in PATH)
jekyll serve
```

### Building for Production

```bash
# Build the site (outputs to _site/)
bundle exec jekyll build

# Build with draft posts included
bundle exec jekyll build --drafts

# Build and serve with verbose output
bundle exec jekyll serve --verbose
```

### Ruby/Linting Commands

```bash
# Check for broken links (optional, requires html-proofer)
# bundle exec htmlproofer ./_site --allow-hash-href

# Lint SCSS/CSS (requires sassc gem)
# bundle exec sass --style expanded --check _sass:_sass
```

### Single Test / Validation

Since this is a static Jekyll site, there are no traditional unit tests. To validate:

```bash
# Build and verify no errors
bundle exec jekyll build

# Serve and manually test in browser at http://localhost:4000
bundle exec jekyll serve --watch
```

---

## 2. Code Style Guidelines

### General Conventions

- **Line endings**: LF (Unix-style)
- **Encoding**: UTF-8
- **Indentation**: 2 spaces (no tabs)
- **Trailing whitespace**: Remove on save
- **Final newline**: Always include

These are enforced by `.editorconfig` at the project root.

### HTML/Liquid Templates

- Use Liquid templating syntax

```
{% %}

{{ }}
```

- Follow HTML5 semantic structure
- Keep templates clean; minimize logic in views
- Example:
  ```liquid
  {% for post in site.posts %}
    <article>
      <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
    </article>
  {% endfor %}
  ```

### SCSS/CSS

- Use SCSS (Sass) with nesting
- 2-space indentation
- No semicolons after property declarations
- Use `&` parent selector for nesting
- Group related properties together
- Example:
  ```scss
  .parent {
    .child {
      color: #555;
    }
    
    &:hover {
      color: #000;
    }
  }
  ```
- Use CSS custom properties for colors and spacing when appropriate

### JSON Data Files

- Located in `_data/`
- Use double quotes for strings
- No trailing commas
- 2-space indentation
- Example:
  ```json
  [
    {
      "name": "Ruby",
      "logo": "/images/stack/ruby.svg"
    }
  ]
  ```

### YAML Front Matter

- Used in all content files (`_posts`, `_pages`)
- Use 2-space indentation
- Example:
  ```yaml
  ---
  layout: default
  title: "My Post"
  date: 2024-01-15
  ---
  ```

### Naming Conventions

- **Files**: Use kebab-case (e.g., `my-post.html`, `_blog_styles.scss`)
- **CSS classes**: Use kebab-case (e.g., `.card-box-inner`)
- **Variables in SCSS**: Use kebab-case (e.g., `$primary-color`)
- **Liquid variables**: Use descriptive names (e.g., `post.url`, `site.posts`)

### Image Assets

- Store in `/images/` directory
- Use SVG for icons and logos when possible
- Include `alt` text for accessibility
- Optimize images before committing

### Git Commit Messages

- Use clear, descriptive messages
- Example: `Add new blog post about Rails` or `Fix mobile responsive layout`

---

## 3. Project Structure

```
franciscoquintero/
├── _config.yml           # Jekyll configuration
├── _data/                # JSON data files (navigation, stack, tools, etc.)
├── _includes/            # Reusable partials
├── _layouts/             # Page templates (default, posts, tools)
├── _posts/               # Blog posts (Markdown)
├── _sass/                # SCSS stylesheets
├── assets/               # CSS, JS, images
├── images/               # Static images
├── Gemfile               # Ruby dependencies
└── .editorconfig         # Editor configuration
```

---

## 4. Common Tasks

### Adding a New Blog Post

1. Create a new file in `_posts/` with format `YYYY-MM-DD-title.md`
2. Add YAML front matter with `layout`, `title`, `date`
3. Write content in Markdown

### Adding a New Page

1. Create a new `.html` or `.md` file in root or appropriate folder
2. Add YAML front matter with `layout`, `title`, `permalink`

### Modifying Styles

- Edit files in `_sass/` directory
- Use `@import` to include partials in main stylesheet
- Changes rebuild automatically with `jekyll serve --watch`

---

## 5. Notes

- This is a personal portfolio site using the minima Jekyll theme
- No CI/CD pipeline configured
- No JavaScript frameworks used
- No Cursor or Copilot rules currently defined in the project
