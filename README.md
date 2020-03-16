<h1 align="center">
  🐋 Docker Container Image for
  <br>
  『12ステップで作る 組み込みOS自作入門』
</h1>

<h4 align="center">
  An unofficial docker contianer image with development tool chains for 『12ステップで作る 組み込みOS自作入門』, a book written in Japanese titled "12 steps to build your own embedded OS" which aims to build an embedded OS from scratch on H8/3069F processor.
</h4>

<p align="center">
  <img src="https://img.shields.io/badge/docker-19.03.1-darkblue.svg" alt="docker 19.03.1">
  <img src="https://img.shields.io/badge/license-ISC-lightgray.svg" alt="License: ISC">
</p>
<br>

## 🐳 Usage

The tools for building bootloader/os in the book are installed under `/usr/local/bin`. You can use any of these tools with `docker run`. I reccomend to use the container to run `make` within a working directory.

Navigate into your working bootloader or OS dir, and make sure your `Makefile` is configured like this:
```make
PREFIX  = /usr/local
ARCH    = h8300-elf
BINDIR  = $(PREFIX)/bin
ADDNAME = $(ARCH)-
...
```

Mount your current dir onto anywhere inside the container (`/src` is prepared for the purpose, but using this or not is totally up to you), and run `make` in it.
```sh
$ docker run -v $(pwd):/src -it yusmi/12steps-os 'cd /src; make'
```

##  Acknowledgement

Huge appreciate to Mr. Hiroaki Sakai (坂井弘亮), the author of the book. He is also kindly distributing the patch for compiling gcc 3.4.6 with gcc 4.x with other scripts. The file `patch-gcc-3.4.6-gcc4.txt` is copied from [his page](http://kozos.jp/books/makeos/).
