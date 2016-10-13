function findjs
    find -L . -name "*.js" | xargs grep -r $argv[1] 
end
