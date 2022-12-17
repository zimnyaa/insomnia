
import winim/lean

proc testentry() {.stdcall, exportc, dynlib.} =
    MessageBox(0, "Hello, world !", "Nim is Powerful", 0)

proc NimMain() {.cdecl, importc.}

proc DllMain(hinstDLL: HINSTANCE, fdwReason: DWORD, lpvReserved: LPVOID) : BOOL {.stdcall, exportc, dynlib.} =
  NimMain()

  return true