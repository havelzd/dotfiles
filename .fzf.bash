# Setup fzf
# ---------
if [[ ! "$PATH" == */home/zhavelka/installs/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/zhavelka/installs/fzf/bin"
fi

eval "$(fzf --bash)"
