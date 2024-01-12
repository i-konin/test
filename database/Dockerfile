# сборка будет проходить в 2 этапа:
# 1 - привести JSON с данными озона к табличному виду
# 2 - поднять БД с этими данными на постгресе
#
# Данные загружаются сразу при запуске контейнера
# поэтому пробрасывать волюм не стал
# это сделано для ускорения перезапуска и упрощения дебага, 
# как и захардкоженные логин и пароль


FROM python as Parse 
COPY analytics_example.json analytics_example.json
COPY script.py script.py
RUN python3 ./script.py

FROM postgres
COPY --from=Parse ozon_api.csv ozon_api.csv
COPY ozon_seller_glossary.csv ozon_seller_glossary.csv
COPY 3_data_mart.sql docker-entrypoint-initdb.d/3_data_mart.sql
COPY 2_API_data.sql docker-entrypoint-initdb.d/2_API_data.sql
COPY 1_glossary.sql docker-entrypoint-initdb.d/1_glossary.sql

ENV POSTGRES_DB=my_db
ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=123

