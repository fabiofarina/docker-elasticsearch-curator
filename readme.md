# docker-elasticsearch-curator

This only job executed by the docker built from this repository is to clean the elastic search logstash history leaving only a configurable amount of days worth of logging in the system. The job runs in the specified interval.

It can be run as follows:

	docker run -d -e DELAYED_START_IN_HOURS=12 -e INTERVAL_IN_HOURS=24 -e OLDER_THAN_IN_DAYS="10" -e ELASTIC_HOST="elasticsearch" farinafa/elasticsearch-curator
	
where **elasticsearch** is the name of the elasticsearch container and

* **INTERVAL\_IN\_HOURS**: The amount of time between two curator runs
* **OLDER\_THAN\_IN\_DAYS**: Indicates all logs with a date exceeding this age can be deleted.
* **DELAYED\_START\_IN\_HOURS**: Delays the curation cycle

