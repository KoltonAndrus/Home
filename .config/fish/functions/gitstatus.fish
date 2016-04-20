function gitstatus
    pushd (pwd) > /dev/null
    for file in /source/gremlin/* 
        echo -e "\n\e[1;36m$file"
        cd $file
        set -lx cmd_output (git status | grep -v "clean")
        echo $cmd_output
        cd ../
    end
    popd > /dev/null
end
