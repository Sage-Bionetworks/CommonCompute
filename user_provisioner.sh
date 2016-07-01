for u in blogsdon tperumal psnyder; do
    adduser ${u};
    echo -e "$1234password5678\n$1234password5678" | passwd -f ${u} ;
done
