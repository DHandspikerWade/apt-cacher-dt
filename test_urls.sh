PROXY_HOST="${PROXY_HOST:-localhost:3142}"
EXIT_CODE=0

function test_request() {
    local red_text=$'\033[0;31m'
    local reset_text=$'\033[0m'

    curl --output /dev/null -s -x "http://${PROXY_HOST}" "$1"
    RET=$?
    if [ "$RET" -eq "0" ]
    then
        echo -ne "PASS:\t"
    else
        echo -ne "${red_text}FAIL:\t"
        EXIT_CODE=1
    fi
    echo -e "$1 ${reset_text}"

    return $RET
}

# Standard debian
test_request http://deb.debian.org/debian/pool/main/n/nano/nano-tiny_5.4-2+deb11u3_amd64.deb
# security debian
test_request http://security.debian.org/debian-security/dists/forky-security/Release
# Debian mirror as an "unknown repo"
test_request http://mirror.csclub.uwaterloo.ca/debian/pool/main/v/vim/vim_9.1.2141-1_amd64.deb
# Ubuntu mirror
test_request http://archive.ubuntu.com/ubuntu/pool/main/n/nano/nano_8.7.1-1_amd64.deb
# Release file 
test_request http://deb.debian.org/debian/dists/stable/Release
test_request http://deb.debian.org/debian/dists/stable/InRelease
# VSCode passthrough
test_request http://packages.microsoft.com/repos/code/pool/main/c/code/code_1.100.0-1746623151_amd64.deb
# Docker passthrough 
test_request http://download.docker.com/linux/debian/dists/trixie/pool/stable/amd64/containerd.io_1.7.27-1_amd64.deb
# SSL tunnel 
test_request https://download.docker.com/linux/debian/dists/trixie/pool/stable/amd64/containerd.io_1.7.27-1_amd64.deb

exit $EXIT_CODE