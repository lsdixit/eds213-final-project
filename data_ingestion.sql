-- This code creates and ingests all tables necessary for this project. 

-- CPUE data
CREATE TABLE cpue (
    Date DATE NOT NULL,
    Station_code VARCHAR NOT NULL,
    Year INTEGER NOT NULL,
    Month VARCHAR NOT NULL,
    Organism_code VARCHAR,
    Mean_cpue DECIMAL(18,6) NOT NULL,
    Total_grabs INTEGER NOT NULL
    );

COPY cpue FROM 'data/processed/cpue.csv' (header TRUE);

-- Site data
CREATE TABLE site (
    Station_code VARCHAR PRIMARY KEY NOT NULL,
    Location VARCHAR NOT NULL,
    Latitude VARCHAR NOT NULL,
    Longitude VARCHAR NOT NULL,
    Period_of_record_from VARCHAR NOT NULL,
    Period_of_record_to VARCHAR NOT NULL,
    Missing VARCHAR,
    Status VARCHAR NOT NULL
    );

COPY site FROM 'data/processed/site.csv' (header TRUE);

-- Organism keylist data
CREATE TABLE org_keylist (
    Organism_code VARCHAR PRIMARY KEY,
    Phylum VARCHAR NOT NULL,
    Class_level VARCHAR NOT NULL,
    Order_level VARCHAR NOT NULL,
    Family_level VARCHAR NOT NULL,
    Genus VARCHAR NOT NULL,
    Species VARCHAR NOT NULL,
    Common_name VARCHAR NOT NULL,
); 

COPY org_keylist FROM 'data/processed/org_keylist.csv' (header TRUE);
