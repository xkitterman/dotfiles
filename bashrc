if [ -f ~/.bash_aliases ]
then
    source ~/.bash_aliases
fi

if [ -f ~/.bash_colors ]
then
    source ~/.bash_colors
fi

# Terminal prompt configuration
function git_branch {
    git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/(\1)/"
}

bold="\e[1m"
dim="\e[2m"
underline="\e[4m"
blink="\e[5m"
invert="\e[7m"
hidden="\e[8m"

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

header=$(format " ---\n|" $(color $Color256_Orange1) $bold)
working_dir=$(format " \w" $(color $Color256_SteelBlue) $bold)
git_branch=$(format "\$(git_branch)" $(color $Color256_Orange1))
prompt=$(format " ->" $(color $Color256_Orange1) $bold)

export PS1="${header}${working_dir} ${git_branch}\n${prompt} "

