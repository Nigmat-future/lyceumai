<div align="center">

<!-- Hero Section -->
<img src="https://img.shields.io/badge/%F0%9F%8F%9B%EF%B8%8F-LyceumAI-000000?style=for-the-badge&labelColor=000000&color=B08D57" alt="LyceumAI" height="40"/>

# LyceumAI

### A Peripatetic Multi-Agent System for End-to-End Bioinformatics Research

<p align="center">
<em>Where logos becomes method: from question, to evidence, to manuscript.</em>
</p>

<br/>

<!-- Badges Row 1: Core Tech -->
[![Python 3.11+](https://img.shields.io/badge/Python-3.11+-3776AB?style=flat-square&logo=python&logoColor=white)](https://www.python.org/downloads/)
[![LangGraph](https://img.shields.io/badge/LangGraph-1.0+-00B4D8?style=flat-square&logo=chainlink&logoColor=white)](https://github.com/langchain-ai/langgraph)
[![Claude Sonnet](https://img.shields.io/badge/Claude-Sonnet%204.6-D97706?style=flat-square&logo=anthropic&logoColor=white)](https://www.anthropic.com/)
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?style=flat-square&logo=docker&logoColor=white)](Dockerfile)

<!-- Badges Row 2: Quality -->
[![Tests](https://img.shields.io/badge/Tests-168%20Passing-22C55E?style=flat-square&logo=pytest&logoColor=white)](tests/)
[![Coverage](https://img.shields.io/badge/Coverage-48%25-EAB308?style=flat-square&logo=codecov&logoColor=white)](pyproject.toml)
[![License: MIT](https://img.shields.io/badge/License-MIT-A855F7?style=flat-square&logo=opensourceinitiative&logoColor=white)](LICENSE)
[![arXiv](https://img.shields.io/badge/Paper-Under%20Review-B31B1B?style=flat-square&logo=arxiv&logoColor=white)](paper/manuscript.pdf)

<br/>

**Nigmat Rahim** · Peking University · [`nigmatrahim@stu.pku.edu.cn`](mailto:nigmatrahim@stu.pku.edu.cn)

---

<br/>

<table>
<tr>
<td width="33%" align="center">

**🏛️ 8 Research Faculties**<br/>
<sub>Literature · Planning · Data · Analysis · Writing · Visualization · Review · Orchestration</sub>

</td>
<td width="33%" align="center">

**📜 9 Evidence Archives**<br/>
<sub>GEO · cBioPortal · GDC/TCGA · NCBI · ENCODE · ENA · ArrayExpress · 10x CDN · Direct URL</sub>

</td>
<td width="33%" align="center">

**🕯️ Manuscript-Ready Praxis**<br/>
<sub>IMRAD Manuscript · LaTeX (OUP format) · BibTeX · 300 DPI Figures · Provenance Trail</sub>

</td>
</tr>
</table>

</div>

<br/>

## What is LyceumAI?

LyceumAI is an autonomous AI research system for bioinformatics: a digital Lyceum where specialized agents walk the full path from inquiry to publication-ready argument.

Given a research question, it turns curiosity into a disciplined chain of evidence:

1. **Theoria** — reviews literature across PubMed, ClinicalTrials, ClinVar, gnomAD, OncoKB, KEGG, UniProt, GWAS Catalog, and ArXiv
2. **Aporia** — identifies unresolved gaps and transforms uncertainty into testable hypotheses
3. **Empiria** — acquires real datasets from biomedical repositories; it does not fabricate data
4. **Techne** — writes and executes Python analysis code inside a sandboxed environment
5. **Logos** — composes IMRAD manuscripts with PMID-grounded citations
6. **Eidos** — creates publication-quality figures with a Nature-style theme and colour-blind-safe palette
7. **Krisis** — self-reviews rigor, novelty, clarity, completeness, and reproducibility
8. **Praxis** — exports Markdown, LaTeX, BibTeX, figures, and provenance records

> One command. One question. A research argument carried from first principles to reproducible artefacts.

<br/>

## Quick Start

```bash
# Install
git clone https://github.com/Nigmat-future/lyceumai.git && cd lyceumai
pip install -e ".[dev]"

# Configure
echo "BIOAGENT_ANTHROPIC_API_KEY=your-key" > .env

# Run with the new LyceumAI command
lyceumai research "What is the mechanistic role of BRAF V600E in melanoma pathogenesis?"

# Backward-compatible alias
bioagent research "What is the mechanistic role of BRAF V600E in melanoma pathogenesis?"
```

<details>
<summary><b>Docker</b></summary>

```bash
docker build -t lyceumai:latest .
docker run --rm -e BIOAGENT_ANTHROPIC_API_KEY=$KEY lyceumai:latest research "Your question"
```

</details>

<details>
<summary><b>Reproducible Install (pinned deps)</b></summary>

```bash
pip install -r requirements-lock.txt
pip install -e .
```

</details>

<br/>

## System Architecture

```
                          ┌─────────────────────────────────────────────────┐
                          │              ResearchState                      │
                          │   papers, data, hypotheses, results, figures,   │
                          │   paper_sections, review_feedback, provenance   │
                          └─────────────────┬───────────────────────────────┘
                                            │  shared blackboard
                                     ┌──────▼──────┐
                          ┌──────────│  Archon     │◄──────────────────────┐
                          │          │  Router     │                       │
                          │          └──────┬──────┘                       │
                          │                 │ LLM-directed routing          │
          ┌───────┬───────┼────────┬────────┼─────────┬──────────┬─────────┤
          ▼       ▼       ▼        ▼        ▼         ▼          ▼         ▼
      ┌───────┐┌──────┐┌──────┐┌───────┐┌────────┐┌────────┐┌────────┐┌──────┐
      │Biblios││Aporia││Plan  ││Design ││Data    ││Analyst ││Scribe  ││Figure│
      │Agent  ││Agent ││Agent ││Agent  ││Agent   ││Agent   ││Agent   ││Agent │
      │BioMCP ││LLM   ││Hyp+  ││LLM    ││9 tools ││Sandbox ││IMRAD   ││Nature│
      │+ArXiv ││      ││rubric││       ││3-tier  ││+debug  ││+cites  ││theme │
      └───────┘└──────┘└──────┘└───────┘└────────┘└───┬────┘└────────┘└──────┘
                                                      │
                                               ┌──────▼──────┐
                                               │ Validate    │──── retry ──┐
                                               └──────┬──────┘             │
                                                      ▼                    │
                                               ┌─────────────┐            │
                                               │ Iterate     │────────────┘
                                               └─────────────┘
                                                      │
                                               ┌──────▼──────┐
                                               │ Review      │  score >= 7 -> done
                                               │ 5 dims      │◄── revise ──┐
                                               └──────┬──────┘             │
                                                      │ < 7, round < 3    │
                                                      └────────────────────┘
                                                               │
                                                               ▼
                                                      ┌────────────────┐
                                                      │ Export         │
                                                      │ MD + LaTeX     │
                                                      │ + BibTeX       │
                                                      └────────────────┘
```

<table>
<tr>
<td>

**14-node LangGraph StateGraph** with conditional orchestrator routing, a code-execution retry loop (max 5 iterations), and a review-revision loop (max 3 rounds). Optional `human_approval` gating via `BIOAGENT_HUMAN_IN_LOOP=true`.

</td>
<td>

**Design commitments:**
- **Blackboard architecture** — all agents deliberate over `ResearchState`
- **Forward motion** — loop detection prevents circular inquiry
- **Sandboxed execution** — analysis runs in a path-isolated workspace
- **Checkpointed memory** — SQLite preserves the thread of reasoning

</td>
</tr>
</table>

<br/>

## Agent Faculties

| Faculty | Tools & Integrations | What It Does |
|:--------|:---------------------|:-------------|
| **Archon / OrchestratorAgent** | LLM-directed routing | Determines the next research phase with loop detection and anti-backtrack logic |
| **Biblios / LiteratureAgent** | BioMCP (PubMed · ClinicalTrials · ClinVar · gnomAD · OncoKB · Reactome · KEGG · UniProt · GWAS) + ArXiv | Systematic literature review with structured summaries and gap identification |
| **Aporia / PlannerAgent** | BioMCP biological context | Hypothesis generation with novelty/testability scoring and detailed experiment design |
| **Empiria / DataAcquisitionAgent** | 9 tools across GEO · cBioPortal · GDC/TCGA · NCBI · ENCODE · ENA · ArrayExpress · 10x CDN · Direct URL | Real dataset download with 3-tier fallback (API -> REST/FTP -> manual instructions). Mirror-first routing. Never fabricates data. |
| **Logistikon / AnalystAgent** | Python sandbox + 8 bioinformatics templates (scRNA-seq · DE · GWAS · survival · enrichment) | Generates analysis code, executes it in sandbox, and auto-debug failures up to 5 retries |
| **Grammateus / WriterAgent** | - | Writes publication-quality IMRAD sections with PMID citations and data provenance |
| **Eikon / VisualizationAgent** | Python sandbox + Nature matplotlib theme | Produces 300 DPI figures with Okabe-Ito colour-blind-safe palettes and PDF + PNG output |
| **Krisis / ReviewAgent** | - | Runs 5-dimension self-review across novelty, rigor, clarity, completeness, and reproducibility |

<br/>

## Benchmark Results

Evaluated on three real-world bioinformatics case studies using the same base model and prompts:

| Case Study | v0.1 Score | v0.3 Score | Delta | Highlights |
|:-----------|:----------:|:----------:|:-----:|:-----------|
| **TP53 Pan-Cancer** | 1.06 | **8.42** | **+7.36** | Full IMRAD draft · 4,439 words · 6 figures · Self-review 7/10 |
| **scRNA PBMC 3k** | 6.44 | **7.64** | +1.20 | Complete single-cell pipeline with clustering + markers |
| **BRAF V600E Melanoma** | 5.30 | **6.90** | +1.60 | 12 figures · 5 IMRAD sections · 2h 47m runtime |

<sub>Weighted composite scores (0-10) across 6 evaluation dimensions. See <a href="benchmarks/">benchmarks/</a> for methodology.</sub>

<details>
<summary><b>Evaluation Dimensions</b></summary>

| Dimension | Metrics |
|:----------|:--------|
| **Literature Coverage** | Precision / Recall vs. gold-standard PMIDs |
| **Hypothesis Quality** | Novelty, testability, literature grounding |
| **Analysis Correctness** | Code execution success rate, statistical validity |
| **Writing Completeness** | Section coverage, word count, Flesch readability |
| **Figure Quality** | Count, caption coverage, file presence |
| **Efficiency** | Token usage, cost (USD), self-review score |

</details>

<br/>

## Usage

### CLI

```bash
# Run a research session
lyceumai research "What are the most effective BRAF inhibitors for melanoma?"

# Specify topic explicitly
lyceumai research "Analyze PBMC single-cell heterogeneity" --topic "scRNA-seq PBMC"

# Export completed session
lyceumai export --thread <thread-id> --format both     # Markdown + LaTeX

# Session management
lyceumai status --thread <thread-id>                    # Check progress
lyceumai resume --thread <thread-id>                    # Resume paused session
```

The legacy `bioagent` CLI remains available as a compatibility alias.

### Python API

```python
from bioagent.graph.research_graph import compile_research_graph
from bioagent.tools.execution.sandbox import ensure_workspace

ensure_workspace()
graph = compile_research_graph()

state = {
    "research_topic": "BRAF V600E in melanoma",
    "research_question": "What is the mechanistic role of BRAF V600E?",
    "current_phase": "literature_review",
}

for event in graph.stream(state, config={"configurable": {"thread_id": "session-001"}}):
    print(f"Phase: {event.get('current_phase')}")
```

<details>
<summary><b>Full programmatic example</b></summary>

See [`examples/quickstart.py`](examples/quickstart.py) for a complete working example with all state fields.

</details>

<br/>

## Output Structure

```
workspace/
├── data/              <- Downloaded datasets (CSV, HDF5, FASTQ, ...)
├── scripts/           <- Auto-generated Python analysis code
├── figures/           <- Publication-ready figures (PDF + PNG, 300 DPI)
└── output/
    ├── manuscript.md       <- Markdown manuscript
    ├── manuscript.tex      <- LaTeX (Bioinformatics OUP format)
    ├── references.bib      <- BibTeX bibliography
    └── provenance.json     <- Full audit trail (model, seed, hashes, timings)
```

<br/>

## Configuration

All settings currently use the `BIOAGENT_` prefix for backward compatibility. Create a `.env` file or set environment variables:

<details open>
<summary><b>Core Settings</b></summary>

| Variable | Default | Description |
|:---------|:--------|:------------|
| `BIOAGENT_ANTHROPIC_API_KEY` | - | Anthropic API key (required) |
| `BIOAGENT_PRIMARY_MODEL` | `claude-sonnet-4-5-20250929` | Primary LLM model |
| `BIOAGENT_FALLBACK_MODEL` | `gpt-4.1` | Fallback model |
| `BIOAGENT_MAX_TOKENS` | `4096` | Max output tokens per LLM call |
| `BIOAGENT_MAX_TOOL_CALLS` | `20` | Max tool-use iterations per agent |

</details>

<details>
<summary><b>Budget & Limits</b></summary>

| Variable | Default | Description |
|:---------|:--------|:------------|
| `BIOAGENT_TOKEN_BUDGET` | `500000` | Total token budget (`0` = unlimited) |
| `BIOAGENT_COST_BUDGET_USD` | `10.0` | Cost budget in USD (`0` = unlimited) |
| `BIOAGENT_CODE_TIMEOUT` | `120` | Code execution timeout (seconds) |
| `BIOAGENT_MAX_ITERATIONS` | `5` | Max code execution retries |

</details>

<details>
<summary><b>Infrastructure</b></summary>

| Variable | Default | Description |
|:---------|:--------|:------------|
| `BIOAGENT_WORKSPACE_DIR` | `workspace` | Working directory for outputs |
| `BIOAGENT_CHECKPOINT_DIR` | `checkpoints` | SQLite checkpoint directory |
| `BIOAGENT_USE_SQLITE_CHECKPOINTS` | `true` | Enable session persistence |
| `BIOAGENT_HUMAN_IN_LOOP` | `false` | Require human approval per phase |
| `BIOAGENT_RANDOM_SEED` | `42` | Random seed for reproducibility |
| `BIOAGENT_TLS_VERIFY` | `true` | TLS certificate verification |
| `BIOAGENT_LOG_LEVEL` | `INFO` | Logging verbosity |

</details>

<details>
<summary><b>Network & Resilience</b></summary>

| Variable | Default | Description |
|:---------|:--------|:------------|
| `BIOAGENT_MIN_DOWNLOAD_MBPS` | `2.0` | Minimum download speed floor |
| `BIOAGENT_DOWNLOAD_MAX_RETRIES` | `4` | Download retry attempts |
| `BIOAGENT_TMP_STALE_HOURS` | `24` | Stale temp file cleanup threshold |
| `BIOAGENT_PREFER_MIRRORS` | `true` | Prefer EBI/ENA mirrors over NCBI |

</details>

<br/>

## Infrastructure Highlights

<table>
<tr>
<td width="50%">

### Resilient Data Pipeline
- **Mirror-first routing** — EBI ArrayExpress before NCBI FTP
- **Range-based resume** — interrupted downloads continue where they left off
- **Gzip integrity validation** — catches corruption immediately, not minutes later
- **Stale `.tmp` cleanup** — auto-removes orphaned partial downloads

</td>
<td width="50%">

### Robust Execution
- **Direct Anthropic SDK** — no LangChain overhead, native tool-use protocol
- **Exponential backoff + jitter** — handles API rate limits and gateway errors
- **SQLite checkpointing** — pause/resume any research session
- **Path-sandboxed execution** — isolated file system for code runs

</td>
</tr>
<tr>
<td width="50%">

### Loop Detection
- **Forward-progression map** — prevents orchestrator routing cycles
- **Phase history tracking** — last 8 phases visible to routing prompt
- **Anti-backtrack rules** — force-advance after 3 same-phase selections

</td>
<td width="50%">

### Reproducibility
- **Deterministic seeds** — `random`, `numpy`, `torch` all seeded
- **Provenance JSON** — full audit trail with content hashes
- **Pinned dependencies** — `requirements-lock.txt` for bit-exact reproduction
- **SHA-256 manifest verification** via `scripts/verify_hashes.py`

</td>
</tr>
</table>

<br/>

## Running Benchmarks

```bash
# Single case
python benchmarks/run_benchmark.py --case braf_melanoma

# All benchmark cases
python benchmarks/run_benchmark.py --case all --output benchmarks/results/

# Resume a failed run from checkpoint
python benchmarks/resume_run.py --thread-id <id>
```

<br/>

## Contributing

We welcome contributions to the Lyceum. See [`docs/CONTRIBUTING.md`](docs/CONTRIBUTING.md) for guidelines and [`docs/DEVELOPMENT.md`](docs/DEVELOPMENT.md) for the architecture deep-dive and debugging guide.

```bash
# Development setup
pip install -e ".[dev]"
pre-commit install

# Run tests
pytest                                    # Fast tests only
pytest -m "not api and not slow"          # CI default
pytest --cov=bioagent --cov-report=html   # With coverage
```

<br/>

## Citation

If you use LyceumAI in your research, please cite:

```bibtex
@article{rahim2026lyceumai,
  title   = {LyceumAI: A Peripatetic Multi-Agent System for
             End-to-End Bioinformatics Research},
  author  = {Rahim, Nigmat},
  journal = {Bioinformatics},
  year    = {2026},
  note    = {Under review. Preprint: \url{https://github.com/Nigmat-future/lyceumai}}
}
```

<br/>

## License

Released under the [MIT License](LICENSE).

---

<div align="center">

<sub>Built with a biologist's empiria and a philosopher's logos by <a href="mailto:nigmatrahim@stu.pku.edu.cn">Nigmat Rahim</a> at Peking University</sub>

<br/>

<sub>Powered by <a href="https://github.com/langchain-ai/langgraph">LangGraph</a> · <a href="https://www.anthropic.com/">Anthropic Claude</a> · <a href="https://www.python.org/">Python</a></sub>

</div>
