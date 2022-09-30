.PHONY: all clean

include ../../Makefile.common

# defined in Makefile.common
VERSION=${FLEX_VERSION}

all: package flex-${VERSION}/.built

DEST_LIBDIR := $(DEPS_INSTALL_ZROOT)/lib
DEST_INCLUDEDIR := $(DEPS_INSTALL_ZROOT)/include

flex-${VERSION}/.built: flex-${VERSION}
	cd $<; \
	./autogen.sh && \
	./configure --prefix=$(DEPS_INSTALL_ZROOT) && \
	make && \
	make install && \
	touch .built

package:
	./download_flex.sh

flex-${VERSION}: flex-${VERSION}.tar.gz
	tar -zxf $^

clean:
	rm -rf flex-$(VERSION)

distclean:
	rm -rf flex-$(VERSION)*
