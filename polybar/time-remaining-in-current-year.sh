CURRENT_DAY=$(date +%-j)
TOTAL_DAYS_IN_YEAR=365

result=$(($TOTAL_DAYS_IN_YEAR - $CURRENT_DAY))
echo "$result days until new year"
