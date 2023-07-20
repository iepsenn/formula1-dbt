CREATE TABLE circuits (
    ID INTEGER NOT NULL,
    circuitRef VARCHAR(30) NOT NULL,
    name VARCHAR(70) NOT NULL,
    location VARCHAR(70) NOT NULL,
    country VARCHAR(30) NOT NULL,
    lat DOUBLE PRECISION NOT NULL,
    lng DOUBLE PRECISION NOT NULL,
    alt VARCHAR(10) DEFAULT NULL,
    url VARCHAR(100) NOT NULL,
    CONSTRAINT circuits_pk PRIMARY KEY(ID)
);

CREATE TABLE races (
    ID INTEGER NOT NULL,
    year INTEGER NOT NULL,
    round INTEGER NOT NULL,
    circuitId INTEGER NOT NULL,
    name VARCHAR(70) NOT NULL,
    date VARCHAR(10) DEFAULT NULL,
    time VARCHAR(8) DEFAULT NULL,
    url VARCHAR(100) NOT NULL,
    fp1_date VARCHAR(10) DEFAULT NULL,
    fp1_time VARCHAR(10) DEFAULT NULL,
    fp2_date VARCHAR(10) DEFAULT NULL,
    fp2_time VARCHAR(10) DEFAULT NULL,
    fp3_date VARCHAR(10) DEFAULT NULL,
    fp3_time VARCHAR(10) DEFAULT NULL,
    quali_date VARCHAR(10) DEFAULT NULL,
    quali_time VARCHAR(10) DEFAULT NULL,
    sprint_date VARCHAR(10) DEFAULT NULL,
    sprint_time VARCHAR(10) DEFAULT NULL,
    CONSTRAINT races_pk PRIMARY KEY(ID),
    CONSTRAINT races_circuits_fk FOREIGN KEY(circuitId) REFERENCES circuits(ID)
);

CREATE TABLE constructors (
    ID INTEGER NOT NULL,
    constructorRef VARCHAR(30) NOT NULL,
    name VARCHAR(30) NOT NULL,
    nationality VARCHAR(30) NOT NULL,
    url VARCHAR(100) NOT NULL,
    CONSTRAINT constructors_pk PRIMARY KEY(ID)
);

CREATE TABLE drivers (
    ID INTEGER NOT NULL,
    driverRef VARCHAR(30) NOT NULL,
    number VARCHAR(3) DEFAULT NULL,
    code VARCHAR(3) DEFAULT NULL,
    forename VARCHAR(30) NOT NULL,
    surname VARCHAR(30) NOT NULL,
    dob DATE NOT NULL,
    nationality VARCHAR(30) NOT NULL,
    url VARCHAR(100) NOT NULL,
    CONSTRAINT drivers_pk PRIMARY KEY(ID)
);

CREATE TABLE seasons (
    year INTEGER NOT NULL,
    url VARCHAR(100) NOT NULL,
    CONSTRAINT seasons_pk PRIMARY KEY(year)
);

CREATE TABLE status (
    ID INTEGER NOT NULL,
    status VARCHAR(30) NOT NULL,
    CONSTRAINT status_pk PRIMARY KEY(ID)
);

CREATE TABLE constructorResults (
    ID INTEGER NOT NULL,
    raceId INTEGER NOT NULL,
    constructorId INTEGER NOT NULL,
    points DOUBLE PRECISION NOT NULL,
    status VARCHAR(30) DEFAULT NULL,
    CONSTRAINT constructorResults_pk PRIMARY KEY(ID, raceId, constructorId),
    CONSTRAINT constructorResults_races_fk FOREIGN KEY(raceId) REFERENCES races(ID),
    CONSTRAINT constructorResults_constructors_fk FOREIGN KEY(constructorId) REFERENCES constructors(ID)
);

CREATE TABLE constructorStandings (
    ID INTEGER NOT NULL,
    raceId INTEGER NOT NULL,
    constructorId INTEGER NOT NULL,
    points DOUBLE PRECISION NOT NULL,
    position INTEGER NOT NULL,
    positionText VARCHAR(2) NOT NULL,
    wins INTEGER NOT NULL,
    CONSTRAINT constructorStandings_pk PRIMARY KEY(ID, raceId, constructorId),
    CONSTRAINT constructorStandings_races_fk FOREIGN KEY(raceId) REFERENCES races(ID),
    CONSTRAINT constructorStandings_constructors_fk FOREIGN KEY(constructorId) REFERENCES constructors(ID)
);

