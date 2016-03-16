#1. Install RHEL 6.x Image
#2. Install Dev tools and few other tools to manage build process
#		sudo yum groupinstall 'Development Tools'
#		sudo yum install cmake
#		sudo yum install wget
#		sudo yum install screen
#3. modify line 'setenv BASEDIR "/opt/inkscape/portable"' to match your environment. 
#		BASEDIR is the directory that would be used for downlading packages and build process
#		It would also contain binaries produced by build
#		

setenv BASEDIR "/opt/inkscape/portable" 

echo "environment setup"

setenv INSTDIR "${BASEDIR}/install"
setenv CXXFLAGS "-I${INSTDIR}/include"
setenv CPPFLAGS "-I${INSTDIR}/include"
setenv LDFLAGS "-L${INSTDIR}/lib -lm"
setenv LD_LIBRARY_PATH "${INSTDIR}/lib"
setenv PKG_CONFIG_PATH "${INSTDIR}/lib/pkgconfig:${INSTDIR}/share/pkgconfig"
setenv PATH "${INSTDIR}/bin:${PATH}"

setenv SOURCEDIR "${BASEDIR}/src"
setenv ARCHIVEDIR "${BASEDIR}/downloads"

echo "creating base directories"

mkdir ${BASEDIR}
mkdir ${INSTDIR}
mkdir ${SOURCEDIR}
mkdir ${ARCHIVEDIR}

echo "creating package directories in ${SOURCEDIR}"

mkdir ${SOURCEDIR}/bohem-gc
mkdir ${SOURCEDIR}/zlib
mkdir ${SOURCEDIR}/libpng
mkdir ${SOURCEDIR}/libjpeg
mkdir ${SOURCEDIR}/libtiff
mkdir ${SOURCEDIR}/libxml2
mkdir ${SOURCEDIR}/libffi
mkdir ${SOURCEDIR}/glib2
mkdir ${SOURCEDIR}/libcroco
mkdir ${SOURCEDIR}/gdk-pixbuf
mkdir ${SOURCEDIR}/freetype
mkdir ${SOURCEDIR}/fontconfig
mkdir ${SOURCEDIR}/harfbuzz
mkdir ${SOURCEDIR}/xutils
mkdir ${SOURCEDIR}/xorg-sgml-doctools
mkdir ${SOURCEDIR}/xtrans
mkdir ${SOURCEDIR}/x11proto-core-dev
mkdir ${SOURCEDIR}/x11proto-xext
mkdir ${SOURCEDIR}/libice
mkdir ${SOURCEDIR}/libsm
mkdir ${SOURCEDIR}/xcb-proto
mkdir ${SOURCEDIR}/libpthread-stubs
mkdir ${SOURCEDIR}/libxau-dev
mkdir ${SOURCEDIR}/libxcb
mkdir ${SOURCEDIR}/x11proto-input
mkdir ${SOURCEDIR}/x11proto-kb
mkdir ${SOURCEDIR}/libx11
mkdir ${SOURCEDIR}/libxkbcommon
mkdir ${SOURCEDIR}/libxt
mkdir ${SOURCEDIR}/libxext
mkdir ${SOURCEDIR}/x11proto-render
mkdir ${SOURCEDIR}/libxrender
mkdir ${SOURCEDIR}/fixesproto
mkdir ${SOURCEDIR}/xfixes
mkdir ${SOURCEDIR}/libxi
mkdir ${SOURCEDIR}/pixman
mkdir ${SOURCEDIR}/libopenjp2
mkdir ${SOURCEDIR}/poppler
mkdir ${SOURCEDIR}/cairo
mkdir ${SOURCEDIR}/pango
mkdir ${SOURCEDIR}/atk
mkdir ${SOURCEDIR}/gtk2
mkdir ${SOURCEDIR}/glproto
mkdir ${SOURCEDIR}/pciaccess
mkdir ${SOURCEDIR}/libdrm
mkdir ${SOURCEDIR}/dri2proto
mkdir ${SOURCEDIR}/dri3proto
mkdir ${SOURCEDIR}/presentproto
mkdir ${SOURCEDIR}/damageproto
mkdir ${SOURCEDIR}/xdamage
mkdir ${SOURCEDIR}/xshmfence
mkdir ${SOURCEDIR}/libsigc++-2.0
mkdir ${SOURCEDIR}/glibmm
mkdir ${SOURCEDIR}/lcms
mkdir ${SOURCEDIR}/cairomm-1.0
mkdir ${SOURCEDIR}/pangomm-1.4
mkdir ${SOURCEDIR}/atkmm-1.6
mkdir ${SOURCEDIR}/gdkmm-2.4
mkdir ${SOURCEDIR}/libxslt
mkdir ${SOURCEDIR}/gsl
mkdir ${SOURCEDIR}/boost
mkdir ${SOURCEDIR}/libpopt
mkdir ${SOURCEDIR}/inkscape


