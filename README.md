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
make all                  # → build all PDFs plus preview PNGs
make software-full        # → output/cv-software-full.pdf
make software-onepage     # → output/cv-software-onepage.pdf
make ai-engineer-full     # → output/cv-ai-engineer-full.pdf
make ai-engineer-onepage  # → output/cv-ai-engineer-onepage.pdf
make png                  # → output/preview-*.png
make watch-software-full
make watch-software-onepage
make watch-ai-engineer-full
make watch-ai-engineer-onepage
```

Built with [Typst](https://typst.app/) · Auto-compiled on every push via [GitLab CI](.gitlab-ci.yml) and [GitHub Actions](.github/workflows/build.yml)
