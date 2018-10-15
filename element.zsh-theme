# shorten dirs
get_pwd() {
	short_path="${PWD/$HOME/~}"
	echo $(python3 ~/.config/element/shorten_path.py $short_path)
}

# get git repo info
git_prompt_info() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return 
	echo "git@$fg_bold[magenta]$(current_branch)"
}

function spacing() {
	local git=$(git_prompt_info)
	if [ ${#git} != 0 ]; then
		((git=${#git}))
	else
		git=0
	fi
	local termwidth
	termwidth=$(($(tput cols) + 8 - ${#$(get_pwd)} -  ${git}))
	ch=" "

	if [ ${git} = 0 ]; then
		printf " "
	else
		printf "$fg[red]"'%*s' "$termwidth" | tr ' ' "$ch"
	fi
	
}

# prints it all
PROMPT='
$reset_color$fg[blue]$(get_pwd)$(spacing)$fg[magenta]$(git_prompt_info)
$fg[cyan]$ $reset_color'