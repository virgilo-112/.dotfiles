export PATH=$PATH:/home/virgilo/.local/bin

eval "$(oh-my-posh init zsh --config ~/.config/ghostty/theme.json)"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh






#must be sourced last
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue


# ============================================
# ZSH History
# ============================================

# History file location
HISTFILE=~/.zsh_history

# Commands stored in memory (per session)
HISTSIZE=10000

# Commands saved to disk
SAVEHIST=10000

# Save history immediately, don't wait for the shell to exit
setopt INC_APPEND_HISTORY

# Share history between multiple terminal windows and tabs
setopt SHARE_HISTORY

# Append instead of overwriting the history file
setopt APPEND_HISTORY

# Skip consecutive duplicate commands
setopt HIST_IGNORE_DUPS

# Don't record commands that start with a space — useful for secrets
setopt HIST_IGNORE_SPACE

# Store a timestamp with each command
setopt EXTENDED_HISTORY

# Quality-of-life extras
setopt HIST_REDUCE_BLANKS          # strip superfluous whitespace
setopt HIST_VERIFY                 # show expanded history before running
setopt HIST_FIND_NO_DUPS           # skip duplicates when searching
setopt HIST_EXPIRE_DUPS_FIRST      # drop oldest duplicates first when trimming