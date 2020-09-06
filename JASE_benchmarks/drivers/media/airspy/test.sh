old=$1
new=$2
echo $old $new
sed -i "s!$old!$new!" run.sh
