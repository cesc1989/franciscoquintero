# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal portfolio and blog for Francisco Quintero — a Ruby/Rails developer. The site is in Spanish and built with Jekyll 4 (custom layouts, no theme). Deployed to GitHub Pages via the GitHub Actions workflow in `.github/workflows/jekyll.yml`, so any gem in the `Gemfile` works in production.

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
- **Blog posts**: `_posts/YYYY-MM-DD-title.md` with YAML front matter (`layout: posts`, `title`, `category`, `date`, `description`). Post URLs are `/:category/:year/:month/:day/:title.html`
- **Data-driven sections**: `_data/` JSON files drive navigation, tech stack, tools, and writing sections on the homepage
- **Static pages**: `index.html` (homepage), `blog.html` (archive), `proyectos.html` + `proyectos/*.html` (projects, data from `_data/projects.json`), `herramientas.html` (tools). Pages set an extensionless `permalink` (e.g. `/blog`) so canonical URLs and the sitemap match the nav links
- **Redirects**: `redirects/` holds meta-refresh stubs for old URLs (no redirect plugin is installed)

### Layouts
- `_layouts/default.html` — minimal layout using modern-normalize + custom SCSS; used by most pages
- `_layouts/posts.html` — blog post layout with Bootstrap 5 navbar
- `_layouts/tools.html` — tools page layout
- `_layouts/project_detail.html` — project detail page layout
- `_includes/head_tags.html` — shared `<head>`: meta description, canonical, Open Graph/Twitter tags, RSS feed link

### Styles
All SCSS lives in `_sass/`. Main files: `_main.scss`, `_blog_styles.scss`, `_tools.scss`. Entry points are `css/styles.scss` (default layout) and `css/blog.scss` (posts layout).

## Conventions

- **Encoding/indentation**: UTF-8, LF line endings, 2-space indent, no tabs
- **File/class naming**: kebab-case
- **SCSS**: nest selectors using `&`, prefer CSS custom properties
- **JSON** (`_data/`): double quotes, no trailing commas
- **YAML front matter**: 2-space indent
- **Blog post categories**: not a fixed list (existing ones include `general`, `software`, `juegos`, `degoogle`, `ia-y-sociedad`, `tecnologia`). Use lowercase, hyphenated, no accents, since the category becomes part of the post URL. Changing a published post's category changes its URL, so add a stub in `redirects/`
- **SEO front matter**: every post and page needs a `description` (~150 chars); it feeds the meta description and Open Graph tags
- **Images**: compress before committing (WebP, ~1920px max width). In posts, add `{: loading="lazy"}` to every image except the first
