# Docker Build - Gremlin Client Prod
function db_prod
    docker build -t gremlin --build-arg CACHEBUST=(date +%s) docker/
end
