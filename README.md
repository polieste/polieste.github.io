# polieste.github.io

Personal academic homepage of **Huy M. Le** — Master's student in NLP at MBZUAI.

Live site: https://polieste.github.io/

## Editing content

Page content lives in `_pages/includes/`:

| File | Section |
|---|---|
| `intro.md` | About me |
| `news.md` | News |
| `pub.md` | Publications |
| `education.md` | Education |
| `experience.md` | Research & industry experience |
| `awards.md` | Awards & activities |

Profile info shown in the sidebar (name, avatar, email, links) is set in `_config.yml`; the top menu is in `_data/navigation.yml`.

## Citation counts

The `Get Citation Data` workflow (`.github/workflows/google_scholar_crawler.yaml`) crawls Google Scholar daily and pushes the results to the `google-scholar-stats` branch. The page reads that data to show the total-citation badge and per-paper counts. To show a paper's count, add:

```html
<span class='show_paper_citations' data='LtnqkXYAAAAJ:PAPER_ID'></span>
```

## Local preview

```bash
bundle install
bash run_server.sh   # http://127.0.0.1:4000
```

Built on [AcadHomepage](https://github.com/RayeRen/acad-homepage.github.io) (MIT License).
