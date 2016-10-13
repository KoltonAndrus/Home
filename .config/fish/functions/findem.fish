function findem 
    find -L . -name "*.em" | xargs grep -r $argv[1] 
end
