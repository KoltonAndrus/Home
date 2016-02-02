function gitstatus
    pushd (pwd) > /dev/null
    for file in /source/gremlin/* 
        echo -e "\n\e[1;36m$file"; tput sgr0; cd $file;
        if git status | grep -E "*ahead"
            git status
    end
    popd > /dev/null
end
