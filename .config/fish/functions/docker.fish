# Docker Builder - Gremlin Client dev
function db
    docker build -t gremlin-dev .
end

# Docker Build - Gremlin Client Prod
function db_prod
    docker build -t gremlin --build-arg CACHEBUST=(date +%s) docker/
end

function dr
    docker run -it --cap-add=NET_ADMIN gremlin-dev:latest
end

# Docker Run - Gremlin Client Prod
function dr_prod
    docker run -it --cap-add=NET_ADMIN gremlin:latest
end

function redock
    docker-machine restart default
end
