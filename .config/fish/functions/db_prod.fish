# Docker Build - Gremlin Client Prod
function db_prod
    set -lx source_dir ( pwd | grep -oE "[^/]+\$" )
    docker build -t $source-dir --build-arg CACHEBUST=(date +%s) docker/
end
