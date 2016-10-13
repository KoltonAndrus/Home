function gitcount
    echo "Commits"
    git log --oneline --no-merges --author=$argv[1]@gremlininc.com | wc -l | tr -s \[:space:\]
    echo "Lines Changed"
    git log --stat  --oneline --no-merges --author=$argv[1]@gremlininc.com | grep \| | cut -d "|" -f 2 | awk '{print $1}' | awk '{s+=$1} END {print s}'
end
