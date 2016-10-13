function findg
    find -L . -name $argv[1] | xargs grep -r $argv[2] 
end
