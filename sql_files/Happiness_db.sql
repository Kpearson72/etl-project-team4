-- drop tables if exists


DROP TABLE IF EXISTS gov_response;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS world_covid_data;
DROP TABLE IF EXISTS world_happiness;
DROP TABLE IF EXISTS systems_govt ;


CREATE TABLE systems_govt (
	id INT PRIMARY KEY,
    name VARCHAR NOT NULL,
    head_of_state VARCHAR NOT NULL,
    gov_type VARCHAR NOT NULL
);

CREATE TABLE world_happiness (
    country_id INT PRIMARY KEY,
	FOREIGN KEY (country_id) REFERENCES systems_govt (id),
    happiness_rank FLOAT   NOT NULL,
    social_support FLOAT   NOT NULL,
    healthy_life_expectancy FLOAT   NOT NULL,
    freedom_of_choice FLOAT   NOT NULL,
    generosity FLOAT   NOT NULL,
    perceptions_of_corruption FLOAT   NOT NULL,
	ladder_score_in_dystopia FLOAT NOT NULL
);

CREATE TABLE world_covid_data (
	covid_cases_id INT PRIMARY KEY,
    country_id INT NOT NULL,
	FOREIGN KEY (country_id)REFERENCES systems_govt (id),
    date DATE   NOT NULL,
    new_cases INT   NOT NULL,
    new_deaths INT   NOT NULL
);

CREATE TABLE gov_response (
	response_id INT PRIMARY KEY,
    country_id INT NOT NULL,
	FOREIGN KEY (country_id)REFERENCES systems_govt (id),
    gov_resp_date DATE   NOT NULL,
    gov_resp_desc VARCHAR   NOT NULL,
    gov_resp_type VARCHAR   NOT NULL,
    gov_resp_link_src VARCHAR   NOT NULL
	
);




