#!/bin/ash
cd ./mst;
for i in $(ls)
do
    # for every locale
    LOCALE="$i"
    for k in $(ls "./$i/master")
    do
        # push every file
        FILE="./$i/master/$k"
        mongoimport --host "$HOST" --port 27017 --username "$USER" --password "$PASSWORD" \
            --ssl --file "$FILE" --jsonArray --drop --authenticationDatabase admin --db "$LOCALE" \
            --collection "$(basename $k .json)"
    done
done

