!#/bin/bash

Terminal(){ # Print menu atau terminal
echo "+-----------------------------+------------+"
echo "| Option                      | (ID)       |"
echo "+-----------------------------+------------+"
echo "| Add CPU [Core] Usage        | (1)        |"
echo "| Remove CPU [Core] Usage     | (2)        |"
echo "| Add RAM [Fragment] Usage    | (3)        |"
echo "| Remove RAM [Fragment] Usage | (4)        |"
echo "| View All Scheduled Jobs     | (5)        |"
echo "| Exit Terminal               | (6)        |"
echo "+-----------------------------+------------+"
}

while [1]
do
  Terminal

  # Minta input user
  echo "Enter option [1-6]: "
  read choice
  echo ""
  case $choice in
    1)
       (crontab -l; echo "*/5 * * * * /bin/bash $(pwd)/scripts/core_monitor.sh") | crontab -
       ;;
    2)
       crontab -l | greb -v 'core_monitor.sh' | crontab -
       ;;
    3)
       (crontab -l; echo "*/5 * * * * /bin/bash $(pwd)/scripts/frag_monitor.sh") | crontab -
       ;;
    4)
       crontab -l | greb -v 'fragment_monitor.sh' | crontab -
       ;;
    5)
       crontab -l | greb -E 'core_monitor.sh|fragment_monitor.sh'
       ;;
    6)
       echo "Exitting terminal..."
       break
       ;;
    *)
       echo "ga salah ta?";;
done
