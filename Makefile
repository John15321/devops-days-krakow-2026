# Makefile for Marp Slides — Podman-only

.PHONY: all build clean artifacts help test ci-build ci-artifacts setup \
        native-build native-clean native-artifacts watch preview shell \
        image image-rebuild nuke

# Configuration
SCRIPTS_DIR = scripts
ENGINE      = podman
# `podman compose` delegates to whichever external compose provider is on the
# system (podman-compose script, or the docker-compose / compose plugin binary).
# Either way the *engine* running containers is Podman.
# Override with: make build COMPOSE="podman-compose"
COMPOSE    ?= podman compose

# Detect whether we're already inside the build container (skip wrapping).
CONTAINER_ENV := $(shell [ -f /run/.containerenv ] && echo true || echo false)

# Function: run a command inside the slides-builder container (or natively if
# we're already inside it). Bails out with install instructions if podman is
# missing.
# Usage: $(call run-in-container,command,description)
define run-in-container
	@if [ "$(CONTAINER_ENV)" = "true" ]; then \
		echo "$(2) (inside container)..."; \
		$(1); \
	elif ! command -v podman > /dev/null 2>&1; then \
		echo "❌ Error: podman is not installed."; \
		echo ""; \
		echo "On Fedora:  sudo dnf install -y podman podman-compose"; \
		echo "On Ubuntu:  sudo apt install -y podman podman-compose"; \
		echo "Then:       make setup && make build"; \
		echo ""; \
		echo "Or to build without a container (requires Node.js):"; \
		echo "  make native-build"; \
		exit 1; \
	else \
		echo "📦 $(2) (using $(COMPOSE))..."; \
		$(COMPOSE) run --rm slides-builder bash -c "$(1)"; \
	fi
endef

# Default target
all: build

# First-time setup: verify podman is usable and build the image.
setup:
	@echo "📦 Setting up Podman build environment..."
	@if ! command -v podman > /dev/null 2>&1; then \
		echo "❌ Error: podman is not installed."; \
		echo "On Fedora: sudo dnf install -y podman podman-compose"; \
		echo "On Ubuntu: sudo apt install -y podman podman-compose"; \
		exit 1; \
	fi
	@if ! podman info > /dev/null 2>&1; then \
		echo "❌ Error: podman is installed but not usable (rootless not initialised?)."; \
		echo "Try running 'podman info' once interactively, then re-run 'make setup'."; \
		exit 1; \
	fi
	@echo "Engine : $(ENGINE)"
	@echo "Compose: $(COMPOSE)"
	@echo "Building slides-builder image (Marp CLI + Chromium pre-installed)..."
	@echo "(One-time build; subsequent builds reuse the cached layers.)"
	@$(COMPOSE) build
	@echo "✅ Container environment ready. Try 'make build'."

# Build the slides PDF (containerised by default).
build:
	$(call run-in-container,$(SCRIPTS_DIR)/build.sh,Building Marp slides)

# Clean build outputs.
clean:
	$(call run-in-container,$(SCRIPTS_DIR)/clean.sh,Cleaning all build files)

# Gather artifacts for distribution.
artifacts: build
	$(call run-in-container,$(SCRIPTS_DIR)/gather-artifacts.sh,Gathering artifacts)

# Build + verify the PDF was produced.
test: build
	@echo "✅ Testing build..."
	@test -f build/slides.pdf && echo "✅ PDF generated successfully" || (echo "❌ PDF generation failed" && exit 1)

# CI pipelines.
ci-build: clean build test
	@echo "🚀 CI build completed successfully"

ci-artifacts: ci-build artifacts
	@echo "📦 CI artifacts prepared"

# Open an interactive shell in the build container.
shell:
	@$(COMPOSE) run --rm slides-builder bash

# Container lifecycle ---------------------------------------------------------

# Build (or rebuild incrementally) the slides-builder image.
image:
	@echo "📦 Building slides-builder image ($(COMPOSE))..."
	@$(COMPOSE) build

# Full rebuild: ignore cache, re-pull the base image, then prune dangling layers.
image-rebuild:
	@echo "♻️  Forcing full rebuild of slides-builder image ($(COMPOSE))..."
	@$(COMPOSE) build --no-cache --pull
	@-$(ENGINE) image prune -f > /dev/null 2>&1 || true
	@echo "✅ Image rebuilt."

# Wipe the container + image so the next 'make setup' starts clean.
nuke:
	@echo "💣 Removing slides-builder container, image, and volumes..."
	@-$(COMPOSE) down --rmi all -v 2> /dev/null || true
	@-$(ENGINE) rmi -f slides-builder:local localhost/slides-builder:local 2> /dev/null || true
	@echo "✅ Container environment removed. Run 'make setup' to recreate."

# Native (non-container) builds — require Node.js + npm on the host.
native-build:
	@echo "📑 Building Marp slides (native)..."
	@$(SCRIPTS_DIR)/build.sh

native-clean:
	@echo "🧹 Cleaning all build files (native)..."
	@$(SCRIPTS_DIR)/clean.sh

native-artifacts: native-build
	@echo "📦 Gathering artifacts (native)..."
	@$(SCRIPTS_DIR)/gather-artifacts.sh

# Authoring helpers — always native (need interactive Node + browser).
watch:
	@npm run watch

preview:
	@npm run preview

help:
	@echo "Marp Slides Build System (Podman)"
	@echo "================================="
	@echo ""
	@echo "Engine : $(ENGINE)"
	@echo "Compose: $(COMPOSE)"
	@echo ""
	@echo "🚀 Quick Start:"
	@echo "  make setup    - First-time setup (build the container image)"
	@echo "  make build    - Build slides.pdf (inside container)"
	@echo "  make clean    - Clean build artifacts (inside container)"
	@echo ""
	@echo "📋 Main Targets (containerised via Podman):"
	@echo "  build         - Build slides.pdf"
	@echo "  clean         - Clean all build files and directories"
	@echo "  artifacts     - Gather build artifacts for distribution"
	@echo "  test          - Build and verify the slides"
	@echo "  ci-build      - Full CI build pipeline"
	@echo "  ci-artifacts  - Full CI pipeline with artifacts"
	@echo "  shell         - Open an interactive shell in the build container"
	@echo ""
	@echo "🐳 Container lifecycle:"
	@echo "  image         - (Re)build slides-builder image (uses cache)"
	@echo "  image-rebuild - Full rebuild (--no-cache --pull + prune)"
	@echo "  nuke          - Remove the container + image"
	@echo ""
	@echo "🔧 Native (no container, requires Node.js):"
	@echo "  native-build      - Build without a container"
	@echo "  native-clean      - Clean without a container"
	@echo "  native-artifacts  - Gather artifacts without a container"
	@echo ""
	@echo "👀 Authoring (native only):"
	@echo "  watch     - Rebuild on save (npm run watch)"
	@echo "  preview   - Live preview in browser (npm run preview)"
	@echo ""
	@echo "💡 Override the compose runtime if needed:  make build COMPOSE=\"podman-compose\""
