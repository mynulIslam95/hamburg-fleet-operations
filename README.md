# Hamburg Fleet & Warehouse Operations Planner

An independent portfolio project exploring how a local scooter operations team could track fleet readiness, prioritise repairs and plan daily work.

The project combines simulated operational records with public Hamburg parking data. It is not affiliated with Lime and contains no internal company data.

## The operational problem

At the start of a shift, a supervisor needs to know:

- Which scooters are ready for use?
- Which repairs need attention first?
- Who is available to complete the work?
- Which incidents or parking locations require review?
- How are fleet availability, rides and listed costs changing?

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

The operational snapshot is dated 17 November 2026. Historical performance covers 18 October to 16 November 2026.

## What I built

### Google Sheets

A daily planner covering vehicle status, repair waiting times, staff attendance, task assignments and incident deadlines.

Checks flag issues such as absent employees receiving work, overlapping assignments and tasks exceeding available capacity.

### SQL

A SQLite database with queries for fleet status, overdue repairs, staff workload, incident deadlines, parking review and financial summaries.

The analysis includes joins, grouped summaries, weekly reporting and vehicle rankings using window functions.

### Tableau

An interactive dashboard showing daily rides, fleet availability, net revenue and listed operating costs.

A shared date filter lets the viewer compare all four charts over the same period.

### Parking analysis

A geographic comparison of simulated scooter locations with public Hamburg no-parking zones and parking sites.

Locations intersecting a no-parking zone are flagged for review.

## Selected results

| Measure | Result |
|---|---:|
| Available scooters in the current snapshot | 130 of 200 |
| Repairs waiting more than 24 hours | 10 |
| Average turnaround for completed repairs | 3.65 hours |
| Planned staff utilisation | 44.9% |
| Unresolved incidents | 12 |
| Field locations intersecting a no-parking zone | 45 |
| Simulated rides over 30 days | 25,409 |
| Simulated net revenue | €108,950.88 |
| Listed operating costs | €56,923.87 |

These results describe the simulated dataset. They do not represent real company performance.

## Decisions and checks

- Kept the current fleet snapshot separate from historical daily availability because they measure different periods.
- Checked SQL results against the spreadsheet totals.
- Used a shared date filter across the Tableau charts.
- Kept incident review separate from task assignment so additional work requires a capacity review.
- Labelled revenue minus listed costs as a contribution, rather than net profit.

## Limitations

Operational records, staff identities, prices and costs are simulated.

The task schedule does not establish real-world route feasibility or vehicle capacity.

Parking checks are a static geographic comparison. A location outside a mapped no-parking zone is not automatically permitted.

The financial model excludes costs such as depreciation, insurance and central administration.

## Tools

Google Sheets, Microsoft Excel file format, SQLite, DB Browser for SQLite, Python and Tableau Public.

## Data source

Public Hamburg e-scooter parking and no-parking datasets from the Hamburg Transparency Portal.

Operational assumptions and source attribution are documented in the accompanying project files.

## Author

Mynul Islam
