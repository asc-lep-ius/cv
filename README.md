<p align="center">
  <img src="https://mipkovich.gitlab.io/cv/preview-1.png" alt="Maximilian Ipkovich — CV (Page 1)" width="800"/>
</p>
<p align="center">
  <img src="https://mipkovich.gitlab.io/cv/preview-2.png" alt="Maximilian Ipkovich — CV (Page 2)" width="800"/>
</p>

<p align="center">
  <a href="https://gitlab.com/mipkovich/cv/-/releases/latest">
    <img src="https://img.shields.io/badge/Download_CV_(1--Page_%26_2--Page)-2563eb?style=for-the-badge&logo=adobeacrobatreader&logoColor=white" alt="Download CV PDFs"/>
  </a>
</p>

---

### Build locally

```bash
# requires typst ≥ 0.14
make all         # → build everything below
make en          # → output/cv-en.pdf        (2 pages, full)
make en-1page    # → output/cv-en-1page.pdf  (1 page, compact)
make png         # → output/preview-*.png
make watch       # live-reload (2-page)
make watch-1page # live-reload (1-page)
```

Built with [Typst](https://typst.app/) · Auto-compiled on every push via [GitLab CI](.gitlab-ci.yml) and [GitHub Actions](.github/workflows/build.yml)
