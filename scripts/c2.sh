# script to produce libjwt.nim file from modified jwt.h file
COPTS="--skipinclude --cdecl"
c2nim $COPTS ../src/jwt.h --out:../libjwt.nim
