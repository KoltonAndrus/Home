fish_vi_mode
set -x RUST_BACKTRACE 1
set -gx PATH $PATH /Users/kolton/.cargo/bin
set -gx PATH $PATH /Users/kolton/.cargo/RustDT/bin/racer
set -gx PATH $PATH /Library/TeX/texbin
set -gx RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src
source $HOME/.config/fish/homebrew.fish