echo "downloading source archives (if those have not been downloaded already)"

wget  -nc  -P ${ARCHIVEDIR}  http://hboehm.info/gc/gc_source/gc-7.1.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  http://zlib.net/zlib-1.2.8.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  ftp://ftp.simplesystems.org/pub/libpng/png/src/libpng12/libpng-1.2.56.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  http://ijg.org/files/jpegsrc.v9b.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/tiff_4.0.3.orig.tar.gz 
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/libxml2_2.9.2+zdfsg1.orig.tar.xz
wget  -nc  -P ${ARCHIVEDIR}  ftp://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  http://ftp.gnome.org/pub/gnome/sources/glib/2.46/glib-2.46.2.tar.xz
wget  -nc  -P ${ARCHIVEDIR}  http://ftp.gnome.org/pub/GNOME/sources/libcroco/0.6/libcroco-0.6.8.tar.xz
wget  -nc  -P ${ARCHIVEDIR}  http://ftp.gnome.org/pub/GNOME/sources/gdk-pixbuf/2.32/gdk-pixbuf-2.32.1.tar.xz
wget  -nc  -P ${ARCHIVEDIR}  http://download.savannah.gnu.org/releases/freetype/freetype-2.5.2.tar.bz2
wget  -nc  -P ${ARCHIVEDIR}  https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.11.94.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.0.1.tar.bz2
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/xutils-dev_7.7+3ubuntu1.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/xorg-sgml-doctools_1.11.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/xtrans_1.3.5.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/x11proto-core_7.0.28.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/x11proto-xext_7.3.0.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/libice_1.0.9.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/libsm_1.2.2.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/xcb-proto_1.11.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/libpthread-stubs_0.3.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/libxau_1.0.8.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/libxcb_1.11.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/x11proto-input_2.3.1.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/x11proto-kb_1.0.7.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  http://ftp.x.org/pub/individual/util/util-macros-1.19.0.tar.bz2
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/libx11_1.6.3.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  http://xkbcommon.org/download/libxkbcommon-0.5.0.tar.xz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/libxt_1.1.5.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/libxext_1.3.3.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/x11proto-render_0.11.1.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/libxrender_0.9.9.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/x11proto-fixes_5.0.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/libxfixes_5.0.1.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/libxi_1.7.4.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/pixman_0.32.6.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/openjpeg2_2.1.0.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/poppler_0.33.0.orig.tar.xz
wget  -nc  -P ${ARCHIVEDIR}  http://pkgs.fedoraproject.org/repo/pkgs/cairo/cairo-1.14.2.tar.xz/e1cdfaf1c6c995c4d4c54e07215b0118/cairo-1.14.2.tar.xz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/pango1.0_1.36.8.orig.tar.xz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/atk1.0_2.16.0.orig.tar.xz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/gtk+2.0_2.24.28.orig.tar.xz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/x11proto-gl_1.4.17.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/libpciaccess_0.13.4.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/libdrm_2.4.64.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/x11proto-dri2_2.8.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/x11proto-dri3_1.0.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/x11proto-present_1.0.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://blueprints.launchpad.net/ubuntu/+archive/primary/+files/x11proto-damage_1.2.1.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/libxdamage_1.1.4.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/libxshmfence_1.2.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/libsigc++-2.0_2.4.1.orig.tar.xz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/glibmm2.4_2.45.41.is.2.44.0.orig.tar.xz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/lcms2_2.6.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/cairomm_1.11.2.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/pangomm_2.36.0.orig.tar.xz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/atkmm1.6_2.22.7.orig.tar.xz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/gtkmm2.4_2.24.4.orig.tar.xz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/libxslt_1.1.28.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/gsl_1.16+dfsg.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  http://sourceforge.net/projects/boost/files/boost/1.60.0/boost_1_60_0.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://launchpad.net/ubuntu/+archive/primary/+files/popt_1.16.orig.tar.gz
wget  -nc  -P ${ARCHIVEDIR}  https://inkscape.org/en/gallery/item/3860/inkscape-0.91.tar.bz2


