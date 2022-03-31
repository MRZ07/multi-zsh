# 1. LOAD CONFIGURATION

ZSH_CONFIG_FOLDER=$(dirname $(readlink -f $HOME/.zshrc)) # Read real filepath.
PRELOAD_CONFIGS_FOLDER=${ZSH_CONFIG_FOLDER}/preload_configs
ZSH_MODULES=${ZSH_CONFIG_FOLDER}/zsh_modules

local BASE_FOLDERS=("$PRELOAD_CONFIGS_FOLDER" "$ZSH_MODULES")

local OS_SCRIPT_FOLDERS=("common" "$OSTYPE")

# Add some additional folders to detect.
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  OS_SCRIPT_FOLDERS+=("linux")
elif [[ "$OSTYPE" == "darwin"* ]]; then
  OS_SCRIPT_FOLDERS+=("macos")
elif [[ "$OSTYPE" == "win32" ]]; then
  OS_SCRIPT_FOLDERS+=("windows")
fi

# 2. LOAD PRELOAD CONFIGS THEN MODULES (ALIASES & FUNCTIONS etc.)

for base_folder in $BASE_FOLDERS; do
  local folder=$base_folder/$f
  if [ -d "$folder" ]; then
    # Will break on whitespace in filename.
    for i in $(
      find $folder -name \*.sh
    ); do
      source "$i"
    done
  fi
done
