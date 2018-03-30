FROM debian:stretch as cvbuild

add buildopencv.sh ./
run bash buildopencv.sh