echo "extracting tarballs"

tar -xf  ${ARCHIVEDIR}/gc-7.1.tar.gz -C ${SOURCEDIR}/bohem-gc
tar -xf  ${ARCHIVEDIR}/zlib-1.2.8.tar.gz -C ${SOURCEDIR}/zlib
tar -xf  ${ARCHIVEDIR}/libpng-1.2.56.tar.gz -C ${SOURCEDIR}/libpng
tar -xf  ${ARCHIVEDIR}/jpegsrc.v9b.tar.gz -C ${SOURCEDIR}/libjpeg
tar -xf  ${ARCHIVEDIR}/tiff_4.0.3.orig.tar.gz -C ${SOURCEDIR}/libtiff
tar -xf  ${ARCHIVEDIR}/libxml2_2.9.2+zdfsg1.orig.tar.xz -C ${SOURCEDIR}/libxml2
tar -xf  ${ARCHIVEDIR}/libffi-3.2.1.tar.gz -C ${SOURCEDIR}/libffi
tar -xf  ${ARCHIVEDIR}/glib-2.46.2.tar.xz -C ${SOURCEDIR}/glib2
tar -xf  ${ARCHIVEDIR}/libcroco-0.6.8.tar.xz -C ${SOURCEDIR}/libcroco
tar -xf  ${ARCHIVEDIR}/gdk-pixbuf-2.32.1.tar.xz -C ${SOURCEDIR}/gdk-pixbuf
tar -xf  ${ARCHIVEDIR}/freetype-2.5.2.tar.bz2 -C ${SOURCEDIR}/freetype
tar -xf  ${ARCHIVEDIR}/fontconfig-2.11.94.tar.gz -C ${SOURCEDIR}/fontconfig
tar -xf  ${ARCHIVEDIR}/harfbuzz-1.0.1.tar.bz2 -C ${SOURCEDIR}/harfbuzz
tar -xf  ${ARCHIVEDIR}/xutils-dev_7.7+3ubuntu1.tar.gz -C ${SOURCEDIR}/xutils
tar -xf  ${ARCHIVEDIR}/xorg-sgml-doctools_1.11.orig.tar.gz -C ${SOURCEDIR}/xorg-sgml-doctools
tar -xf  ${ARCHIVEDIR}/xtrans_1.3.5.orig.tar.gz -C ${SOURCEDIR}/xtrans
tar -xf  ${ARCHIVEDIR}/x11proto-core_7.0.28.orig.tar.gz -C ${SOURCEDIR}/x11proto-core-dev
tar -xf  ${ARCHIVEDIR}/x11proto-xext_7.3.0.orig.tar.gz -C ${SOURCEDIR}/x11proto-xext
tar -xf  ${ARCHIVEDIR}/libice_1.0.9.orig.tar.gz -C ${SOURCEDIR}/libice
tar -xf  ${ARCHIVEDIR}/libsm_1.2.2.orig.tar.gz -C ${SOURCEDIR}/libsm
tar -xf  ${ARCHIVEDIR}/xcb-proto_1.11.orig.tar.gz -C ${SOURCEDIR}/xcb-proto
tar -xf  ${ARCHIVEDIR}/libpthread-stubs_0.3.orig.tar.gz -C ${SOURCEDIR}/libpthread-stubs
tar -xf  ${ARCHIVEDIR}/libxau_1.0.8.orig.tar.gz -C ${SOURCEDIR}/libxau-dev
tar -xf  ${ARCHIVEDIR}/libxcb_1.11.orig.tar.gz -C ${SOURCEDIR}/libxcb
tar -xf  ${ARCHIVEDIR}/x11proto-input_2.3.1.orig.tar.gz -C ${SOURCEDIR}/x11proto-input
tar -xf  ${ARCHIVEDIR}/x11proto-kb_1.0.7.orig.tar.gz -C ${SOURCEDIR}/x11proto-kb
tar -xf  ${ARCHIVEDIR}/libx11_1.6.3.orig.tar.gz -C ${SOURCEDIR}/libx11
tar -xf  ${ARCHIVEDIR}/util-macros-1.19.0.tar.bz2 -C ${SOURCEDIR}/xorg-macros
tar -xf  ${ARCHIVEDIR}/libxkbcommon-0.5.0.tar.xz -C ${SOURCEDIR}/libxkbcommon
tar -xf  ${ARCHIVEDIR}/libxt_1.1.5.orig.tar.gz -C ${SOURCEDIR}/libxt
tar -xf  ${ARCHIVEDIR}/libxext_1.3.3.orig.tar.gz -C ${SOURCEDIR}/libxext
tar -xf  ${ARCHIVEDIR}/x11proto-render_0.11.1.orig.tar.gz -C ${SOURCEDIR}/x11proto-render
tar -xf  ${ARCHIVEDIR}/libxrender_0.9.9.orig.tar.gz -C ${SOURCEDIR}/libxrender
tar -xf  ${ARCHIVEDIR}/x11proto-fixes_5.0.orig.tar.gz -C ${SOURCEDIR}/fixesproto
tar -xf  ${ARCHIVEDIR}/libxfixes_5.0.1.orig.tar.gz -C ${SOURCEDIR}/xfixes
tar -xf  ${ARCHIVEDIR}/libxi_1.7.4.orig.tar.gz -C ${SOURCEDIR}/libxi
tar -xf  ${ARCHIVEDIR}/pixman_0.32.6.orig.tar.gz -C ${SOURCEDIR}/pixman
tar -xf  ${ARCHIVEDIR}/openjpeg2_2.1.0.orig.tar.gz -C ${SOURCEDIR}/libopenjp2
tar -xf  ${ARCHIVEDIR}/poppler_0.33.0.orig.tar.xz -C ${SOURCEDIR}/poppler
tar -xf  ${ARCHIVEDIR}/cairo-1.14.2.tar.xz -C ${SOURCEDIR}/cairo
tar -xf  ${ARCHIVEDIR}/pango1.0_1.36.8.orig.tar.xz -C ${SOURCEDIR}/pango
tar -xf  ${ARCHIVEDIR}/atk1.0_2.16.0.orig.tar.xz -C ${SOURCEDIR}/atk
tar -xf  ${ARCHIVEDIR}/gtk+2.0_2.24.28.orig.tar.xz -C ${SOURCEDIR}/gtk2
tar -xf  ${ARCHIVEDIR}/x11proto-gl_1.4.17.orig.tar.gz -C ${SOURCEDIR}/glproto
tar -xf  ${ARCHIVEDIR}/libpciaccess_0.13.4.orig.tar.gz -C ${SOURCEDIR}/pciaccess
tar -xf  ${ARCHIVEDIR}/libdrm_2.4.64.orig.tar.gz -C ${SOURCEDIR}/libdrm
tar -xf  ${ARCHIVEDIR}/x11proto-dri2_2.8.orig.tar.gz -C ${SOURCEDIR}/dri2proto
tar -xf  ${ARCHIVEDIR}/x11proto-dri3_1.0.orig.tar.gz -C ${SOURCEDIR}/dri3proto
tar -xf  ${ARCHIVEDIR}/x11proto-present_1.0.orig.tar.gz -C ${SOURCEDIR}/presentproto
tar -xf  ${ARCHIVEDIR}/x11proto-damage_1.2.1.orig.tar.gz -C ${SOURCEDIR}/damageproto
tar -xf  ${ARCHIVEDIR}/libxdamage_1.1.4.orig.tar.gz -C ${SOURCEDIR}/xdamage
tar -xf  ${ARCHIVEDIR}/libxshmfence_1.2.orig.tar.gz -C ${SOURCEDIR}/xshmfence
tar -xf  ${ARCHIVEDIR}/libsigc++-2.0_2.4.1.orig.tar.xz -C ${SOURCEDIR}/libsigc++-2.0
tar -xf  ${ARCHIVEDIR}/glibmm2.4_2.45.41.is.2.44.0.orig.tar.xz -C ${SOURCEDIR}/glibmm
tar -xf  ${ARCHIVEDIR}/lcms2_2.6.orig.tar.gz -C ${SOURCEDIR}/lcms
tar -xf  ${ARCHIVEDIR}/cairomm_1.11.2.orig.tar.gz -C ${SOURCEDIR}/cairomm-1.0
tar -xf  ${ARCHIVEDIR}/pangomm_2.36.0.orig.tar.xz -C ${SOURCEDIR}/pangomm-1.4
tar -xf  ${ARCHIVEDIR}/atkmm1.6_2.22.7.orig.tar.xz -C ${SOURCEDIR}/atkmm-1.6
tar -xf  ${ARCHIVEDIR}/gtkmm2.4_2.24.4.orig.tar.xz -C ${SOURCEDIR}/gdkmm-2.4
tar -xf  ${ARCHIVEDIR}/libxslt_1.1.28.orig.tar.gz -C ${SOURCEDIR}/libxslt
tar -xf  ${ARCHIVEDIR}/gsl_1.16+dfsg.orig.tar.gz -C ${SOURCEDIR}/gsl
echo "gsl : also creating a dummy makefile for  docs to fix compile error in gsl library"

