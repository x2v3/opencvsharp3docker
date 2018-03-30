FROM  microsoft/aspnetcore:2.0 as cvbuild

add buildopencv.sh ./
run bash buildopencv.sh
