SELECT
  c.year AS year,
  c.avg_temp AS detroit_avg_temp,
  g.avg_temp AS global_avg_temp,
  AVG(c.avg_temp) OVER (ORDER BY c.year ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) AS detroit_moving_avg_t,
  AVG(g.avg_temp) OVER (ORDER BY c.year ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) AS global_moving_avg_t
FROM city_data c
JOIN global_data g
  ON c.year = g.year
WHERE c.city = 'Detroit'
AND c.country = 'United States'
ORDER BY 1
