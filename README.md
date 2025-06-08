# SQL Data Analysis | Learn SQL by Doing

This repository collects a variety of MySQL database dumps and example
queries used for learning and practicing SQL. Each dataset is provided as
an SQL script that creates the schema and inserts sample data. Some
datasets also include separate files with queries demonstrating common
data analysis tasks.

## Included Datasets

The scripts cover multiple sample databases such as *appstore*,
*bookreview*, *carsonline*, *hr*, *job_adverts*, *onlinecampus*,
*netflix*, *airbnb*, *spotify*, *umart*, *sakila*, *world* and more.
Consult `LICENSE.txt` for the license applied to each dataset.

## Usage

Load a database by executing the corresponding `<dataset>_mysql.sql` file
in your MySQL environment. You can then explore the data using the
provided analysis scripts (`<dataset>_data_analysis.sql`) or by writing
your own queries.

## Running Tests

A small `pytest` test suite validates that every SQL file in the root of
the repository contains at least one `SELECT` statement. After installing
`pytest`, run the tests from the repository root with:

```bash
pytest
```
