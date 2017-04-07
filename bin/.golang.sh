# vim: set filetype=sh :

DOT_GOLANG="$(dirname $0)/../.golang"

if [ ! -f "$DOT_GOLANG" ]; then
	DOT_GOLANG="$(pwd)/.golang"
fi

if [ ! -f "$DOT_GOLANG" ]; then
	echo "No \`.golang\` file (in \`$(pwd)\`), Run \`docker-golang-init\`"
	exit 1
fi

source "$DOT_GOLANG"
