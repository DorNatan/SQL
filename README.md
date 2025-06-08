# SQL Data Analysis | Learn SQL by Doing

This project is a curated collection of SQL scripts designed for hands-on
learning. It contains ready-made database dumps alongside query examples so
that you can practice real-world analysis techniques in a local MySQL
environment. Each dataset provides the full schema, inserts sample data, and
includes additional files that walk through typical tasks such as filtering,
aggregating, and joining tables.

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
