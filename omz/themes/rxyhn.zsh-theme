PROMPT="%(?:%B%F{#78b892}%1{➜%}%b :%B%F{#df5b61}%1{➜%}%b ) %F{#67afc1}%c%f"
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{#6791c9}git:(%b%F{#df5b61}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f "
ZSH_THEME_GIT_PROMPT_DIRTY="%B%F{#6791c9})%b %F{#ecd28b}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%B%F{#6791c9})%b"
