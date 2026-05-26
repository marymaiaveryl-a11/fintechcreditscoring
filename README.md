  # fintechcreditscoring

  A Fintech Credit Scoring Database System — Nov 2025 academic group project (3 members).

  ---

  # FinTech Credit Scoring Platform — Database Design & Analytics

  A SQL-based data platform for a fintech credit scoring system, covering the full pipeline from partner data ingestion to credit
  score calculation, performance monitoring, and B2B invoicing. Built as a semester project to demonstrate relational database
  design, T-SQL querying, and business intelligence reporting.

  ## Table of Contents

  - [Project Context](#project-context)
  - [Schema Overview](#schema-overview)
  - [Entity-Relationship Summary](#entity-relationship-summary)
  - [Query Modules](#query-modules)
  - [Seed Data Snapshot](#seed-data-snapshot)
  - [Key Findings & Business Insights](#key-findings--business-insights)
  - [Quick Start](#quick-start)
  - [File Structure](#file-structure)
  - [Tech Stack](#tech-stack)
  - [Contributors](#contributors)

  ## Project Context

  - **Course**: Database Systems / Data Management (Nov 2025)
  - **Team size**: 3 members
  - **Scope**: Design a normalized database for a multi-tenant fintech credit scoring platform, populate it with realistic seed
  data, and write analytical queries that surface business value.
  - **Domain coverage**: Data partnerships, user profiling, credit risk modeling, ML model performance tracking, B2B contract
  management, and invoicing.

  ## Schema Overview (14 tables)

  | # | Table | Purpose |
  |---|---|---|
  | 1 | `DATA_PARTNER` | External data providers (banks, insurers, fintechs, audit firms) |
  | 2 | `FINTECH_APP` | Applications owned by each partner, each exposing an API endpoint |
  | 3 | `DATA_SHARING_AGREEMENT` | Consent & data-sharing contracts with renewal terms and security levels |
  | 4 | `RAW_DATA_SOURCE` | Raw data feeds tied to a specific partner–app–agreement triplet |
  | 5 | `EVENT` | Incoming data events (transactions, balance updates, claims, payments, audit reports) |
  | 6 | `DATA_WAREHOUSE` | Storage infrastructure partitioned by region and department |
  | 7 | `USER_PROFILE` | End-user personal info, credentials, and consent tracking |
  | 8 | `CREDIT_PROFILE` | Aggregated financial behavior per user (debt, income, spending, risk level) |
  | 9 | `CREDIT_SCORE` | Computed credit scores with confidence levels and risk categorization |
  | 10 | `CREDIT_FACTOR` | Weighted factors contributing to each score (income stability, debt ratio, etc.) |
  | 11 | `MODEL` | ML models with algorithm types (Regression, Classification, Clustering, Decision Tree) |
  | 12 | `CALCULATION` | Score computation runs linking credit profiles to models |
  | 13 | `PERFORMANCE` | Model evaluation metrics (accuracy, precision, recall, stability index, data drift) |
  | 14 | `B2B_CLIENT` | Business clients (finance companies, investment funds) consuming score queries |
  | 15 | `SERVICE_AGREEMENT` | B2B contracts with service levels, query limits, and per-query pricing |
  | 16 | `SCORE_QUERY` | Audit trail of every credit score lookup with result and recommendation |
  | 17 | `INVOICE` | Billing records for B2B query consumption |

  > **Note**: 14 core domain tables + 3 junction/transaction tables = 17 total, all with declarative foreign keys.

  ## Entity-Relationship Summary

  DATA_PARTNER ──┬── FINTECH_APP ────────────┐
                 ├── DATA_SHARING_AGREEMENT ──┤
                 └── EVENT ───────────────────┤
                                              ├── RAW_DATA_SOURCE
  USER_PROFILE ──┬── EVENT                    │
                 └── CREDIT_PROFILE ──────────┤
                       │                      │
                       ├── CALCULATION ───────┤
                       │    └── MODEL ────────┤
                       │         ├── PERFORMANCE
                       │         └── DATA_WAREHOUSE
                       │
                       └── CREDIT_SCORE ──────┘
                            └── CREDIT_FACTOR

  B2B_CLIENT ── SERVICE_AGREEMENT ── SCORE_QUERY ── CREDIT_SCORE
               INVOICE

  **Key relationships**:
  - A `DATA_PARTNER` owns multiple `FINTECH_APP`s and signs multiple `DATA_SHARING_AGREEMENT`s.
  - Each `EVENT` ties together a partner, app, agreement, data source, user, and warehouse — forming the central fact table.
  - `CREDIT_PROFILE` bridges `USER_PROFILE` and `DATA_WAREHOUSE`.
  - `CREDIT_SCORE` is produced by a `MODEL` applied to a `CREDIT_PROFILE`, with individual `CREDIT_FACTOR`s explaining the score.
  - `B2B_CLIENT`s query scores via `SERVICE_AGREEMENT`s and are billed through `INVOICE`s.

  ## Query Modules

  ### 1. Basic Lookups (Questions 1–4)
  Active partners, users born before 1990, financial/banking apps, warehouse capacity ranking.

  ### 2. Credit & Risk Joins (Questions 5–8)
  - User → Credit Profile → Credit Score mapping
  - VIP borrowers (score > 800): Lê Văn Cường (880), Võ Văn Hùng (970)
  - High-risk flagging: Phạm Thị Dung (score 540)
  - Regional debt analysis: TP.HCM accounts for 12,000 in debt

  ### 3. Aggregations & Statistics (Questions 9–12)
  - Total system debt: **45,000.50**
  - Risk distribution: 3 Low / 1 Medium / 1 High
  - Average credit score: **752.00**
  - Top spender: Phạm Thị Dung (AvgSpending = 5,000)

  ### 4. B2B & Invoicing (Questions 13–17)
  - Paid vs unpaid invoice tracking
  - Revenue per B2B client
  - Contract renewal pipeline (2024 expirations)
  - Query audit trail (June 2023)
  - Model-to-user traceability (which algorithm produced a specific user's score)

  ## Seed Data Snapshot

  | Entity | Count | Details |
  |---|---|---|
  | Data Partners | 5 | ABC Finance, XYZ Bank, An Tâm Insurance, DigiTech, Global Audit |
  | Fintech Apps | 5 | Mobile, banking, insurance portal, e-wallet, audit checker |
  | Users | 5 | 3 active, 2 inactive; spanning Hà Nội, TP.HCM, Đà Nẵng |
  | Data Warehouses | 5 | Region-specific, 3,000–7,500 capacity |
  | ML Models | 5 | 2 Regression, 1 Classification, 1 Clustering, 1 Decision Tree |
  | Credit Scores | 5 | Range 540–970 across Low/Medium/High risk |
  | B2B Clients | 5 | 3 finance companies, 2 investment funds |
  | Invoices | 5 | Total invoiced: 29,550; 3 paid, 2 unpaid |

  ## Key Findings & Business Insights

  ### Credit Portfolio Health
  - **3 of 5 users** fall in the Low Risk category — the portfolio is predominantly healthy.
  - **1 High Risk user** (Phạm Thị Dung) also has the highest average spending — a red flag for potential over-leverage.
  - Average score of 752 indicates a generally creditworthy user base.

  ### Model Performance

  | Model | Algorithm | Accuracy | Precision | Recall | Data Drift |
  |---|---|---|---|---|---|
  | Credit Prediction (HN) | Regression | **95.50%** | 96.00% | 94.50% | 2.50 |
  | Customer Classification (HCM) | Classification | 92.75% | 93.50% | 92.00% | 3.10 |
  | Claims Prediction (ĐN) | Regression | 89.00% | 90.00% | 88.50% | **4.20** |
  | E-Wallet Analysis | Clustering | 94.25% | 95.00% | 93.50% | 2.75 |
  | Audit Risk | Decision Tree | 91.50% | 92.00% | 91.00% | 3.50 |

  - **Best performer**: Credit Prediction Regression (95.50% accuracy).
  - **Needs attention**: Claims Prediction shows the lowest accuracy (89%) and highest data drift (4.20) — candidate for
  retraining.

  ### B2B Revenue

  | Client | Revenue | Status |
  |---|---|---|
  | Công ty Vay Vốn Minh An | 4,750 | Paid |
  | Quỹ Đầu Tư Phát Triển Việt | 3,600 | **Unpaid** |
  | Công ty Tài Chính An Bình | 9,000 | Paid |
  | Quỹ Đầu Tư Toàn Cầu | 5,600 | **Unpaid** |
  | Công ty Vay Vốn Sài Gòn | 6,600 | Paid |
  | **Total** | **29,550** | 41% outstanding |

  ### Recommendations
  1. **Collections**: Prioritize Phát Triển Việt & Toàn Cầu — 9,200 outstanding.
  2. **Model Ops**: Retrain the Claims Prediction model (Đà Nẵng); monitor data drift monthly.
  3. **Risk**: Flag Phạm Thị Dung for manual underwriting review.
  4. **Upsell**: Offer Premium upgrades to Standard-tier clients approaching query limits.
  5. **Renewals**: Three contracts expire in 2024 — initiate renewal discussions in Q4 2023.

  ## Quick Start

  Run the script sequentially against **SQL Server** (SQL Server 2019 or later):

  1. **`CREATE TABLE`** — 17 tables with `PRIMARY KEY` constraints
  2. **`ALTER TABLE`** — 19 `FOREIGN KEY` constraints establishing referential integrity
  3. **`INSERT`** — Seed data: 5 rows per table (85+ total records)
  4. **`SELECT`** — 17 analytical queries across 4 modules

  ```bash
  # Using sqlcmd
  sqlcmd -S <server> -d <database> -i fintech_creditscoring.sql

  ▎ Note: The script uses T-SQL features (TOP, NVARCHAR, YEAR()). Ensure the target database collation supports Vietnamese Unicode
  ▎ (e.g., Vietnamese_CI_AS).

  File Structure

  fintechcreditscoring/
  ├── fintech_creditscoring.sql    # Full DDL + DML + queries
  └── README.md                     # This file

  Tech Stack

  ┌───────────────┬────────────────────────────────────────────────────────────────────┐
  │     Layer     │                             Technology                             │
  ├───────────────┼────────────────────────────────────────────────────────────────────┤
  │ Dialect       │ T-SQL                                                              │
  ├───────────────┼────────────────────────────────────────────────────────────────────┤
  │ DBMS          │ Microsoft SQL Server 2019+                                         │
  ├───────────────┼────────────────────────────────────────────────────────────────────┤
  │ Schema design │ 3NF normalized, star-schema adjacent (EVENT as central fact table) │
  ├───────────────┼────────────────────────────────────────────────────────────────────┤
  │ Language      │ Vietnamese data values, English schema identifiers                 │
  └───────────────┴────────────────────────────────────────────────────────────────────┘

  Contributors

  - Member 1 — [role / contributions]
  - Member 2 — [role / contributions]
  - Member 3 — [role / contributions]

  Academic context: Database Systems course project, November 2025.
