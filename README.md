# SLCSP

[![Build Status](https://travis-ci.org/wojno/slcsp.svg?branch=master)](https://travis-ci.org/wojno/slcsp)

## Problem

You have been asked to determine the second lowest cost silver plan (SLCSP) for
a group of ZIP Codes.
## Overview

I chose to place my code into the `lib` folder for most `classes`.  Appropriate `tests` are located in the `test` folder. `Code coverage` provided through `SimpleCov`.

I chose to implement a few basic `rake` tasks to easily run the `assignment`.

Given the one time nature of the application, it made sense to store the required information in memory.  The level of effort against adding a database connection was forgone at this time to provide a solution that was both minimum and viable.  Should the objective require multiple runs, I would have also considered moving the code into a `gem` for future maintainability.

## Usage

### Prerequisites

Install the required ruby gems

    $ bundle install

### Tests / Dev Notes

Run the tests

    $ bundle exec rake test

Check dev notes

    $ bundle exec rake notes

### Do it

Run program and print output to console

    $ bundle exec rake slcsp:console

Run program and create new csv, per homework

    $ bundle exec rake slcsp:csv

## Task

You have been given a CSV file, `slcsp.csv`, which contains the ZIP Codes in the
first column. Fill in the second column with the rate (see below) of the
corresponding SLCSP. Your answer is the modified CSV file, plus any source code
used.

Write your code in your best programming language.

The order of the rows in your answer file must stay the same as how they
appeared in the original `slcsp.csv`.

It may not be possible to determine a SLCSP for every ZIP Code given. Check for cases
where a definitive answer cannot be found and leave those cells blank in the output CSV (no
quotes or zeroes or other text).

## Additional information

The SLCSP is the so-called "benchmark" health plan in a particular area. It is
used to compute the tax credit that qualifying individuals and families receive
on the marketplace. It is the second lowest cost unique silver rate in the rate area.

A plan has a "metal level", which can be either Bronze, Silver, Gold, Platinum,
or Catastrophic. The metal level is indicative of the level of coverage the plan
provides.

A plan has a "rate", which is the amount that a consumer pays as a monthly
premium, in dollars.

A plan has a "rate area", which is a geographic region in a state that
determines the plan's rate. A rate area is a tuple of a state and a number, for
example, NY 1, IL 14.

There are two additional CSV files in this directory besides `slcsp.csv`:

  * `plans.csv` -- all the health plans in the U.S. on the marketplace
  * `zips.csv` -- a mapping of ZIP Code to county/counties & rate area(s)

A ZIP Code can potentially be in more than one county. If the county can not be
determined definitively by the ZIP Code, it may still be possible to determine
the rate area for that ZIP Code.

A ZIP Code can also be in more than one rate area. In that case, the answer is ambiguous
and should be left blank.
