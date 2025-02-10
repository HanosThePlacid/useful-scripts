#!/bin/bash

case "$1" in
  -lista)
    oktato_neve="$2 $3"
    if [ -z "$oktato_neve" ]; then
      echo "Hiba: Az oktató nevének megadása szükséges."
      exit 1
    fi
    kurzusok=$(grep -E "$oktato_neve" teams.dat | cut -d ',' -f1)
    echo "Az $oktato_neve oktatóhoz tartozó kurzusok: 
$kurzusok"
    ;;
  -hallgato)
    if [ -z "$2" ]; then
      echo "Hiba: A hallgató nevének megadása szükséges."
      exit 1
    fi

    hallgato_neve="$2 $3"

    kurzus_kodok=$(grep -E "$hallgato_neve," hallgato.dat | cut -d ',' -f2-)

    if [ -z "$kurzus_kodok" ]; then
      echo "Nincs találat az adott hallgatóhoz tartozó kurzusokra."
      exit 1
    fi

    oktatok=$(grep -E "$(echo "$kurzus_kodok" | tr ',' '|')" teams.dat | cut -d ',' -f3 | sort | uniq)

    if [ -z "$oktatok" ]; then
      echo "Nincs találat az adott hallgatóhoz tartozó oktatókra."
    else
      echo "Az $hallgato_neve hallgatót oktató tanárok:
$oktatok"
    fi
    ;;
  -sok)
    legtobb_oktato=$(awk -F ', ' '{print $3, $4}' teams.dat | sort | uniq -c | sort -nr | head -n 1)
    oktato_neve=$(echo "$legtobb_oktato" | awk '{print $2, $3}')
    kurzusok_szama=$(echo "$legtobb_oktato" | awk '{print $1}')
    echo "A legtöbb kurzust hirdető oktató: $oktato_neve"
    ;;
  *)
    echo "Hibás kapcsoló vagy nincs megadva."
    echo "Használat: $0 -lista oktatonev | -hallgato hallgatonev | -sok"
    exit 1
    ;;
esac