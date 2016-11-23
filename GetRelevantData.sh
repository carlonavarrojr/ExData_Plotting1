#!/bin/bash

head household_power_consumption.txt -n1 > household_subset.txt
grep "^1/2/2007" household_power_consumption.txt >> household_subset.txt
grep "^2/2/2007" household_power_consumption.txt >> household_subset.txt


