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

## Citation count

The total-citation badge in the intro reads `gs_data_shieldsio.json` from the `google-scholar-stats` branch. Google Scholar blocks GitHub Actions runners, so refresh it from your own machine:

```bash
bash google_scholar_crawler/update_stats.sh
```

## Local preview

```bash
bundle install
bash run_server.sh   # http://127.0.0.1:4000
```

Built on [AcadHomepage](https://github.com/RayeRen/acad-homepage.github.io) (MIT License).
