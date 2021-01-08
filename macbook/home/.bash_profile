# .bash_profile

echo 'Hello from .bash_profile'

# Prepend an item to the system path
prependpath () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="$1${PATH:+:$PATH}"
    esac
}

prependpath $HOME/bin
prependpath $HOME/.local/bin
unset -f prependpath

export PATH

# User specific environment and startup programs
export LANG=en_GB.UTF-8
export CLICOLOR=1
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export EDITOR=vim VISUAL=vim
export BROWSER=Chrome
#export BROWSER=firefox
export XDG_CONFIG_HOME=$HOME/.config

#export PS1='[\u@\h \W]\$ '
#export PS1='\w \$ '
export PS1='\w:\n\$ '

# FZF environment
export FZF_DEFAULT_OPTS="--height=33% --layout=reverse --border --preview-window=:hidden"
export FZF_DEFAULT_COMMAND='fd --hidden --color auto --type f --exclude .git'

# Java environment
# Use /usr/libexec/java_home -V to see available versions
# See https://medium.com/w-logs/installing-java-11-on-macos-with-homebrew-7f73c1e9fadf
# See https://stackoverflow.com/questions/52524112/how-do-i-install-java-on-mac-osx-allowing-version-switching
# See https://formulae.brew.sh/formula/openjdk
# See https://formulae.brew.sh/formula/openjdk@15
# See https://formulae.brew.sh/formula/openjdk@11
# See https://formulae.brew.sh/formula/openjdk@8
# See https://docs.aws.amazon.com/corretto/latest/corretto-11-ug/macos-install.html
# Aliases are set in .bashrc, including the default
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
export JAVA_15_HOME=$(/usr/libexec/java_home -v15)
export CORRETTO_11_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home

# Get the aliases and functions
[[ -r ~/.bashrc ]] && source ~/.bashrc

