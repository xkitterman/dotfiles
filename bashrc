if [ -f ~/.bash_aliases ]
then
    source ~/.bash_aliases
fi

if [ -f ~/.bash_colors ]
then
    source ~/.bash_colors
fi

#set -o vi
#set show-mode-in-prompt on

# Terminal prompt configuration
function git_branch {
    git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/(\1)/"
}

function reset {
    echo "\e[0m"
}

function fmt_set {
    echo "\e[$1m"
}

function fmt_reset {
    echo "\e[2$1m"
}

function fg_color {
    echo "\e[38;5;$1m"
}

function bg_color {
    echo "\e[48;5;$1m"
}

function color {
    if [ "$1" != "" ]
    then
        if [ "$2" != "" ]
        then
            echo "$(fg_color $1)$(bg_color $2)"
        else
            echo "$(fg_color $1)"
        fi
    fi
}

function format {
    local text="$1"

    for format in "${@:2}"
    do
        text="${format}${text}"
    done

    echo "${text}\e[0m"
}

function get_ps1 {
    local bold="\e[1m"
    local dim="\e[2m"
    local underline="\e[4m"
    local blink="\e[5m"
    local invert="\e[7m"
    local hidden="\e[8m"

    local header=$(format " ---\n|" $(color $Color256_Orange1) $bold)
    local working_dir=$(format " \w" $(color $Color256_SteelBlue) $bold)
    local git_branch=$(format "\$(git_branch)" $(color $Color256_Grey))
    local prompt=$(format " ->" $(color $Color256_Orange1) $bold)

    echo "${header}${working_dir} ${git_branch}\n${prompt} "
}

export PS1=$(get_ps1)

function get_ls_colors {
    local default=x
    local black=a
    local red=b
    local green=c
    local brown=d
    local blue=e
    local magenta=f
    local cyan=g
    local light_grey=h
    local bold_black=A
    local bold_red=B

    local dir=$cyan$default
    local sym_link=$brown$default
    local socket=$green$default
    local pipe=$magenta$default
    local exe=$red$default
    local blck_special=$default$default
    local char_special=$default$default
    local exec_uid=$red$default
    local exec_gid=$red$default
    local dir_sticky=$cyan$default
    local dir_nonsticky=$cyan$default

    echo "$dir$sym_link$socket$pipe$exe$blck_special$char_special$exec_uid$exec_gid$dir_sticky$dir_nonsticky"
}

export CLICOLOR=1
export LSCOLORS=$(get_ls_colors)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
