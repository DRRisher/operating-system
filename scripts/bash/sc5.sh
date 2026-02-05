echo "Date: "
date

echo "Hostname: "
hostname

echo "Logged in user: "
whoami

echo "Total usage: "
df -h / | grep '/'
