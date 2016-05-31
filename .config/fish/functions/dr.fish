function dr
    set -lx source_dir ( pwd | grep -oE "[^/]+\$" )
    docker run -it --cap-add=NET_ADMIN {$source_dir}-dev:latest
end
