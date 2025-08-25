 # NYC Traffic Collisions 

**Goal:** Identify when, where, and why most NYC collisions occur and recommend safety actions.

## Tech Stack
- **Excel:** initial cleaning and pivot-based dashboard validation
- **RStudio (tidyverse, janitor, ggplot2, lubridate):** reproducible analysis, charts, and a knit report

## 📊 Excel Work (Pivot Tables & Dashboard)

Created pivot tables to explore collisions by:

Hour of day (peak times, rush hour vs. late night)
Day of week (weekday vs. weekend patterns)
Month (seasonal trends)
Borough (high-risk areas across NYC)
Severity (injuries vs. fatalities by borough)
Top contributing factors (driver behavior, unsafe speed, distraction, etc.)
Combined charts and slicers into an interactive dashboard for filtering by borough, factor, and time.

📈 RStudio Work (Analysis & Plots)

Cleaned column names with janitor::clean_names()
Derived new features: hour, day_of_week, month, severity
Aggregated metrics with dplyr::count() and summarise()
Created visualizations with ggplot2:
Saved plots into outputs/plots/ for GitHub and report inclusion.





