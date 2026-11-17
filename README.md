# Hamburg Fleet & Warehouse Operations Planner

An independent portfolio project exploring how a scooter operations team could track fleet readiness, prioritise repairs and plan daily work in Hamburg.

The project combines simulated operational records with public Hamburg parking data. It is not affiliated with Lime and uses no internal company data.

## Interactive dashboard

[View the dashboard on Tableau Public](https://public.tableau.com/views/HamburgOperationsOverview/HamburgOperationsOverview)

Explore daily rides, fleet availability, net revenue and listed operating costs. A shared date filter updates all four charts.
<img width="1928" height="1454" alt="image" src="https://github.com/user-attachments/assets/e1319e9c-492f-4ef2-88c7-1df1b353fcc1" />


## The operational problem

At the start of a shift, a supervisor needs to know:

- Which scooters are available?
- Which repairs need attention first?
- Which employees have capacity for additional work?
- Which incidents and parking locations require review?
- How are rides, availability and operating costs changing?

I built a spreadsheet planner, a SQLite database and a Tableau dashboard to examine these questions.

## Project scope

| Component | Coverage |
|---|---|
| Fleet snapshot | 200 fictional scooters |
| Repair records | 75 jobs, including 50 completed repairs |
| Staff planning | 10 fictional employees and 70 scheduled tasks |
| Incident tracking | 30 fictional cases |
| Historical performance | 30 days and 6,000 vehicle-day records |
| Parking review | 150 simulated field locations checked against public geographic data |

The operational snapshot is dated **17 November 2026 at 08:00, Europe/Berlin**. Historical performance covers **18 October to 16 November 2026**.

## What I built

### Fleet and repair tracking

The spreadsheet tracks vehicle status, battery levels, repair priorities and repair timestamps.

Repair metrics identify jobs waiting more than 24 hours and calculate waiting time, completed repair turnaround and parts costs.

### Staff and task planning

The daily plan connects employee attendance, shifts, breaks and task assignments.

Checks flag role mismatches, assignments to absent employees, work outside shifts, break overlaps, overlapping tasks and capacity issues.

### Incident tracking

The incident tracker records case status, priority and response and resolution deadlines.

Cases needing supervisor review remain separate from scheduled tasks so additional work requires a capacity review.

### Parking analysis

A Python analysis compares simulated scooter locations with public Hamburg no-parking zones and calculates distances to mapped parking sites.

Locations intersecting a no-parking zone are flagged for review. Warehouse locations are excluded from the field parking assessment.

### SQL analysis

The SQLite database supports queries covering:

- Fleet counts by operational status
- Overdue and high-priority repairs
- Completed repair performance
- Staff workload and assignment checks
- Incident deadlines
- Parking review
- Daily and weekly performance
- Operating costs by category
- Vehicle rankings using window functions

### Tableau dashboard

The dashboard presents four daily trends:

- Rides
- Fleet availability
- Net revenue
- Listed operating costs

The shared date filter allows comparison over the same reporting period.

## Selected results

### Operational snapshot

| Measure | Result |
|---|---:|
| Available scooters | 130 of 200 |
| Snapshot fleet availability | 65.0% |
| Repairs waiting more than 24 hours | 10 |
| Completed repairs | 50 |
| Average turnaround for completed repairs | 3.65 hours |
| Staff present | 9 of 10 |
| Planned staff utilisation | 44.9% |
| Unresolved incidents | 12 |
| Field locations intersecting a no-parking zone | 45 of 150 |

### Historical performance

| Measure | Result |
|---|---:|
| Reporting days | 30 |
| Simulated rides | 25,409 |
| Simulated net revenue | €108,950.88 |
| Listed operating costs | €56,923.87 |
| Contribution after listed costs | €52,027.01 |
| Listed operating cost per ride | €2.24 |

These figures describe the simulated dataset. They do not represent actual company performance or measured business improvements.


## Project files

| File | Contents |
|---|---|
| [Operations planner](Hamburg_Operations_Planner.xlsx) | Fleet, repairs, staff planning, incidents and parking review |
| [30-day performance](Hamburg_30_Day_Performance.xlsx) | Historical performance and financial assumptions |
| [SQLite database](Hamburg_Operations.sqlite) | Operational tables and analytical views |
| [SQL queries](Practice_Queries.sql) | Queries used to explore and check the data |
| [Expected results](Expected_Results.json) | Reference results for validation |
| [Data dictionary](Data_Dictionary.txt) | Database structure and field descriptions |
| [Database instructions](README.txt) | Instructions for opening and querying the database |
| [Parking source data](Hamburg_Parking_Source_Data.zip) | Public Hamburg geographic source files |

## How to explore

1. Open the Tableau dashboard and adjust the date filter.
2. Review the spreadsheet for fleet status, repair records, staff assignments and incidents.
3. Open the SQLite database in DB Browser for SQLite.
4. Run the accompanying SQL queries to reproduce the analysis.
5. Review the parking notes and model assumptions before interpreting the results.

## Decisions and validation

### Separate snapshot and historical availability

The current snapshot shows how many scooters are available at one specific time. Historical availability measures available vehicle minutes across each reporting day.

These measures answer different questions, so I kept them separate.

### Check results across tools

I compared SQL outputs with spreadsheet totals for fleet counts, completed repairs, repair turnaround, incident deadlines and financial summaries.

### Review additional work before assignment

Incident escalation does not automatically create a scheduled task. A supervisor must first review staff capacity, required skills and existing assignments.

### Distinguish contribution from profit

Net revenue minus listed operating costs is labelled as a contribution. It is not net profit because the model does not include every business expense.

## Assumptions and limitations

- Vehicle records, staff identities, tasks, incidents, prices and costs are simulated.
- Incident response and resolution targets are project assumptions, not official Lime policies.
- The task schedule does not establish real-world route feasibility, travel times or field vehicle capacity.
- Parking checks are a static geographic comparison. Coordinate changes require the analysis to be rerun.
- A location outside a mapped no-parking zone is not automatically permitted.
- Distance to a parking point does not establish that a scooter is inside an authorised parking area.
- Financial calculations exclude costs such as depreciation, insurance and central administration.
- The SQLite database and Tableau data are snapshots. They do not automatically synchronise with Google Sheets.

## Tools

| Tool | Purpose |
|---|---|
| Google Sheets | Daily planning, formulas and operational checks |
| Excel workbook format | Data exchange and Tableau upload |
| SQLite | Structured storage and analytical queries |
| DB Browser for SQLite | Query execution and result inspection |
| Python | Data preparation and geographic analysis |
| Tableau Public | Interactive performance dashboard |

## Data sources

Public Hamburg e-scooter parking and no-parking datasets were obtained through the [Hamburg Transparency Portal](https://transparenz.hamburg.de/).

The geographic data is attributed to Hamburg’s Behörde für Verkehr und Mobilitätswende (BVM) under Datenlizenz Deutschland – Namensnennung – Version 2.0.

Licence: https://www.govdata.de/dl-de/by-2-0

The accompanying parking notes document the source files, coordinate systems and processing limitations.

All operational records and financial assumptions were created for this portfolio project.

## Author

[Mynul Islam](https://github.com/mynulIslam95)
