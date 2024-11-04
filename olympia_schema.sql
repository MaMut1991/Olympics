-- Datenbank löschen, falls sie bereits existiert
DROP DATABASE IF EXISTS olympia;

-- Neue Datenbank erstellen
CREATE DATABASE olympia;

-- Datenbank auswählen
USE olympia;

-- Tabelle athletes erstellen
DROP TABLE IF EXISTS athletes;
CREATE TABLE athletes (
    athlete_id   INT           NOT NULL,
    fullname     VARCHAR(255)  NOT NULL,
    sex          CHAR(1)       NOT NULL,
    height       INT           NOT NULL,
    weight       INT           NOT NULL,
    PRIMARY KEY (athlete_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabelle events erstellen
DROP TABLE IF EXISTS events;
CREATE TABLE events (
    event_id     INT           NOT NULL,
    sport        VARCHAR(255)  NOT NULL,
    event        VARCHAR(255)  NOT NULL,
    PRIMARY KEY (event_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabelle country erstellen
DROP TABLE IF EXISTS country;
CREATE TABLE country (
    noc          CHAR(3)       NOT NULL,
    country      VARCHAR(255)  NOT NULL,
    PRIMARY KEY (noc)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabelle athletes_event erstellen (nachdem alle referenzierten Tabellen erstellt wurden)
DROP TABLE IF EXISTS athletes_event;
CREATE TABLE athletes_event (
    athlete_id   INT                                   NOT NULL,
    event_id     INT                                   NOT NULL,
    year         INT                                   NOT NULL,
    medal        ENUM('Gold', 'Silver', 'Bronze')      DEFAULT NULL,
    age          INT                                   NOT NULL,
    noc          VARCHAR(3)                            NOT NULL,
    PRIMARY KEY (athlete_id, event_id),
    KEY (noc),
    FOREIGN KEY (athlete_id) REFERENCES athletes(athlete_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (noc) REFERENCES country(noc)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
