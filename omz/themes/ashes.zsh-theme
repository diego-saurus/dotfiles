PROMPT="%(?:%B%F{#aec795}%1{➜%}%b :%B%F{#c79595}%1{➜%}%b ) %F{#9eb7d0}%c%f"
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{#95aec7}git:(%b%F{#c79595}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f "
ZSH_THEME_GIT_PROMPT_DIRTY="%B%F{#95aec7})%b %F{#c7c795}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%B%F{#95aec7})%b"
