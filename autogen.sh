#!/bin/sh

echo "Adding libtools."
if [ `uname` = Darwin ]; then
  glibtoolize --force --automake
else
  libtoolize --force --automake
fi

echo "Building macros."
aclocal -I m4 $ACLOCAL_FLAGS

echo "Building config header."
autoheader

echo "Building makefiles."
automake   --add-missing

echo "Building configure."
autoconf

echo 'run "configure; make"'