CREATE TABLE driverStandings (
    ID INTEGER NOT NULL,
    raceId INTEGER NOT NULL,
    driverId INTEGER NOT NULL,
    points DOUBLE PRECISION NOT NULL,
    position INTEGER NOT NULL,
    positionText VARCHAR(3) NOT NULL,
    wins INTEGER NOT NULL,
    CONSTRAINT driverStandings_pk PRIMARY KEY(ID, raceId, driverId),
    CONSTRAINT driverStandings_races_fk FOREIGN KEY(raceId) REFERENCES races(ID),
    CONSTRAINT driverStandings_drivers_fk FOREIGN KEY(driverId) REFERENCES drivers(ID)
);

CREATE TABLE lapTimes (
    raceId INTEGER NOT NULL,
    driverId INTEGER NOT NULL,
    lap INTEGER NOT NULL,
    position INTEGER NOT NULL,
    time VARCHAR(20) DEFAULT NULL,
    milliseconds INTEGER NOT NULL,
    CONSTRAINT lapTimes_pk PRIMARY KEY(raceId, driverId, lap),
    CONSTRAINT lapTimes_races_fk FOREIGN KEY(raceId) REFERENCES races(ID),
    CONSTRAINT lapTimes_drivers_fk FOREIGN KEY(driverId) REFERENCES drivers(ID)
);

CREATE TABLE pitStops (
    raceId INTEGER NOT NULL,
    driverId INTEGER NOT NULL,
    stop INTEGER NOT NULL,
    lap INTEGER NOT NULL,
    time VARCHAR(20) DEFAULT NULL,
    duration VARCHAR(15) DEFAULT NULL,
    milliseconds INTEGER NOT NULL,
    CONSTRAINT pitStops_pk PRIMARY KEY(raceId, driverId, lap),
    CONSTRAINT pitStops_races_fk FOREIGN KEY(raceId) REFERENCES races(ID),
    CONSTRAINT pitStops_drivers_fk FOREIGN KEY(driverId) REFERENCES drivers(ID)
);

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

CREATE TABLE results (
    ID INTEGER NOT NULL,
    raceId INTEGER NOT NULL,
    driverId INTEGER NOT NULL,
    constructorId INTEGER NOT NULL,
    number VARCHAR(3) DEFAULT NULL,
    grid INTEGER NOT NULL,
    position VARCHAR(3) DEFAULT NULL,
    positionText VARCHAR(3) DEFAULT NULL,
    positionOrder INTEGER NOT NULL,
    points DOUBLE PRECISION NOT NULL,
    laps INTEGER NOT NULL,
    time VARCHAR(20) DEFAULT NULL,
    milliseconds VARCHAR(10) DEFAULT NULL,
    fastestLap VARCHAR(20) DEFAULT NULL,
    rank VARCHAR(3) DEFAULT NULL,
    fastestLapTime VARCHAR(20) DEFAULT NULL,
    fastestLapSpeed VARCHAR(20) DEFAULT NULL,
    statusId INTEGER NOT NULL,
    CONSTRAINT results_pk PRIMARY KEY(ID, raceId, driverId, constructorId),
    CONSTRAINT results_races_fk FOREIGN KEY(raceId) REFERENCES races(ID),
    CONSTRAINT results_drivers_fk FOREIGN KEY(driverId) REFERENCES drivers(ID),
    CONSTRAINT results_constructors_fk FOREIGN KEY(constructorId) REFERENCES constructors(ID),
    CONSTRAINT results_status_fk FOREIGN KEY(statusId) REFERENCES status(ID)
);

CREATE TABLE sprintResults (
    ID INTEGER NOT NULL,
    raceId INTEGER NOT NULL,
    driverId INTEGER NOT NULL,
    constructorId INTEGER NOT NULL,
    number VARCHAR(3) DEFAULT NULL,
    grid INTEGER NOT NULL,
    position VARCHAR(3) DEFAULT NULL,
    positionText VARCHAR(3) DEFAULT NULL,
    positionOrder INTEGER NOT NULL,
    points INTEGER NOT NULL,
    laps INTEGER NOT NULL,
    time VARCHAR(20) DEFAULT NULL,
    milliseconds VARCHAR(10) DEFAULT NULL,
    fastestLap VARCHAR(20) DEFAULT NULL,
    fastestLapTime VARCHAR(20) DEFAULT NULL,
    statusId INTEGER NOT NULL,
    CONSTRAINT sprintResults_pk PRIMARY KEY(ID, raceId, driverId, constructorId),
    CONSTRAINT sprintResults_races_fk FOREIGN KEY(raceId) REFERENCES races(ID),
    CONSTRAINT sprintResults_drivers_fk FOREIGN KEY(driverId) REFERENCES drivers(ID),
    CONSTRAINT sprintResults_constructors_fk FOREIGN KEY(constructorId) REFERENCES constructors(ID),
    CONSTRAINT sprintResults_status_fk FOREIGN KEY(statusId) REFERENCES status(ID)
);
