for u in kdaily larssono kkdang apratap ssieberts jguinney ; do
    adduser ${u};
    echo -e "$password\n$password" | passwd ${u} ;
done
