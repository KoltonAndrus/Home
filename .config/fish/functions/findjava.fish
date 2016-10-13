function findjava
    find -L . -name "*.java" | xargs grep -r $argv[1] 
end
