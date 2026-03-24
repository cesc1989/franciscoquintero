# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal portfolio and blog for Francisco Quintero — a Ruby/Rails developer. The site is in Spanish and built with Jekyll 4 + Minima theme (customized). Deployed via GitHub Pages.

## Commands

```bash
# Install dependencies
bundle install

# Development server (http://localhost:4000)
bundle exec jekyll serve --livereload

# Production build
bundle exec jekyll build
```

No automated tests exist. Validation is done by building and checking in the browser.

## Architecture

### Content sources
- **Blog posts**: `_posts/YYYY-MM-DD-title.md` with YAML front matter (`layout: posts`, `title`, `category`)
- **Data-driven sections**: `_data/` JSON files drive navigation, tech stack, tools, and writing sections on the homepage
- **Static pages**: `index.html` (homepage), `blog.html` (archive), `herramientas.html` (tools)

### Layouts
- `_layouts/default.html` — minimal layout using modern-normalize + custom SCSS; used by most pages
- `_layouts/posts.html` — blog post layout with Bootstrap 5 navbar
- `_layouts/tools.html` — tools page layout

### Styles
All SCSS lives in `_sass/`. Main files: `_main.scss`, `_blog_styles.scss`, `_tools.scss`. Entry points are `css/styles.scss` (default layout) and `css/blog.scss` (posts layout).

## Conventions

- **Encoding/indentation**: UTF-8, LF line endings, 2-space indent, no tabs
- **File/class naming**: kebab-case
- **SCSS**: nest selectors using `&`, prefer CSS custom properties
- **JSON** (`_data/`): double quotes, no trailing commas
- **YAML front matter**: 2-space indent
- **Blog post categories**: `general`, `software`, `juegos`
