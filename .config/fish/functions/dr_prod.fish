# Docker Run - Gremlin Client Prod
function dr_prod
    set -lx source_dir ( pwd | grep -oE "[^/]+\$" )
    docker run -it --cap-add=NET_ADMIN {$source_dir}:latest
end
