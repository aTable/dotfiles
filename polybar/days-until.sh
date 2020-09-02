START=${1-20000101}
END=${2-20990101}
PREFIX=${3-"prefix"}
SUFFIX=${4-"suffix"}

start_date=$(date -d $START +%s)
end_date=$(date -d $END +%s)

difference="$(( (end_date - start_date) / (60*60*24) ))"
echo "$PREFIX $difference $SUFFIX"
