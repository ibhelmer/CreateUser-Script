#!/bin/bash

# --------------------------------------------------------
# Script: create_users_from_csv.sh
# Læser brugere fra en CSV-fil og opretter dem på systemet
# Format: <fuldt navn>,<brugernavn>,<password>,<gruppe>,<email>
# --------------------------------------------------------

CSVFILE="$1"

if [[ ! -f "$CSVFILE" ]]; then
    echo "CSV-fil ikke fundet: $CSVFILE"
    exit 1
fi

# Læs CSV-fil linje for linje
while IFS=',' read -r fullname username password group email; do

    # Spring tomme linjer eller linjer uden brugernavn over
    [[ -z "$username" ]] && continue

    echo "Behandler bruger: $username"

    # Opret gruppe hvis den ikke findes
    if ! getent group "$group" >/dev/null; then
        echo "  -> Opretter gruppe: $group"
        sudo groupadd "$group"
    fi

    # Opret bruger hvis den ikke findes
    if ! id "$username" >/dev/null 2>&1; then
        echo "  -> Opretter bruger: $username"
        sudo useradd \
            -m \
            -s /bin/bash \
            -g "$group" \
            -c "$fullname, $email" \
            "$username"
    else
        echo "  -> Bruger findes allerede: $username"
    fi

    # Sæt password
    echo "$username:$password" | sudo chpasswd

    echo "  -> Password sat for $username"
    echo ""
done < "$CSVFILE"

echo "Alle brugere i CSV-filen er behandlet."
