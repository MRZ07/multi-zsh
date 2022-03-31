# 1. LOAD CONFIGURATION
MULTI_ZSH_FOLDER=$(dirname $(realpath $HOME/.zshrc)) # Read real filepath.
MULTI_ZSH_PRELOAD_CONFIGS_FOLDER=${MULTI_ZSH_FOLDER}/preload_configs
MULTI_ZSH_MODULES_FOLDER=${MULTI_ZSH_FOLDER}/modules

local BASE_FOLDERS=("$PRELOAD_CONFIGS_FOLDER" "$MULTI_ZSH_MODULES_FOLDER")

local OS_SCRIPT_FOLDERS=("common" "$OSTYPE")

local OS_FOLDER=""

# Add additional os-folder to detect.
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS_FOLDER="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS_FOLDER="macos"
elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    OS_FOLDER="windows"
fi

OS_SCRIPT_FOLDERS=("${OS_SCRIPT_FOLDERS[@]}" $OS_FOLDER)

MULTI_ZSH_PATH_FILE=${MULTI_ZSH_FOLDER}/preload_configs/"$OS_FOLDER"/path.sh

source $MULTI_ZSH_PATH_FILE

# 2. LOAD PRELOAD CONFIGS THEN MODULES (ALIASES & FUNCTIONS etc.)
for base_folder in "${BASE_FOLDERS[@]}"; do
  for os_folder in "${OS_SCRIPT_FOLDERS[@]}"; do
    folder="$base_folder/$os_folder"
    if [[ -d "$folder" ]]; then
      # Handle folders with spaces in their names too.
      # Ignore files and folders starting with #.
      find "$folder" -type d -name "#*" -prune -o -type f -name "*.sh" -print0 | while IFS= read -r -d '' script; do
        source "$script"
      done
    fi
  done
done
