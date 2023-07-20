COPY circuits(ID,circuitRef,name,location,country,lat,lng,alt,url)
FROM '/tmp/csv_data/circuits.csv'
DELIMITER ','
CSV HEADER;

COPY races(ID,year,round,circuitId,name,date,time,url)
FROM '/tmp/csv_data/races.csv'
DELIMITER ','
CSV HEADER;


COPY constructors(ID,constructorRef,name,nationality,url)
FROM '/tmp/csv_data/constructors.csv'
DELIMITER ','
CSV HEADER;

COPY drivers(ID,driverRef,number,code,forename,surname,dob,nationality,url)
FROM '/tmp/csv_data/drivers.csv'
DELIMITER ','
CSV HEADER;

COPY seasons(year,url)
FROM '/tmp/csv_data/seasons.csv'
DELIMITER ','
CSV HEADER;

COPY status(statusId,status)
FROM '/tmp/csv_data/status.csv'
DELIMITER ','
CSV HEADER;

COPY constructorResults(ID,raceId,constructorId,points,status)
FROM '/tmp/csv_data/constructorResults.csv'
DELIMITER ','
CSV HEADER;

COPY contructorStandings(ID,raceId,constructorId,points,position,positionText,wins)
FROM '/tmp/csv_data/contructorStandings.csv'
DELIMITER ','
CSV HEADER;

COPY driverStandings(ID,raceId,driverId,points,position,positionText,wins)
FROM '/tmp/csv_data/driverStandings.csv'
DELIMITER ','
CSV HEADER;

COPY lapTimes(raceId,driverId,lap,position,time,milliseconds)
FROM '/tmp/csv_data/lapTimes.csv'
DELIMITER ','
CSV HEADER;

COPY pitStops(raceId,driverId,stop,lap,time,duration,milliseconds)
FROM '/tmp/csv_data/pitStops.csv'
DELIMITER ','
CSV HEADER;

COPY qualifying(ID,raceId,driverId,constructorId,number,position,q1,q2,q3)
FROM '/tmp/csv_data/qualifying.csv'
DELIMITER ','
CSV HEADER;

COPY results(ID,raceId,driverId,constructorId,number,grid,position,positionText,positionOrder,points,laps,time,milliseconds,fastestLap,rank,fastestLapTime,fastestLapSpeed,statusId)
FROM '/tmp/csv_data/results.csv'
DELIMITER ','
CSV HEADER;
