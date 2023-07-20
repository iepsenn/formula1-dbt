COPY circuits(ID,circuitRef,name,location,country,lat,lng,alt,url)
FROM '/tmp/data/circuits.csv'
DELIMITER ','
CSV HEADER;

COPY races(ID,year,round,circuitId,name,date,time,url,fp1_date,fp1_time,fp2_date,fp2_time,fp3_date,fp3_time,quali_date,quali_time,sprint_date,sprint_time)
FROM '/tmp/data/races.csv'
DELIMITER ','
CSV HEADER;


COPY constructors(ID,constructorRef,name,nationality,url)
FROM '/tmp/data/constructors.csv'
DELIMITER ','
CSV HEADER;

COPY drivers(ID,driverRef,number,code,forename,surname,dob,nationality,url)
FROM '/tmp/data/drivers.csv'
DELIMITER ','
CSV HEADER;

COPY seasons(year,url)
FROM '/tmp/data/seasons.csv'
DELIMITER ','
CSV HEADER;

COPY status(ID,status)
FROM '/tmp/data/status.csv'
DELIMITER ','
CSV HEADER;

COPY constructorResults(ID,raceId,constructorId,points,status)
FROM '/tmp/data/constructor_results.csv'
DELIMITER ','
CSV HEADER;

COPY constructorStandings(ID,raceId,constructorId,points,position,positionText,wins)
FROM '/tmp/data/constructor_standings.csv'
DELIMITER ','
CSV HEADER;

COPY driverStandings(ID,raceId,driverId,points,position,positionText,wins)
FROM '/tmp/data/driver_standings.csv'
DELIMITER ','
CSV HEADER;

COPY lapTimes(raceId,driverId,lap,position,time,milliseconds)
FROM '/tmp/data/lap_times.csv'
DELIMITER ','
CSV HEADER;

COPY pitStops(raceId,driverId,stop,lap,time,duration,milliseconds)
FROM '/tmp/data/pit_stops.csv'
DELIMITER ','
CSV HEADER;

COPY qualifying(ID,raceId,driverId,constructorId,number,position,q1,q2,q3)
FROM '/tmp/data/qualifying.csv'
DELIMITER ','
CSV HEADER;

COPY results(ID,raceId,driverId,constructorId,number,grid,position,positionText,positionOrder,points,laps,time,milliseconds,fastestLap,rank,fastestLapTime,fastestLapSpeed,statusId)
FROM '/tmp/data/results.csv'
DELIMITER ','
CSV HEADER;

COPY sprintResults(ID,raceId,driverId,constructorId,number,grid,position,positionText,positionOrder,points,laps,time,milliseconds,fastestLap,fastestLapTime,statusId)
FROM '/tmp/data/sprint_results.csv'
DELIMITER ','
CSV HEADER;
