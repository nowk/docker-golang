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


# check for required vars

if [ -z "$GOLANG_VERSION" ]; then
	echo "GOLANG_VERSION must be set"
	exit 1
fi

if [ -z "$GOLANG_VOLUMES_FROM" ]; then
	echo "GOLANG_VOLUMES_FROM must be set"
	exit 1
fi

