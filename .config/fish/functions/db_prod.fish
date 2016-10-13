# Docker Build - Gremlin Client Prod
function db_prod
    set -lx source_dir ( pwd | grep -oE "[^/]+\$" )
    docker build -t $source_dir -f $argv[1] .
end
