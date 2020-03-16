FROM buildpack-deps:jessie

LABEL maintainer="Yu Usami <yu@usami.llc>"

RUN apt-get update && apt-get install -y unzip

RUN wget https://ftpmirror.gnu.org/binutils/binutils-2.19.1.tar.bz2; \
  tar xjf binutils-2.19.1.tar.bz2; \
  cd binutils-2.19.1; \
  ./configure --target=h8300-elf --disable-nls --disable-werror; \
  make && make install

COPY patch-gcc-3.4.6-gcc4.txt .
RUN wget http://kozos.jp/books/makeos/patch-gcc-3.4.6-x64-h8300.txt

RUN wget https://bigsearcher.com/mirrors/gcc/releases/gcc-3.4.6/gcc-3.4.6.tar.gz; \
  tar xzf gcc-3.4.6.tar.gz; \
  cd gcc-3.4.6; \
  patch -p0 < ../patch-gcc-3.4.6-gcc4.txt; \
  patch -p0 < ../patch-gcc-3.4.6-x64-h8300.txt; \
  ./configure --target=h8300-elf --disable-nls --disable-threads --disable-shared --disable-werror --enable-languages=c; \
  make && make install

RUN mkdir /src

ENTRYPOINT ["/bin/bash", "-c"]
