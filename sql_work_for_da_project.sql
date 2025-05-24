-- Create and use the database
CREATE DATABASE covid_tracking;
USE covid_tracking;

-- Create tables
CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100),
    state_name VARCHAR(100),
    population INT
);

CREATE TABLE cases (
    case_id SERIAL PRIMARY KEY,
    location_id INT REFERENCES locations(location_id),
    date_reported DATE,
    total_cases INT,
    new_cases INT
);

CREATE TABLE deaths (
    death_id SERIAL PRIMARY KEY,
    location_id INT REFERENCES locations(location_id),
    date_reported DATE,
    total_deaths INT,
    new_deaths INT
);

CREATE TABLE vaccinations (
    vaccination_id SERIAL PRIMARY KEY,
    location_id INT REFERENCES locations(location_id),
    date_reported DATE,
    total_vaccinated INT,
    daily_vaccinations INT,
    percent_vaccinated DECIMAL(5,2)
);

CREATE TABLE hospitalizations (
    hospitalization_id SERIAL PRIMARY KEY,
    location_id INT REFERENCES locations(location_id),
    date_reported DATE,
    total_hospitalized INT,
    icu_patients INT
);

CREATE TABLE testing_data (
    test_id SERIAL PRIMARY KEY,
    location_id INT REFERENCES locations(location_id),
    date_reported DATE,
    total_tests INT,
    positive_cases INT,
    test_positivity_rate DECIMAL(5,2)
);

-- Create indexes for efficient querying
CREATE INDEX idx_cases_date ON cases(date_reported);
CREATE INDEX idx_deaths_date ON deaths(date_reported);
CREATE INDEX idx_vaccinations_date ON vaccinations(date_reported);
CREATE INDEX idx_testing_date ON testing_data(date_reported);
