# Pharma Clinical Trials Analytics

Data Engineering / Analytics Engineering project built from the ClinicalTrials.gov API.

The objective is to build an end-to-end data pipeline for analysing clinical trial portfolios by study, sponsor and geography.

---

## Project Objective

This project explores how a clinical trial portfolio can be collected, structured and transformed into analytics-ready datasets.

The main questions addressed by the project are:

- How many clinical trials are in the portfolio?
- What are their statuses and study types?
- Which sponsors are involved?
- Where are clinical trials conducted?
- How many locations and countries are associated with each trial?

The project is designed as a reproducible Data Engineering / Analytics Engineering pipeline.

---

## Architecture

```mermaid
flowchart LR
    A[ClinicalTrials.gov API] --> B[Python Ingestion]
    B --> C[(PostgreSQL RAW)]
    C --> D[dbt]
    D --> E[Staging Models]
    E --> F[Mart Models]
    F --> G[Analytics]
