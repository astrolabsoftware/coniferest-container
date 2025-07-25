# coniferest-container

**Dockerized packaging of [coniferest](https://github.com/snad-space/coniferest): fast anomaly detection using Isolation Forests, optimized for spatial alert processing.**

This repository provides a minimal, production-ready Docker image for running `coniferest` in batch or service mode. It is designed for ease of deployment in containerized environments such as Kubernetes, edge devices, or automated ML pipelines.

---

## 🔍 Features

- 🐳 Lightweight Docker image based on `miniconda`
- ⚡ Embed Package for active anomaly detection with isolation forests ([coniferest](https://github.com/snad-space/coniferest))
- 📦 Ready to use with volume mounts or input/output pipelines

---

## Requirement

- `Docker` >= 27.5.1
- `go`>= 1.23.4

## 🚀 Usage

```bash
git clone https://github.com/astrolabsoftware/coniferest-container

# Install pre-requisites
./prereq.sh

# Build image
./build.sh

# Run image
./run.sh
```
