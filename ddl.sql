-------------------------------------------------------
-- DIMENSIONS
-------------------------------------------------------

-- circuitId,circuitRef,name,location,country,lat,lng,alt,url -> circuits
CREATE TABLE circuits (
    ID INTEGER NOT NULL,
    circuitRef VARCHAR(30) NOT NULL,
    name VARCHAR(70) NOT NULL,
    location INTEGER NOT NULL,
    country VARCHAR(30) NOT NULL,
    lat DOUBLE PRECISION NOT NULL,
    lng DOUBLE PRECISION NOT NULL,
    alt DOUBLE PRECISION DEFAULT NULL,
    url VARCHAR(100) NOT NULL,
    CONSTRAINT circuits_pk PRIMARY KEY(ID)
);

-- raceId,year,round,circuitId,name,date,time,url -> races
CREATE TABLE races (
    ID INTEGER NOT NULL,
    year INTEGER NOT NULL,
    round INTEGER NOT NULL,
    circuitId INTEGER NOT NULL,
    name VARCHAR(70) NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    url VARCHAR(100) NOT NULL,
    CONSTRAINT races_pk PRIMARY KEY(ID),
    CONSTRAINT races_circuit_fk FOREIGN KEY(circuitId) REFERENCES circuits(ID)
);

--constructorId,constructorRef,name,nationality,url, -> constructors
CREATE TABLE constructors (
    ID INTEGER NOT NULL,
    constructorRef VARCHAR(30) NOT NULL,
    name VARCHAR(30) NOT NULL,
    nationality VARCHAR(30) NOT NULL,
    url VARCHAR(100) NOT NULL,
    CONSTRAINT constructors_pk PRIMARY KEY(ID)
);

-- driverId,driverRef,number,code,forename,surname,dob,nationality,url -> drivers
CREATE TABLE drivers (
    ID INTEGER NOT NULL,
    driverRef VARCHAR(30) NOT NULL,
    number INTEGER DEFAULT NULL,
    code VARCHAR(3) DEFAULT NULL,
    forename VARCHAR(30) NOT NULL,
    surname VARCHAR(30) NOT NULL,
    dob DATETIME NOT NULL,
    nationality VARCHAR(30) NOT NULL,
    url VARCHAR(100) NOT NULL,
    CONSTRAINT drivers_pk PRIMARY KEY(ID)
);

-- year,url -> seasons
CREATE TABLE seasons (
    year INTEGER NOT NULL,
    url VARCHAR(100) NOT NULL,
    CONSTRAINT seasons_pk PRIMARY KEY(year)
);

-- statusId,status -> status
CREATE TABLE status (
    ID INTEGER NOT NULL,
    status VARCHAR(30) NOT NULL,
    CONSTRAINT status_pk PRIMARY KEY(ID)
);

-------------------------------------------------------
-- FACTS
-------------------------------------------------------
-- constructorResultsId,raceId,constructorId,points,status -> constructorResults
CREATE TABLE constructorResults (
    ID INTEGER NOT NULL,
    raceId INTEGER NOT NULL,
    constructorId INTEGER NOT NULL,
    points INTEGER NOT NULL,
    status VARCHAR(30) DEFAULT NULL,
    CONSTRAINT constructorResults_pk PRIMARY KEY(ID, raceId, constructorId),
    CONSTRAINT constructorResults_races_fk FOREIGN KEY(raceId) REFERENCES races(ID),
    CONSTRAINT constructorResults_constructors_fk FOREIGN KEY(constructorId) REFERENCES constructors(ID),
);



-- constructorStandingsId,raceId,constructorId,points,position,positionText,wins, -> contructorsStandings
CREATE TABLE contructorsStandings (
    ID INTEGER NOT NULL,
    raceId INTEGER NOT NULL,
    constructorId INTEGER NOT NULL,
    points INTEGER NOT NULL,
    position INTEGER NOT NULL,
    positionText INTEGER NOT NULL,
    wins INTEGER NOT NULL,
    CONSTRAINT contructorsStandings_pk PRIMARY KEY(ID, raceId, constructorId),
    CONSTRAINT contructorsStandings_races_fk FOREIGN KEY(raceId) REFERENCES races(ID),
    CONSTRAINT contructorsStandings_constructors_fk FOREIGN KEY(constructorId) REFERENCES constructors(ID),
);

driverStandingsId,raceId,driverId,points,position,positionText,wins -> driverStandings
raceId,driverId,lap,position,time,milliseconds -> lapTimes
raceId,driverId,stop,lap,time,duration,milliseconds -> pitStops
qualifyId,raceId,driverId,constructorId,number,position,q1,q2,q3 -> qualifying

resultId,raceId,driverId,constructorId,number,grid,position,positionText,positionOrder,points,laps,time,milliseconds,fastestLap,rank,fastestLapTime,fastestLapSpeed,statusId -> results
