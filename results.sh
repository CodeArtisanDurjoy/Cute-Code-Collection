#!/bin/bash

# Function to calculate grade
calculate_grade() {
    local AVG=$1
    if [ "$AVG" -ge 75 ]; then
        echo "Congrats, you got Distinction"
    elif [ "$AVG" -ge 60 ]; then
        echo "Congrats, you got First Class"
    elif [ "$AVG" -ge 50 ]; then
        echo "You got Second Class"
    elif [ "$AVG" -ge 35 ]; then
        echo "You got Third Class"
    else
        echo "Sorry, you failed"
    fi
}

# Read marks with a loop
declare -A subjects
for subject in "Maths" "Physics" "Chemistry"; do
    while true; do
        echo -e "Please enter $subject marks: \c"
        read -r marks
        if [[ "$marks" =~ ^[0-9]+$ ]] && [ "$marks" -le 100 ] && [ "$marks" -ge 0 ]; then
            subjects[$subject]=$marks
            break
        else
            echo "Invalid input. Enter a number between 0 and 100."
        fi
    done
done

# Check if all marks are >= 35
if [[ ${subjects[Maths]} -ge 35 && ${subjects[Physics]} -ge 35 && ${subjects[Chemistry]} -ge 35 ]]; then
    total=$((subjects[Maths] + subjects[Physics] + subjects[Chemistry]))
    avg=$((total / 3))
    echo "Total Marks = $total"
    echo "Average Marks = $avg"
    calculate_grade "$avg"
else
    echo "Sorry, you failed in one or more subjects."
fi
