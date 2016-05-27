function cb
    cargo build $argv
end

function cf
    cargo fmt -- --write-mode=replace
end

function ct
    cargo test -- --nocapture $argv
end