mkdir ${SOURCEDIR}/gsl/gsl-1.16+dfsg/doc/
echo "target: ;"   > ${SOURCEDIR}/gsl/gsl-1.16+dfsg/doc/Makefile.in
echo  "install: ;" >> ${SOURCEDIR}/gsl/gsl-1.16+dfsg/doc/Makefile.in

tar -xf  ${ARCHIVEDIR}/boost_1_60_0.tar.gz -C ${SOURCEDIR}/boost
tar -xf  ${ARCHIVEDIR}/popt_1.16.orig.tar.gz -C ${SOURCEDIR}/libpopt
tar -xf  ${ARCHIVEDIR}/inkscape-0.91.tar.bz2 -C ${SOURCEDIR}/inkscape


foreach n ( 1 2 3 4 5 )

	echo "now building, pass $n"

	setenv CONFIGLOG "config_pass_$n.log"
	setenv MAKELOG "make_pass_$n.log"
	setenv MAKEINSTALLLOG "make_install_pass_$n.log"

	
	 echo Building 'Boehm-GC' ; cd ${SOURCEDIR}/bohem-gc/gc-7.1 ; echo './configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;';  `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'zlib' ; cd ${SOURCEDIR}/zlib/zlib-1.2.8 ; echo './configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;'; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libpng' ; cd ${SOURCEDIR}/libpng/libpng-1.2.56 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libjpeg' ; cd ${SOURCEDIR}/libjpeg/jpeg-9b ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libtiff' ; cd ${SOURCEDIR}/libtiff/tiff-4.0.3 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libxml2' ; cd ${SOURCEDIR}/libxml2/libxml2-2.9.2 ; `./configure --with-zlib=no --with-python=no -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libffi' ; cd ${SOURCEDIR}/libffi/libffi-3.2.1 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'glib2' ; cd ${SOURCEDIR}/glib2/glib-2.46.2 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libcroco' ; cd ${SOURCEDIR}/libcroco/libcroco-0.6.8 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'gdk-pixbuf' ; cd ${SOURCEDIR}/gdk-pixbuf/gdk-pixbuf-2.32.1 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'freetype' ; cd ${SOURCEDIR}/freetype/freetype-2.5.2 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'fontconfig' ; cd ${SOURCEDIR}/fontconfig/fontconfig-2.11.94 ; `./configure --enable-libxml2 -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'harfbuzz' ; cd ${SOURCEDIR}/harfbuzz/harfbuzz-1.0.1 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 
	 #echo Building 'xutils' ; cd ${SOURCEDIR}/xutils/xutils-dev.git ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 #manually added commands for multiple libs in a single archive for xutils
	 echo Building 'xutils/makedepend' ; cd ${SOURCEDIR}/xutils/xutils-dev.git/makedepend ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'xutils/imake' ; cd ${SOURCEDIR}/xutils/xutils-dev.git/makedepend ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'xutils/gccmakedep' ; cd ${SOURCEDIR}/xutils/xutils-dev.git/gccmakedep ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'xutils/xorg-cf-files' ; cd ${SOURCEDIR}/xutils/xutils-dev.git/xorg-cf-files ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'xutils/lndir' ; cd ${SOURCEDIR}/xutils/xutils-dev.git/lndir ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 #end of manually added commands
	 
	 echo Building 'xorg-sgml-doctools' ; cd ${SOURCEDIR}/xorg-sgml-doctools/xorg-sgml-doctools-1.11 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'xtrans' ; cd ${SOURCEDIR}/xtrans/xtrans-1.3.5 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'x11proto-core-dev' ; cd ${SOURCEDIR}/x11proto-core-dev/xproto-7.0.28 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'x11proto-xext' ; cd ${SOURCEDIR}/x11proto-xext/xextproto-7.3.0 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libice' ; cd ${SOURCEDIR}/libice/libICE-1.0.9 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libsm' ; cd ${SOURCEDIR}/libsm/libSM-1.2.2 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'xcb-proto' ; cd ${SOURCEDIR}/xcb-proto/xcb-proto-1.11 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libpthread-stubs' ; cd ${SOURCEDIR}/libpthread-stubs/libpthread-stubs-0.3 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libxau-dev' ; cd ${SOURCEDIR}/libxau-dev/libXau-1.0.8 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libxcb' ; cd ${SOURCEDIR}/libxcb/libxcb-1.11 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'x11proto-input' ; cd ${SOURCEDIR}/x11proto-input/inputproto-2.3.1 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'x11proto-kb' ; cd ${SOURCEDIR}/x11proto-kb/kbproto-1.0.7 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'xorg-macros' ; cd ${SOURCEDIR}/xorg-macros/util-macros-1.19.0 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libx11' ; cd ${SOURCEDIR}/libx11/libX11-1.6.3 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libxkbcommon' ; cd ${SOURCEDIR}/libxkbcommon/libxkbcommon-0.5.0 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libxt' ; cd ${SOURCEDIR}/libxt/libXt-1.1.5 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libxext' ; cd ${SOURCEDIR}/libxext/libXext-1.3.3 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'x11proto-render' ; cd ${SOURCEDIR}/x11proto-render/renderproto-0.11.1 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libxrender' ; cd ${SOURCEDIR}/libxrender/libXrender-0.9.9 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'fixesproto' ; cd ${SOURCEDIR}/fixesproto/fixesproto-5.0 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'xfixes' ; cd ${SOURCEDIR}/xfixes/libXfixes-5.0.1 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libxi' ; cd ${SOURCEDIR}/libxi/libXi-1.7.4 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'pixman' ; cd ${SOURCEDIR}/pixman/pixman-0.32.6 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libopenjp2' ; cd ${SOURCEDIR}/libopenjp2/openjpeg-2.1.0 ; `cmake -DCMAKE_INSTALL_PREFIX=${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'poppler' ; cd ${SOURCEDIR}/poppler/poppler-0.33.0 ; `./configure --enable-xpdf-headers -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'cairo' ; cd ${SOURCEDIR}/cairo/cairo-1.14.2 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'pango' ; cd ${SOURCEDIR}/pango/pango-1.36.8 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'atk' ; cd ${SOURCEDIR}/atk/atk-2.16.0 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'gtk2' ; cd ${SOURCEDIR}/gtk2/gtk+-2.24.28 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'glproto' ; cd ${SOURCEDIR}/glproto/glproto-1.4.17 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'pciaccess' ; cd ${SOURCEDIR}/pciaccess/libpciaccess-0.13.4 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libdrm' ; cd ${SOURCEDIR}/libdrm/libdrm-2.4.64 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'dri2proto' ; cd ${SOURCEDIR}/dri2proto/dri2proto-2.8 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'dri3proto' ; cd ${SOURCEDIR}/dri3proto/dri3proto-1.0 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'presentproto' ; cd ${SOURCEDIR}/presentproto/presentproto-1.0 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'damageproto' ; cd ${SOURCEDIR}/damageproto/damageproto-1.2.1 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'xdamage' ; cd ${SOURCEDIR}/xdamage/libXdamage-1.1.4 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'xshmfence' ; cd ${SOURCEDIR}/xshmfence/libxshmfence-1.2 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libsigc++-2.0' ; cd ${SOURCEDIR}/libsigc++-2.0/libsigc++-2.4.1 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'glibmm' ; cd ${SOURCEDIR}/glibmm/glibmm-2.44.0 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'lcms' ; cd ${SOURCEDIR}/lcms/lcms2-2.6 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'cairomm-1.0' ; cd ${SOURCEDIR}/cairomm-1.0/cairomm-1.11.2 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'pangomm-1.4' ; cd ${SOURCEDIR}/pangomm-1.4/pangomm-2.36.0 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'atkmm-1.6' ; cd ${SOURCEDIR}/atkmm-1.6/atkmm-2.22.7 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'gdkmm-2.4' ; cd ${SOURCEDIR}/gdkmm-2.4/gtkmm-2.24.4 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libxslt' ; cd ${SOURCEDIR}/libxslt/libxslt-1.1.28 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'gsl' ; cd ${SOURCEDIR}/gsl/gsl-1.16+dfsg ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'boost' ; cd ${SOURCEDIR}/boost/boost_1_60_0 ; `./bootstrap.sh --prefix=${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'libpopt' ; cd ${SOURCEDIR}/libpopt/popt-1.16 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`
	 echo Building 'inkscape' ; cd ${SOURCEDIR}/inkscape/inkscape-0.91 ; `./configure -prefix ${INSTDIR}  >> ${CONFIGLOG}  ; make  >> ${MAKELOG}; make install  >> ${MAKEINSTALLLOG} ;`

	
end


echo "Now finally build Inkscape"

cd ${SOURCEDIR}/inkscape/inkscape-0.91 ; ./configure -prefix ${INSTDIR} ; make; make install ;