#!/bin/bash

job_id=254330

ssh -tt jjia@nodelogin01 /bin/bash << ENDSSH
echo "Hello, I an in nodelogin01 to do some git operations."
echo $job_id

jobs="$(squeue -u jjia --sort=+i | grep [00-90]:[00-60] | awk '{print $1}')"  # "" to make sure multi lines assigned
echo "Total jobs in one minutes:"
echo \$jobs

accu=0
for i in \$jobs; do
    if [[ \$i -eq $job_id ]]; then
    echo start sleep ...
    sleep \$accu
    echo sleep \$accu seconds
    fi

    echo \$i
    ((accu+=5))
    echo \$accu
done

ENDSSH
