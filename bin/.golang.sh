# vim: set filetype=sh :

DOT_GOLANG="$(dirname $0)/../.golang"

function find_dot_golang() {
	# start here
	cwd=$(pwd)

	while [ ! "$cwd" = '/' ]; do
		dot_golang="$cwd/.golang"

		if [ -f "$dot_golang" ]; then
			DOT_GOLANG="$dot_golang"

			break;
		fi

		cwd="$(dirname $cwd)"
	done
}

find_dot_golang


if [ ! -f "$DOT_GOLANG" ]; then
	echo "No \`.golang\` file (in \`$(dirname $DOT_GOLANG)\`), Run \`docker-golang-init\`"
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

