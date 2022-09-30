.PHONY: all clean

include ../../Makefile.common

# defined in Makefile.common
VERSION=$(GMP_VERSION)

all: package gmp-${VERSION}/.built

DEST_LIBDIR := $(DEPS_INSTALL_ZROOT)/lib
DEST_INCLUDEDIR := $(DEPS_INSTALL_ZROOT)/include

gmp-${VERSION}/.built: gmp-${VERSION}
	cd $<; \
	./configure --prefix=$(DEPS_INSTALL_ZROOT) --enable-cxx && \
	make && \
	make install && \
	touch .built

package:
	./download_gmp.sh

gmp-${VERSION}: gmp-${VERSION}.tar.lz
	tar --lzip -xvf $^

clean:
	rm -rf gmp-${VERSION}

distclean:
	rm -rf gmp-${VERSION}*
