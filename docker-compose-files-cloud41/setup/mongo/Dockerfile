FROM jbjares/mongo_java8_maven:v1
COPY sd_environmentproperties.json  /sd_environmentproperties.json
CMD mongoimport --uri "mongodb://$mongo_host:$mongo_port" -h $mongo_host -p $mongo_port --db $mongo_db_name --collection $mongo_db_collection --drop --file /sd_environmentproperties.json

#CMD mongoimport --db $mongo_db_name --collection $mongo_db_collection --drop --file /sd_environmentproperties.json