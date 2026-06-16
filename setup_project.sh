#!/bin/bash

echo "Enter project name:"
read project_name

if [ -d "attendance_tracker_$project_name" ]; then
        echo "Directory already exists."
        exit 1
fi

mkdir "attendance_tracker_$project_name"

echo "Main folder created successfully.i"

mkdir "attendance_tracker_$project_name/Helpers"
mkdir "attendance_tracker_$project_name/reports"

echo "project structure created successfully."

cp project/attendance_checker.py "attendance_tracker_$project_name/"

cp project/assets.csv "attendance_tracker_$project_name/Helpers/"

cp project/config.json "attendance_tracker_$project_name/Helpers/"

cp project/reports.log "attendance_tracker_$project_name/reports/"
