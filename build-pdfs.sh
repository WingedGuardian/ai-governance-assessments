#!/bin/bash
# Generate professional PDFs from markdown source.
# Requires: pandoc, texlive-latex-recommended, texlive-fonts-recommended,
#           texlive-latex-extra, texlive-xetex

set -euo pipefail
cd "$(dirname "$0")"

TEMPLATE="templates/governance-doc.latex"
OUTDIR="pdf"
mkdir -p "$OUTDIR"

AUTHOR="Jay Wingard"
SUBJECT="Genesis Autonomous AI Agent"
CLASS="Public"

build() {
  local src="$1" out="$2" title="$3" subtitle="$4" short="$5" version="$6" vnote="$7"
  echo "  Building $out..."
  pandoc "$src" -o "$OUTDIR/$out" \
    --template="$TEMPLATE" \
    --pdf-engine=xelatex \
    -V title="$title" \
    -V subtitle="$subtitle" \
    -V short-title="$short" \
    -V version="$version" \
    -V date="2026-05-06" \
    -V author="$AUTHOR" \
    -V subject="$SUBJECT" \
    -V classification="$CLASS" \
    -V version-note="$vnote"
}

echo "Building governance assessment PDFs..."

build "docs/system-description.md" \
  "D0-system-description.pdf" \
  "System Description" \
  "Genesis Autonomous AI Agent" \
  "System Description - Genesis" \
  "1.0" \
  "1.0 & 2026-05-06 & $AUTHOR & Initial release"

build "docs/nist-ai-rmf-profile.md" \
  "D1-nist-ai-rmf-profile.pdf" \
  "NIST AI RMF Profile" \
  "Self-Assessment Against AI RMF 1.0 (NIST AI 100-1)" \
  "NIST AI RMF Profile - Genesis" \
  "1.0" \
  "1.0 & 2026-05-06 & $AUTHOR & Initial release"

build "docs/iso-42001-gap-analysis.md" \
  "D2-iso-42001-gap-analysis.pdf" \
  "ISO/IEC 42001:2023 Gap Analysis" \
  "Statement of Applicability and Remediation Roadmap" \
  "ISO 42001 Gap Analysis - Genesis" \
  "1.0" \
  "1.0 & 2026-05-06 & $AUTHOR & Initial release"

build "docs/eu-ai-act-assessment.md" \
  "D3-eu-ai-act-assessment.pdf" \
  "EU AI Act Compliance Assessment" \
  "Risk Classification and Obligation Mapping" \
  "EU AI Act Assessment - Genesis" \
  "1.0" \
  "1.0 & 2026-05-06 & $AUTHOR & Initial release"

build "methodology/agentic-ai-governance.md" \
  "D4-agentic-ai-governance.pdf" \
  "Governing Autonomous AI Agents" \
  "Where the Frameworks Fall Short" \
  "Agentic AI Governance - Methodology" \
  "1.0" \
  "1.0 & 2026-05-06 & $AUTHOR & Initial release"

echo ""
echo "Done. PDFs in $OUTDIR/:"
ls -lh "$OUTDIR"/*.pdf
