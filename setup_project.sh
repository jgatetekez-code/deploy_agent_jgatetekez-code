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

read -p "Do you want to update the attendance thresholds (Y/N)? " update_thresholds

if [[ "$update_thresholds" =~ ^[Yy]$ ]]; then

    read -p "Enter warning percentage: " warning_marks
    read -p "Enter failure percentage: " fail_marks

    sed -i "s/\"warning\": [0-9]*/\"warning\": $warning_marks/" \
    "attendance_tracker_$project_name/Helpers/config.json"

    sed -i "s/\"failure\": [0-9]*/\"failure\": $fail_marks/" \
    "attendance_tracker_$project_name/Helpers/config.json"

    echo "Thresholds updated for Warning($warning_marks) and Failure($fail_marks)"

else

    echo "Now using the default thresholds: Warning(75%) and Failure(50%)"

fi


echo "Checking Python installation..."

if python3 --version >/dev/null 2>&1
then
    echo "Python3 is installed."
else
    echo "Warning: Python3 is not installed."
fi

echo "Verifiying presence of all files"

for file in "${project_name}/attendance_checker.py" "${project_name}/Helpers/config.json" "${project_name}/Helpers/assets.csv" "${project_name}/reports/report.log"; do
    
    if [ -e "$file" ]; then
        echo "$file is found in the workspace $project_name"
    else
        echo "$file is MISSING in the workspace $project_name"
    fi
done