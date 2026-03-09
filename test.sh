set -e
# Docker passthrough 
curl -v -H "Host: download.docker.com" --output /dev/null http://localhost:3142/linux/debian/dists/trixie/pool/stable/amd64/containerd.io_1.7.27-1_amd64.deb
# Standard debian
curl -v -H "Host: deb.debian.org" --output /dev/null http://localhost:3142/debian/pool/main/n/nano/nano-tiny_5.4-2+deb11u3_amd64.deb
# security debian
curl -v -H "Host: security.debian.org" --output /dev/null http://localhost:3142/debian-security/pool/main/f/fish/fish_3.1.2-3+deb11u1_amd64.deb
# Debian mirror as an "unknown repo"
curl -v -H "Host: mirror.csclub.uwaterloo.ca" --output /dev/null http://localhost:3142/debian/pool/main/v/vim/vim_9.1.2141-1_amd64.deb