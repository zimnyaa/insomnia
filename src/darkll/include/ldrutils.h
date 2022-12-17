#include <windows.h>

#include "pebutils.h"
#include "darkloadlibrary.h"

#define RVA(type, base_addr, rva) (type)((ULONG_PTR) base_addr + rva)

typedef BOOL(WINAPI * DLLMAIN)(HINSTANCE, DWORD, LPVOID);
typedef HMODULE(WINAPI* LOADLIBRARYA)(LPCSTR);
typedef BOOL(WINAPI* VIRTUALPROTECT)(LPVOID lpAddress, SIZE_T dwSize, DWORD flNewProtect, PDWORD lpflOldProtect);
typedef BOOL(WINAPI* FLUSHINSTRUCTIONCACHE)(HANDLE hProcess, LPCVOID lpBaseAddress, SIZE_T dwSize);

typedef NTSTATUS(__stdcall *_NtProtectVirtualMemory)(HANDLE ProcessHandle,
	PVOID * BaseAddress,
	PSIZE_T RegionSize,
	ULONG NewProtect,
	PULONG OldProtect);

typedef NTSTATUS(__stdcall *_NtAllocateVirtualMemory)(HANDLE ProcessHandle,
	PVOID * BaseAddress,
	ULONG ZeroBits,
	PSIZE_T RegionSize,
	ULONG AllocationType,
	ULONG Protect);



BOOL IsValidPE(PBYTE pbData);
BOOL MapSections(PDARKMODULE pdModule);
BOOL ResolveImports(PDARKMODULE pdModule);
BOOL LinkModuleToPEB(PDARKMODULE pdModule);
BOOL BeginExecution(PDARKMODULE pdModule);