"""
сформировать отношения между таблицами по sku не получилось
т.к. не все sku из этой таблицы были в словаре, что,
я так понимаю, связано с тем, что мне дали только часть данных из glossary
"""
CREATE TABLE API_data (
  dim_date VARCHAR(10),
  sku SERIAL,
  session_view_search INTEGER,
  hits_view_search INTEGER,
  hits_view_pdp INTEGER,
  session_view_pdp INTEGER,
  ordered_units INTEGER,
  cancellations INTEGER,
  "returns" INTEGER,
  revenue REAL,
  position_category REAL,
  hits_tocart INTEGER,
  conv_tocart REAL
);

COPY API_data
FROM '//ozon_api.csv'
DELIMITER ','
CSV HEADER;

ALTER TABLE API_data ALTER COLUMN dim_date TYPE DATE 
using to_date(dim_date, 'YYYY-MM-DD');

"""
PK повесил на две колонки, т.к. ожидалось, что будут данные за несколько дней и, 
т.о. sku будет неуникальным. Но выгрузку дали только по 1 дню, код менять не стал, пусть остается.

"""
ALTER TABLE API_data 
ADD PRIMARY KEY (dim_date, sku); 