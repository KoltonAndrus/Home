# Docker Run - Gremlin Client Prod
function dr_prod
    docker run -it --cap-add=NET_ADMIN gremlin:latest
end
