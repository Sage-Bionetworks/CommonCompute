<<<<<<< HEAD
for u in kdaily larssono kkdang apratap ssieberts jguinney tperumal; do
=======
for u in kdaily larssono kkdang apratap ssieberts jguinney sgosline dpalmer tperumal; do
>>>>>>> kdaily/test
    adduser ${u};
    echo -e "$1234password5678\n$1234password5678" | passwd -f ${u} ;
done
