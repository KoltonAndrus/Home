function rust_indent
    find -L . -name "*.rs" -exec vim -s ~/.vim/scripts/indent.scr "{}" \;
end
