# AI Governance Assessments

Three governance frameworks applied to a real autonomous AI system. Not a theoretical exercise. The system runs 24/7 and has genuine governance mechanisms.

NIST AI RMF 1.0, ISO/IEC 42001:2023, and the EU AI Act were each applied against a specific deployed agent. The assessments identify what each framework actually covers, where it breaks down for autonomous agents, and what's structurally missing.

We couldn't find published examples of all three frameworks applied simultaneously to a deployed autonomous agent. Academic search (as of May 2026) across arXiv, IEEE, ACM, and Google Scholar found five adjacent works. All propose extensions or gap analyses without operationalizing against a real running system. This project provides an empirical application layer we found absent from existing work.

## The Subject

Genesis is an autonomous AI agent running as a persistent cognitive partner to a single human operator. It sends messages, executes code, browses the web, and interacts with external services. Actions taken, not outputs recommended. It has a Bayesian trust model with four operational levels, approval gates that hold indefinitely on irreversible actions, and persistent episodic and semantic memory across sessions. Full system documentation: [GENesis-AGI](https://github.com/WingedGuardian/GENesis-AGI).

## Documents

- [System Description](docs/system-description.md): Genesis described for a governance audience: architecture, stakeholders, autonomy model, data handling, existing controls
- [NIST AI RMF Profile](docs/nist-ai-rmf-profile.md): Current/Target/Gap assessment across all 4 functions and 72 subcategories, with 7 deep analyses on governance-relevant areas
- [ISO 42001 Gap Analysis](docs/iso-42001-gap-analysis.md): Statement of Applicability for all 38 Annex A controls across 9 domains, with gap severity ratings and remediation roadmap
- [EU AI Act Assessment](docs/eu-ai-act-assessment.md): Risk classification, Article 50 transparency analysis, high-risk readiness mapping, GPAI provider considerations
- [Methodology](methodology/agentic-ai-governance.md): Cross-framework synthesis: what makes agents different, where each framework falls short, what an agentic governance framework would actually need

## What We Found

**Authority governance is the missing piece.** All three frameworks govern what AI systems produce. None adequately govern what AI systems are permitted to do. For an autonomous agent, the authority model--how actions are classified, approved, and constrained--is the primary governance mechanism. It doesn't appear in any of these frameworks in a meaningful way.

**NIST AI 600-1 names autonomous agents as a threat vector, not a subject of governance.** The GenAI Profile treats agentic behavior as a risk to be mitigated by human oversight. This is accurate for many systems but creates a conceptual hole: a well-governed autonomous agent with rigorous internal controls has no obvious home in the framework. The document describes how to guard against agents, not how to govern one.

**ISO 42001's action classification gap.** The standard's Annex A controls address objectives, impacts, and risk treatment at the organizational level. What's absent is any control structure for classifying individual actions by reversibility and authority scope--the operational layer where actual governance happens for autonomous systems. Genesis has this (REVERSIBLE / COSTLY_REVERSIBLE / IRREVERSIBLE taxonomy with approval gates), but built it from first principles with no framework guidance.

**The EU AI Act's risk classification misses the authority dimension.** The Act classifies risk by what a system does--Annex III enumerates specific high-risk use cases. An autonomous agent with broad action authority that doesn't perform an enumerated function (credit scoring, recruitment screening, biometric identification) lands in Limited or Minimal Risk regardless of its actual impact potential. The risk isn't in the function; it's in the authority level. The Act doesn't have a bucket for that.

**Behavioral continuity is unaddressed across all three.** Each framework assumes you can validate a system at a point in time and that validation holds. Agents accumulate state: memories, corrections, learned patterns. That state shifts their effective behavior over time. None of the frameworks address drift detection for stateful AI systems.

## Methodology Note

Each assessment follows the format prescribed or recommended by the respective framework: Current/Target/Gap for NIST, Statement of Applicability for ISO 42001, risk classification plus obligation mapping for the EU AI Act. Assessments were produced using Genesis itself as a cognitive tool. The system under review is also the analysis engine. All findings were verified against source framework documents. Standards sources and access details are documented in the methodology.
