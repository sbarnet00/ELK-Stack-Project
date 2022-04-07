#!/bin/bash
grep -i '05:00:00 AM\|08:00:00 AM\|02:00:00 PM\|08:00:00 PM\|11:00:00 PM' 0310* | awk -F' ' '{print $1, $2, $5, $6}' > Dealers_working_during_losses
grep -i '05:00:00 AM\|08:00:00 AM\|02:00:00 PM\|08:00:00 PM\|11:00:00 PM' 0312* | awk -F' ' '{print $1, $2, $5, $6}' >> Dealers_working_during_losses
grep -i '05:00:00 AM\|08:00:00 AM\|02:00:00 PM' 0315* | awk -F' ' '{print $1, $2, $5, $6}' >> Dealers_working_during_losses





