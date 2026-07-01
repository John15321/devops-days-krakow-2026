# Flatcar Linux: Provisioned, Not Installed. A declarative and Immutable Operating Systems for Containers and Kubernetes

In modern DevOps workflows, we usually do not build applications by logging into a machine and changing things by hand. We use Dockerfiles, Kubernetes manifests, Terraform, CI/CD pipelines, and other declarative tools to describe what we want the system to look like. But the operating system underneath our containers is still often treated differently: installed interactively, changed over time, patched manually, and debugged through SSH until every node becomes a little bit unique.

## Build

The recommended path is Podman + `make`. Everything runs inside a small container image so the host only needs `podman` and `make`.

```sh
make setup        # first-time: build the slides-builder container image
make build        # -> build/slides.pdf
make clean        # remove build artifacts
make shell        # interactive shell inside the container
```

Native (no container) — requires Node.js on the host:

```sh
npm ci            # or npm install
make native-build # -> build/slides.pdf
```

Author-time preview with live reload:

```sh
make watch        # rebuilds on save
make preview      # live browser preview
```

See `make help` for the full target list.

## Layout

```
slides.md                  # slide content (Markdown)
themes/
  flatcar.css              # theme entry point
  flatcar/{base,dark,sidebar}.css   # partials
assets/                    # images, backgrounds, logos, photo, QR
scripts/                   # build / clean / gather-artifacts
Containerfile              # Podman image (Marp CLI + bash + make)
compose.yaml               # slides-builder service definition
Makefile                   # top-level workflow
.github/workflows/         # CI: builds PDF on push, releases on tag
```

## Slide layouts

Set via `<!-- _class: NAME -->` on the target slide:

| Class            | Use case                                |
| ---------------- | --------------------------------------- |
| *(none)*         | White slide with navy title bar         |
| `cover`          | Navy title slide with Flatcar icon      |
| `lead`           | Full-bleed navy for big statements      |
| `section`        | Section divider                         |
| `closing`        | Thank-you slide + QR code + Discord CTA |
| `agenda`         | Left rail + bullet list                 |
| `sidebar`        | Left rail + free-form right pane        |
| `sidebar whoami` | Bio variant of sidebar                  |
| `quote`          | Blockquote slide                        |

## Releases

Pushing a tag `v*` triggers the CI workflow to attach `slides.pdf` to a GitHub Release.

---

Generated from [cookiecutter-marp-flatcar](https://github.com/John15321/cookiecutter-marp-flatcar) by **Jan Bronicki**.
