CREATE DATABASE Crime_Analysis_And_Reporting;
USE Crime_Analysis_And_Reporting;


CREATE TABLE VICTIMS (
    VictimID INT PRIMARY KEY,
    FirstName VARCHAR(25),
    LastName VARCHAR(25),
    DateOfBirth DATE,
    Gender CHAR(1),
    ContactInformation VARCHAR(100) --IT MAY CONTAIN THEIR ADDRESS OR PHONE NUMBER
);


CREATE TABLE SUSPECTS (
    SuspectID INT PRIMARY KEY,
    FirstName VARCHAR(25),
    LastName VARCHAR(25),
    DateOfBirth DATE,
    Gender VARCHAR(1),
    ContactInformation VARCHAR(100) --IT MAY CONTAIN THEIR ADDRESS OR PHONE NUMBER
);


CREATE TABLE INCIDENTS (
    IncidentID INT PRIMARY KEY,
    IncidentType VARCHAR(30),
    IncidentDate DATE,
    Location VARCHAR(150),
    Description VARCHAR(200),
    Status VARCHAR(50),
    VictimID INT,
	FOREIGN KEY (VictimID) REFERENCES VICTIMS(VictimID) ON DELETE CASCADE,
    SuspectID INT,
    FOREIGN KEY (SuspectID) REFERENCES SUSPECTS(SuspectID)ON  DELETE CASCADE
);


CREATE TABLE LAW_ENFORCEMENT_AGENCIES (
    AgencyID INT PRIMARY KEY,
    AgencyName VARCHAR(100),
    Jurisdiction VARCHAR(50),
    ContactInformation VARCHAR(100) --IT CONTAINS THEIR ADDRESS AND PHONE NUMBER
);


CREATE TABLE OFFICERS (
    OfficerID INT PRIMARY KEY,
    FirstName VARCHAR(25),
    LastName VARCHAR(25),
    BadgeNumber VARCHAR(30),
    Rank VARCHAR(20),
    ContactInformation VARCHAR(100), --IT CONTAINS THEIR ADDRESS AND PHONE NUMBER
    AgencyID INT,
    FOREIGN KEY (AgencyID) REFERENCES LAW_ENFORCEMENT_AGENCIES(AgencyID) ON DELETE CASCADE
);


CREATE TABLE EVIDENCE (
    EvidenceID INT PRIMARY KEY,
    Description VARCHAR(250),
    LocationFound VARCHAR(100),
    IncidentID INT,
    FOREIGN KEY (IncidentID) REFERENCES INCIDENTS(IncidentID) ON DELETE CASCADE
);


CREATE TABLE REPORTS (
    ReportID INT PRIMARY KEY,
    IncidentID INT,
	FOREIGN KEY (IncidentID) REFERENCES INCIDENTS(IncidentID) ON DELETE CASCADE,
    ReportingOfficer INT,
	FOREIGN KEY (ReportingOfficer) REFERENCES OFFICERS(OfficerID) ON DELETE CASCADE,
    ReportDate DATE,
    ReportDetails VARCHAR(200),
    Status VARCHAR(50)
);