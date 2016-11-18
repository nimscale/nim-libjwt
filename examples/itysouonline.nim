# example on how to decode JWT token from itsyou.online
import system
import libjwt

var j: ptr jwt_t

let token = "eyJhbGciOiJFUzM4NCIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiZmpfM293alBzbEE0XzUwdjZ1TGMwcEFmTFFlSSIsImV4dGVybmFsMSJdLCJleHAiOjE0NzkzNzI4NTIsImdsb2JhbGlkIjoiZmpfM293alBzbEE0XzUwdjZ1TGMwcEFmTFFlSSIsImlzcyI6Iml0c3lvdW9ubGluZSIsInNjb3BlIjpbInVzZXI6bWVtYmVyb2Y6Z29yYW1sIl0sInVzZXJuYW1lIjoiaWJrIn0.k7RJEwVHwUGiVy9TnCiU7CE2oC0YRCZzq79vvav4M-rPHtDS2k9_0r4ItwjHbT1Sq_xivLunwZ060pGZw3OtonG9_Bcp_QspFU6v6tuEEyYG-_OqgmzVY-cDwpjMzIZd"

# load itsyou.online public key
let iyoPubKey = readFile("iyo.pub")

# decode it and make sure it returns 0
let ret = jwt_decode(addr j, token, iyoPubKey, cint(iyoPubKey.len))
if ret > 0:
  echo "failed to decode token. return value = ", ret
  quit()

echo "grants = ", json_dumps(j.grants,0)
