# multi-zsh

A micro framework to run the same zsh configuration on multiple operating systems

ZSH is present on several operating systems. Many commands are the same on each platform, but some are operating system or setup specific. To solve this problem multi-zsh was developed.

Here are some of the features:

- Central configuration of ZSH
- Cross-platform configuration of ZSH
- Compatible with all frameworks such as oh-my-zsh
- The entire zsh configuration becomes portable in just one folder
- Cross maintenance of the different configurations no matter from which or for which system
- Place your ZSH configuration wherever you want thanks to the integrated symlink-setup
  - This also enables cross-platform synchronization via Dropbox, other cloud services or github.

## Folder Structure

```
├── zsh: Contains the whole zsh configuration

	├── preload_configs: Contain preloaded configurations
		├── common: Insert common preload configs here (LOADED FOR ALL PLATFORMS)
		├── linux: Insert linux specific preload configs here
		├── macos: Insert macos specific preload configs here
		├── windows: Insert windows specific preload configs here
		└── ...

	├── zsh_modules: Contains aliases, functions etc.
		├── common: Insert common modules here, useful for cross-platform software like npm, yarn etc. (LOADED FOR ALL PLATFORMS)
			  ├── yarn.sh
        ├── npm.sh
			  └── ...
		├── linux: Insert linux specific modules here
        ├── apt.sh
			  └── ...
		├── macos: Insert macos specific modules here
        ├── brew.sh
			  └── ...
		├── windows: Insert windows specific modules here
		└── ...
```

## Setup

Installation steps

1.  Download the repo
2.  Place it in a desired location of your choice
3.  Migrate your current `~/.zshrc` file to `zsh/.zshrc`
4.  For this purpose a migration area is labeled
5.  Start `run-to-simlink.sh`

Now you can start creating the specific preconfigs and modules of your choice and share them across platforms and setups.

## Note

- The filenames of the `.sh` files (preconfigs and modules) should not contain whitespaces
