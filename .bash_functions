############################################################################
# FILE: .bash_fuctions
#
# This file loads Ty's bash functions
# **NOTE** must be loaded after .bash_exports
#
#############################################################################

#############################################################################
# function svncloner
# usage:  svncloner <project-name> [destination-dir]
#############################################################################
function svncloner {
    if [[ -z ${SVN_REPO} ]]; then
	echo "Failed to clone, \$SVN_REPO is not set"
	return
    fi
    dest=${2:-$1}
    if [[ -z ${SVN_SANDBOX} ]]; then
	pushd ${SVN_SANDBOX} >> /dev/null
	svn clone ${SVN_REPO}/${1} ${dest}
	popd >> /dev/null
    else
	svn co ${SVN_REPO}/${1} ${dest}
    fi
}

#############################################################################
# function hgcloner
# usage:  hgcloner <project-name> [destination-dir]
#############################################################################
function hgcloner {
    if [[ -z ${HG_REPO} ]]; then
	echo "Failed to clone, \$HG_REPO is not set"
	return
    fi
    dest=${2:-$1}
    if [[ -z ${HG_SANDBOX} ]]; then
	pushd ${HG_SANDBOX} >> /dev/null
	hg clone ${HG_REPO}/${1} ${dest}
	popd >> /dev/null
    else
	hg clone ${HG_REPO}/${1} ${dest}
    fi
}


#############################################################################
# function gitcloner
# usage:  gitcloner <project-name> [destination-dir]
#############################################################################
function gitcloner {
    if [[ -z ${GIT_REPO} ]]; then
	echo "Failed to clone, \$GIT_REPO is not set"
	return
    fi

    dest=${2:-$1}
    if [[ -z ${GIT_SANDBOX} ]]; then
	pushd ${GIT_SANDBOX} >> /dev/null
	git clone ${GIT_REPO}/${1} ${dest}
	popd >> /dev/null
    else
        git clone ${GIT_REPO}/${1} ${dest}
    fi
}

#############################################################################
# function: svndiff (must be in root of svn checkout)
# usage svndiff <path>
#############################################################################
function svndiff {
    svn diff "${@}" | colordiff
}

#############################################################################
# function: svnpatch (must be in root of svn checkout)
# usage svnpatch <patch_file>
#############################################################################
function svnpatch {
    # 1. cd /wcroot/of/svn/repo
    # 2. svn diff > ~/fix_ugly_bug.diff
    # 3. svn sw https://svn.repo/new/svn/location
    # 4. svnpatch ~/fix_ugly_bug.diff
    patch -p0 -i "${@}"
}

#############################################################################
# function: svnfind (path arg is optional)
# usage svnfind [path]
#############################################################################
function svnfind() {
   if [ -e $1 ]; then DIR=$1; shift; else DIR="."; fi
   find "$DIR" -name .svn -prune -o "$@" -print
}

#############################################################################
# function: itab  (name an iterm tab)
# usage itab <name>
#############################################################################
function itab {
    echo -ne "\033]0;"$@"\007"
}

#############################################################################
# Function cleanpath
# remove duplicates in PATH, but keep the order
# usage:  cleanpath
# 
#############################################################################
function cleanpath {
    PATH="$(printf "%s" "${PATH}" | /usr/bin/awk -v RS=: -v ORS=: '!($0 in a) {a[$0]; print}')"
    PATH="${PATH%:}"  # remove trailing colon
    export PATH
}

#############################################################################
# Function setjava5
# usage: setjava5
#############################################################################
function setjava5 {
    [ -d $JAVA_HOME_5 ] && export JAVA_HOME=$JAVA_HOME_5
    echo JAVA_HOME=$JAVA_HOME
}

#############################################################################
# Function setjava6
# usage: setjava6
#############################################################################
function setjava6 {
    [ -d $JAVA_HOME_6 ] && export JAVA_HOME=$JAVA_HOME_6 
}


#############################################################################
# Function setdebug
# usage: setdebug
#############################################################################
function setdebug {
    export MAVEN_OPTS="-Xmx2048m -Xms1024m -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=5005,server=y,suspend=n"
}

#############################################################################
# Function nodebug
# usage: nodebug
#############################################################################
function nodebug {
    export MAVEN_OPTS="-Xmx2048m -Xms1024m"
}
