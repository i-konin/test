CREATE TABLE glossary (
    sku SERIAL PRIMARY KEY,
    name_short VARCHAR,
    brand VARCHAR,
    category VARCHAR,
    great_category VARCHAR
);

CREATE TEMP TABLE tmp_table 
AS
SELECT * 
FROM glossary
WITH NO DATA;

COPY tmp_table 
FROM '//ozon_seller_glossary.csv'
DELIMITER ','
CSV HEADER;

INSERT INTO glossary
SELECT DISTINCT ON (sku) * -- задублированные строки мешали повесить первичный ключ
FROM tmp_table
ORDER BY (sku);

DROP TABLE tmp_table;