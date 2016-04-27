# Docker Build - Gremlin Client Prod
function db
    docker build -t gremlin --build-arg CACHEBUST=(date +%s) docker/
end
