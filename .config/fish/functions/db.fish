# Docker Builder - Gremlin Client dev
function db
    set -lx source_dir ( pwd | grep -oE "[^/]+\$" )
    docker build -t {$source_dir}-dev -f $argv[1] . 
end
