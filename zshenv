#! /bin/bash
[[ -f "$HOME/.config/env/env_base" ]] && source "$HOME/.config/env/env_base"
[[ "$USER" == "tbodrito" && -f "$HOME/.config/env/env_inria" ]] && source "$HOME/.config/env/env_inria"
[[ "$USER" == "theo" && -f "$HOME/.config/env/env_laptop" ]] && source "$HOME/.config/env/env_laptop"
