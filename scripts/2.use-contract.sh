#!/usr/bin/env bash

set -e

echo
echo ---------------------------------------------------------
echo "Step 0: Check for environment variable with contract name"
echo ---------------------------------------------------------
echo

[ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable" && exit 1
[ -z "$CONTRACT" ] || echo "Found it! \$CONTRACT is set to [ $CONTRACT ]"

echo
echo
echo

echo "Here is the number of available tickets"

near view $CONTRACT getRemainingTicketCount

echo
echo
echo
echo
echo
echo
echo "Your current status"
near view $CONTRACT hasSignedUp

echo
echo
echo
echo
echo "Status of your signing procces"
near call $CONTRACT signUp --account_id greatm.testnet

echo
echo
echo
echo

exit 0
