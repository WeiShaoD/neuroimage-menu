script
======


#!/bin/bash

#Check whether the file subjList.txt exists; if not, create it
if [ ! -f subjList.txt ]; then
        ls -d sub-?? > subjList.txt
fi

#Loop over all subjects and format timing files into FSL format
for subj in `cat subjList.txt` ; do
        cd $subj/func #Navigate to the subject's func directory, which contains the timing files

        #Extract the onset times for the incongruent and congruent trials for each run. NOTE: This script only extracts the trials in which the subject made a correct response. Accuracy is near$
        cat ${subj}_task-balloonanalogrisktask_run-01_events.tsv | awk '{if ($3=="pumps_demean") {print $1, $2, "1"}}' > pump_run1.txt
        cat ${subj}_task-balloonanalogrisktask_run-02_events.tsv | awk '{if ($3=="pumps_demean") {print $1, $2, "1"}}' > pump_run2.txt
        cat ${subj}_task-balloonanalogrisktask_run-03_events.tsv | awk '{if ($3=="pumps_demean") {print $1, $2, "1"}}' > pump_run3.txt

        cat ${subj}_task-balloonanalogrisktask_run-01_events.tsv | awk '{if ($3=="control_pumps_demean") {print $1, $2, "1"}}' > control_run1.txt
        cat ${subj}_task-balloonanalogrisktask_run-02_events.tsv | awk '{if ($3=="control_pumps_demean") {print $1, $2, "1"}}' > control_run2.txt
        cat ${subj}_task-balloonanalogrisktask_run-03_events.tsv | awk '{if ($3=="control_pumps_demean") {print $1, $2, "1"}}' > control_run3.txt

        cat ${subj}_task-balloonanalogrisktask_run-01_events.tsv | awk '{if ($3=="explode_demean") {print $1, $2, "1"}}' > explode_run1.txt
        cat ${subj}_task-balloonanalogrisktask_run-02_events.tsv | awk '{if ($3=="explode_demean") {print $1, $2, "1"}}' > explode_run2.txt
        cat ${subj}_task-balloonanalogrisktask_run-03_events.tsv | awk '{if ($3=="explode_demean") {print $1, $2, "1"}}' > explode_run3.txt

        cat ${subj}_task-balloonanalogrisktask_run-01_events.tsv | awk '{if ($3=="cash_demean") {print $1, $2, "1"}}' > cash_run1.txt
        cat ${subj}_task-balloonanalogrisktask_run-02_events.tsv | awk '{if ($3=="cash_demean") {print $1, $2, "1"}}' > cash_run2.txt
        cat ${subj}_task-balloonanalogrisktask_run-03_events.tsv | awk '{if ($3=="cash_demean") {print $1, $2, "1"}}' > cash_run3.txt


       cd ../..
done
