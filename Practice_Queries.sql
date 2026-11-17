-- 01_vehicle_count
-- How many scooters are in the fleet?
SELECT COUNT(*) AS total_scooters FROM vehicles;

-- 02_status_breakdown
-- How many scooters have each status?
SELECT status,COUNT(*) AS scooters FROM vehicles GROUP BY status ORDER BY scooters DESC;

-- 03_overdue_repairs
-- Which repairs have waited more than 24 hours?
SELECT repair_id,vehicle_id,fault_type,priority,waiting_hours FROM repair_metrics WHERE waiting_alert='Over 24 hours' ORDER BY waiting_hours DESC;

-- 04_repair_vehicle_join
-- Join high-priority open repairs to vehicle records.
SELECT r.repair_id,r.vehicle_id,r.fault_type,v.battery_percent,v.status FROM repairs r JOIN vehicles v ON v.vehicle_id=r.vehicle_id WHERE r.priority='High' AND r.repair_status<>'Completed' ORDER BY r.repair_id;

-- 05_completed_turnaround
-- What is average completed-repair turnaround?
SELECT COUNT(*) AS completed_repairs,ROUND(AVG(waiting_hours),2) AS avg_wait_hours,ROUND(AVG(turnaround_hours),2) AS avg_turnaround_hours,ROUND(SUM(parts_cost_eur),2) AS parts_cost_eur FROM repair_metrics WHERE repair_status='Completed';

-- 06_staff_workload
-- Compare remaining staff capacity with assigned minutes.
SELECT employee_id,role,attendance,available_minutes,assigned_minutes,free_minutes,utilisation_pct FROM staff_workload ORDER BY assigned_minutes DESC;

-- 07_assignment_checks
-- Find absent staff or role mismatches in assignments.
SELECT t.task_id,t.assigned_employee_id,t.required_role,s.role,s.attendance FROM tasks t JOIN staff_shifts s ON s.employee_id=t.assigned_employee_id WHERE s.attendance<>'Present' OR t.required_role<>s.role;

-- 08_task_overlaps
-- Find overlapping assignments without counting each pair twice.
SELECT a.task_id AS task_a,b.task_id AS task_b,a.assigned_employee_id FROM tasks a JOIN tasks b ON a.assigned_employee_id=b.assigned_employee_id AND a.task_id<b.task_id AND a.planned_start<b.planned_end AND b.planned_start<a.planned_end;

-- 09_incident_deadlines
-- How many unresolved response/resolution deadlines are overdue?
SELECT SUM(response_overdue) AS responses_overdue,SUM(resolution_overdue) AS resolutions_overdue FROM incident_metrics;

-- 10_parking_review
-- Which field locations need a no-parking review?
SELECT vehicle_id,vehicle_status,latitude,longitude,nearest_site_distance_m FROM parking_checks WHERE zone_result='Intersects no-parking zone' ORDER BY vehicle_id;

-- 11_daily_trends
-- Review daily simulated performance.
SELECT date,rides,ROUND(availability_pct,2) AS availability_pct,ROUND(net_revenue_eur,2) AS net_revenue_eur,ROUND(listed_costs_eur,2) AS listed_costs_eur,ROUND(cost_per_ride_eur,2) AS cost_per_ride_eur FROM daily_financials ORDER BY date;

-- 12_financial_totals
-- Reconcile period revenue, costs and contribution.
SELECT SUM(rides) AS rides,ROUND(SUM(net_revenue_eur),2) AS net_revenue_eur,ROUND(SUM(listed_costs_eur),2) AS listed_costs_eur,ROUND(SUM(listed_cost_contribution_eur),2) AS listed_cost_contribution_eur,ROUND(SUM(listed_costs_eur)/SUM(rides),2) AS cost_per_ride_eur FROM daily_financials;

-- 13_cost_categories
-- Which listed costs are largest?
SELECT category,ROUND(SUM(quantity*unit_cost_eur),2) AS total_eur FROM operating_costs GROUP BY category ORDER BY total_eur DESC;

-- 14_weekly_trends
-- Compare Monday-based weeks; first and last weeks are partial.
SELECT date(date,'-'||((CAST(strftime('%w',date) AS INTEGER)+6)%7)||' days') AS week_start,COUNT(*) AS days_in_period,SUM(rides) AS rides,ROUND(SUM(net_revenue_eur),2) AS net_revenue_eur,ROUND(SUM(listed_costs_eur),2) AS listed_costs_eur FROM daily_financials GROUP BY week_start ORDER BY week_start;

-- 15_rank_vehicles
-- Rank vehicles by rides over the period.
SELECT vehicle_id,SUM(rides) AS rides,RANK() OVER (ORDER BY SUM(rides) DESC) AS ride_rank FROM vehicle_days GROUP BY vehicle_id ORDER BY ride_rank,vehicle_id LIMIT 20;
