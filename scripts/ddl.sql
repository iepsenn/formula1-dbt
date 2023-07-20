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
    CONSTRAINT races_circuits_fk FOREIGN KEY(circuitId) REFERENCES circuits(ID)
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
    dob DATE NOT NULL,
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
    CONSTRAINT constructorResults_constructors_fk FOREIGN KEY(constructorId) REFERENCES constructors(ID)
);

-- constructorStandingsId,raceId,constructorId,points,position,positionText,wins, -> contructorStandings
CREATE TABLE contructorStandings (
    ID INTEGER NOT NULL,
    raceId INTEGER NOT NULL,
    constructorId INTEGER NOT NULL,
    points INTEGER NOT NULL,
    position INTEGER NOT NULL,
    positionText VARCHAR(2) NOT NULL,
    wins INTEGER NOT NULL,
    CONSTRAINT contructorStandings_pk PRIMARY KEY(ID, raceId, constructorId),
    CONSTRAINT contructorStandings_races_fk FOREIGN KEY(raceId) REFERENCES races(ID),
    CONSTRAINT contructorStandings_constructors_fk FOREIGN KEY(constructorId) REFERENCES constructors(ID)
);

-- driverStandingsId,raceId,driverId,points,position,positionText,wins -> driverStandings
CREATE TABLE driverStandings (
    ID INTEGER NOT NULL,
    raceId INTEGER NOT NULL,
    driverId INTEGER NOT NULL,
    points INTEGER NOT NULL,
    position INTEGER NOT NULL,
    positionText VARCHAR(2) NOT NULL,
    wins INTEGER NOT NULL,
    CONSTRAINT driverStandings_pk PRIMARY KEY(ID, raceId, driverId),
    CONSTRAINT driverStandings_races_fk FOREIGN KEY(raceId) REFERENCES races(ID),
    CONSTRAINT driverStandings_drivers_fk FOREIGN KEY(driverId) REFERENCES drivers(ID)
);

-- raceId,driverId,lap,position,time,milliseconds -> lapTimes
CREATE TABLE lapTimes (
    raceId INTEGER NOT NULL,
    driverId INTEGER NOT NULL,
    lap INTEGER NOT NULL,
    position INTEGER NOT NULL,
    time VARCHAR(20) DEFAULT NULL,
    milliseconds INTEGER NOT NULL,
    CONSTRAINT lapTimes_pk PRIMARY KEY(raceId, driverId),
    CONSTRAINT lapTimes_races_fk FOREIGN KEY(raceId) REFERENCES races(ID),
    CONSTRAINT lapTimes_drivers_fk FOREIGN KEY(driverId) REFERENCES drivers(ID)
);

-- raceId,driverId,stop,lap,time,duration,milliseconds -> pitStops
CREATE TABLE pitStops (
    raceId INTEGER NOT NULL,
    driverId INTEGER NOT NULL,
    stop INTEGER NOT NULL,
    lap INTEGER NOT NULL,
    time VARCHAR(20) DEFAULT NULL,
    duration DOUBLE PRECISION NOT NULL,
    milliseconds INTEGER NOT NULL,
    CONSTRAINT pitStops_pk PRIMARY KEY(raceId, driverId),
    CONSTRAINT pitStops_races_fk FOREIGN KEY(raceId) REFERENCES races(ID),
    CONSTRAINT pitStops_drivers_fk FOREIGN KEY(driverId) REFERENCES drivers(ID)
);

-- qualifyId,raceId,driverId,constructorId,number,position,q1,q2,q3 -> qualifying
CREATE TABLE qualifying (
    ID INTEGER NOT NULL,
    raceId INTEGER NOT NULL,
    driverId INTEGER NOT NULL,
    constructorId INTEGER NOT NULL,
    number INTEGER NOT NULL,
    position INTEGER NOT NULL,
    q1 VARCHAR(20) DEFAULT NULL,
    q2 VARCHAR(20) DEFAULT NULL,
    q3 VARCHAR(20) DEFAULT NULL,
    CONSTRAINT qualifying_pk PRIMARY KEY(ID, raceId, driverId, constructorId),
    CONSTRAINT qualifying_races_fk FOREIGN KEY(raceId) REFERENCES races(ID),
    CONSTRAINT qualifying_drivers_fk FOREIGN KEY(driverId) REFERENCES drivers(ID),
    CONSTRAINT qualifying_constructors_fk FOREIGN KEY(constructorId) REFERENCES constructors(ID)
);

-- rank,fastestLapTime,fastestLapSpeed,statusId -> results
CREATE TABLE results (
    ID INTEGER NOT NULL,
    raceId INTEGER NOT NULL,
    driverId INTEGER NOT NULL,
    constructorId INTEGER NOT NULL,
    number INTEGER NOT NULL,
    grid INTEGER NOT NULL,
    position INTEGER DEFAULT NULL,
    positionText VARCHAR(2) DEFAULT NULL,
    positionOrder INTEGER NOT NULL,
    points INTEGER NOT NULL,
    laps INTEGER NOT NULL,
    time VARCHAR(20) DEFAULT NULL,
    milliseconds INTEGER NOT NULL,
    fastestLap VARCHAR(20) DEFAULT NULL,
    rank INTEGER NOT NULL,
    fastestLapTime VARCHAR(20) DEFAULT NULL,
    fastestLapSpeed VARCHAR(20) DEFAULT NULL,
    statusId INTEGER NOT NULL,
    CONSTRAINT results_pk PRIMARY KEY(ID, raceId, driverId, constructorId),
    CONSTRAINT results_races_fk FOREIGN KEY(raceId) REFERENCES races(ID),
    CONSTRAINT results_drivers_fk FOREIGN KEY(driverId) REFERENCES drivers(ID),
    CONSTRAINT results_constructors_fk FOREIGN KEY(constructorId) REFERENCES constructors(ID),
    CONSTRAINT results_status_fk FOREIGN KEY(statusId) REFERENCES status(ID)
);
