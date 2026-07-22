# Personal Website (Quarto)

Built with [Quarto](https://quarto.org) using the Cosmo base theme plus a custom SCSS overlay in `styles/styles.scss`. The site generates into `docs/` for GitHub Pages.

## Live Site
https://fuleky.github.io/website/

## Content & Navigation

- `index.qmd` — home/landing with portrait and contact info.
- `bio.qmd` — short biography with maps.
- `research.qmd` — publications, books/chapters, work in progress, grants.
- `teaching.qmd` — course descriptions.
- `cv.qmd` — HTML CV with PDF download link (`cv.pdf`).
- `photos.qmd` — photo gallery with location and EXIF captions (camera, lens, exposure). Images live in `assets/images/photos/`; see the comment at the top of `photos.qmd` for the resize/compress/caption steps for adding a new one.

## Local build

```bash
quarto render             # build the full site into docs/
quarto preview            # live preview
quarto render cv.qmd --to pdf   # refresh the CV PDF
```

Quarto will compile the SCSS; ensure `styles/styles.scss` remains referenced in `_quarto.yml` (HTML) and in any page-level YAML that needs it for PDF output.

## Deployment

The output goes to `docs/`; publish via GitHub Pages on the `docs/` folder. A CI workflow should run `quarto render` (and `sass` if you introduce additional SCSS that must be precompiled for PDF CSS). Ensure any fonts required for PDF are locally available to the workflow.***
