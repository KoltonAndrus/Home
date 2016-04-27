fish_vi_mode
eval (docker-machine env --shell fish)
set -x RUST_BACKTRACE 1
set -gx PATH $PATH /Users/kolton/.cargo/bin
