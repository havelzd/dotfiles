# Setup fzf
# ---------
if [[ ! "$PATH" == */home/zhavelka/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/zhavelka/.fzf/bin"
fi

eval "$(fzf --bash)"
