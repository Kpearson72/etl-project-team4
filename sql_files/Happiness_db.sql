-- drop tables if exists


DROP TABLE IF EXISTS gov_response;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS world_covid_data;
DROP TABLE IF EXISTS world_happiness;
DROP TABLE IF EXISTS un_government;


CREATE TABLE un_government (
	id SERIAL PRIMARY KEY,
    country VARCHAR NOT NULL,
    world_region VARCHAR NOT NULL,
    gov_type VARCHAR NOT NULL
);

CREATE TABLE world_happiness (
    country_id INT PRIMARY KEY,
	FOREIGN KEY (country_id) REFERENCES un_government(id),
    happiness_rank FLOAT   NOT NULL,
    social_support FLOAT   NOT NULL,
    healthy_life_expectancy FLOAT   NOT NULL,
    freedom_of_choice FLOAT   NOT NULL,
    generosity FLOAT   NOT NULL,
    perceptions_of_corruption FLOAT   NOT NULL,
	ladder_score_in_dystopia FLOAT NOT NULL
);

CREATE TABLE world_covid_data (
	covid_cases_id SERIAL PRIMARY KEY,
    country_id INT NOT NULL,
	FOREIGN KEY (country_id)REFERENCES un_government(id),
    date DATE   NOT NULL,
    new_cases INT   NOT NULL,
    new_deaths INT   NOT NULL
);

CREATE TABLE gov_response (
	response_id SERIAL PRIMARY KEY,
    country_id INT NOT NULL,
	FOREIGN KEY (country_id)REFERENCES un_government(id),
    gov_resp_date DATE   NOT NULL,
    gov_resp_desc VARCHAR   NOT NULL,
    gov_resp_type VARCHAR   NOT NULL,
    gov_resp_link_src VARCHAR   NOT NULL
	
);




