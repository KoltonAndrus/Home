function findg
    find -L . -name $argv[1] | xargs grep -r $argv[2]
end

function findjar
    find -L . -name "*.jar"
end     

function findl
    find -L . -name $argv
end
