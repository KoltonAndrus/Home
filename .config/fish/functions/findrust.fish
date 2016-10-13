function findrust
    find -L . -name "*.rs" | xargs grep -r $argv[1] 
end
