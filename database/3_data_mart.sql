"""
Витрина
"""

CREATE TABLE revenue_mart AS 
    SELECT g.great_category, 
           g.category,
           g.sku,
           g.name_short as "name",
           api.session_view_search,
           api.ordered_units,
           api.revenue,
           api.position_category
    FROM glossary as g
    JOIN API_data as api
        ON g.sku = api.sku
    ORDER BY 1, 2, 3;