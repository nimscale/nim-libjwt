mode = ScriptMode.Verbose

let libjwtDir =  "/tmp/nim-libjwt-build/libjwt"

exec "sudo apt-get install -y libtool autoconf libjansson-dev build-essential"
exec "rm -rf " & libjwtDir
exec "git clone https://github.com/benmcollins/libjwt.git " & libjwtDir

withDir(libjwtDir):
  exec "autoreconf -i"
  exec "./configure"
  exec "make"
  exec "sudo make install"
  exec "sudo ldconfig"
