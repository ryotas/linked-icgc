#!/bin/sh

while read line; do
  if [[ $line != "#"* ]]
  then
    project_code=`echo $line | cut -f 1`
    if [[ $project_code == "code" ]]; then
      echo ""
    #elif [[ -f ./output/$project_code.nt ]]; then
    #  echo "File ./output/$project_code.nt exists. Skipped."
    else 
      echo "#### $project_code ####"
      sh ./21_sed.sh $project_code
      sh ./22_mysql.sh $project_code
      sh ./23_d2rq.sh $project_code
    fi
  fi
done < $1
