# LOAD CONFIGURATION__________________________________________________________________________

ZSH_CONFIG_FOLDER=$(dirname $(readlink -f $HOME/.zshrc)) # Read real filepath.
PRELOAD_CONFIGS_FOLDER=${ZSH_CONFIG_FOLDER}/preload_configs
ZSH_MODULES=${ZSH_CONFIG_FOLDER}/zsh_modules

local DETECTED_SCRIPT_FOLDERS=("common" "$OSTYPE")

# Add some additional folders to detect.
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  DETECTED_SCRIPT_FOLDERS+=("linux")
elif [[ "$OSTYPE" == "darwin"* ]]; then
  DETECTED_SCRIPT_FOLDERS+=("macos")
elif [[ "$OSTYPE" == "win32" ]]; then
  DETECTED_SCRIPT_FOLDERS+=("windows")
fi

# LOAD PRELOAD CONFIGS________________________________________________________________________

# Will break on whitespace in filename.
for f in $DETECTED_SCRIPT_FOLDERS; do
  local folder=$PRELOAD_CONFIGS_FOLDER/$f
  if [ -d "$folder" ]; then
    for i in $(
      find $folder -name \*.sh
    ); do
      source "$i"
    done
  fi
done

# MIGRATE HERE: Insert the content of your old .zshrc file below________________________________


# LOAD ALIASES & FUNCTIONS___________________________________________________________________

# Will break on whitespace in filename.
for f in $DETECTED_SCRIPT_FOLDERS; do
  local folder=$ZSH_MODULES/$f
  if [ -d "$folder" ]; then
    for i in $(
      find $folder -name \*.sh
    ); do
      source "$i"
    done
  fi
done
