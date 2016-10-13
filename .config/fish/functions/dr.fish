function dr
    set -lx source_dir ( pwd | grep -oE "[^/]+\$" )
    docker run -it --privileged --cap-add=ALL --volumes-from cargo-cache  {$source_dir}-dev:latest
end
