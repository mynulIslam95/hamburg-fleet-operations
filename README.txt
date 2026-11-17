HAMBURG OPERATIONS SQL PROJECT

START HERE
1. Extract this ZIP on your Mac.
2. Open DB Browser for SQLite.
3. Click Open Database and select Hamburg_Operations.sqlite.
4. Click Execute SQL.
5. Paste: SELECT COUNT(*) AS total_scooters FROM vehicles;
6. Click the triangular Run button. Expected: 200.

Practice_Queries.sql contains 15 read-only queries in teaching order.
Run one SELECT at a time by selecting its complete text including the semicolon.
Expected_Results.json contains the verified output for every query.
Data_Dictionary.txt lists tables, columns and SQL types.

SOURCE AND TIME
Built from the uploaded Hamburg Fleet & Warehouse Operations Planner.xlsx.
All data is simulated except official Hamburg parking-site data and the derived
spatial checks that combine official geometry with synthetic scooter locations.
Snapshot: 17 Nov 2026, 08:00 Europe/Berlin. Performance: 18 Oct–16 Nov 2026.
Dates and timestamps are ISO text using local wall-clock time, not UTC.
Foreign-key links and database integrity were checked.

ONE-TIME SNAPSHOT
This database does not synchronise with Google Sheets. Update/export/rebuild to
incorporate later workbook edits. Source workbook SHA-256 is in source_metadata.
The uploaded workbook itself was not changed.

FINANCIAL LIMITS
Simulated revenue and costs are EUR excluding VAT. Listed-cost contribution is
not net profit. See source_metadata and the workbook's Perf_Settings for exclusions.
operating_costs.amount_eur and performance_reference preserve exported values.
daily_financials recomputes revenue and quantity-times-unit-cost expense totals.
Changing SQL settings does not regenerate simulated demand or cost quantities.

PARKING LIMITS
parking_checks is a fixed spatial analysis, not a live geofencing calculation.
No intersection does not establish permission to park. One null source geometry
was excluded. Attribution: Freie und Hansestadt Hamburg, BVM; DL-DE/BY-2.0.

LEARNING
SELECT chooses columns. FROM chooses a table. WHERE filters rows.
GROUP BY groups records. JOIN connects tables by matching IDs.
SQL queries here analyse existing data; they do not modify it.
