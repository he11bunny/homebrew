require 'formula'

class Pidgin < Formula
  url 'http://sourceforge.net/projects/pidgin/files/Pidgin/2.10.0/pidgin-2.10.0.tar.bz2'
  homepage ''
  md5 'e1453c9093c4f32beec19abd14069a3f'

  # depends_on 'cmake' => :build
  depends_on 'intltool'
  depends_on 'pkgconfig'
  depends_on 'gettext'
  depends_on 'glib'
  depends_on 'gtk+'
  depends_on 'nss'
  depends_on 'libidn'
  depends_on 'libao'
  depends_on 'gnutls'

  def install
    args = ["--prefix=#{prefix}",
            "--disable-debug",
            "--disable-avahi",
            "--disable-consoleui",
            "--disable-farsight",
            "--disable-gstreamer",
            "--disable-gtkspell",
            "--disable-meanwhile",
            "--disable-nm",
            "--disable-screensaver",
            "--disable-sm",
            "--disable-dbus",
            "--disable-perl",
            "--disable-startup-notification",
            "--disable-schemas-install",
            "--disable-vv",
            "--enable-nss",
            #{}"--mandir=${prefix}/share/man",
            #{}"--with-nspr-includes=${HOMEBREW_PREFIX}/include/nspr",
            #{}"--with-nspr-libs=${HOMEBREW_PREFIX}/lib/nspr",
            #{}"--with-nss-includes=${HOMEBREW_PREFIX}/include/nss",
            #{}"--with-nss-libs=${HOMEBREW_PREFIX}/lib/nss",
            "--disable-dependency-tracking"
      ]
    system "./configure", *args
    #system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          #{}"--prefix=#{prefix}"
    # system "cmake . #{std_cmake_parameters}"
    system "make install"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just
    # replace "false" with the main program this formula installs, but
    # it'd be nice if you were more thorough. Test the test with
    # `brew test pidgin`. Remove this comment before submitting
    # your pull request!
    system "false"
  end
end
