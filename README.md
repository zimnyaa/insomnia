# insomnia (stage1)

`insomnia` is meant to be a stage1 DLL loader (with DarkLoadLibrary). It works when injected with process hollowing modified to launch an .exe instead of PIC, and sleeps with a modified version of Ekko (covered at length in https://tishina.in/execution/phase-dive-sleep-obfuscation) to avoid memory scanning of newly created processes. 

It is created to be used with the `DOUBLEGOD` unhooking+injection technique, the implementation of which stays private at the moment.

Static evasion (due to the payload launch mechanism) is out-of-scope for the project.

*includes a test DLL for, well, testing*

# credits
https://github.com/bats3c/DarkLoadLibrary
https://github.com/Cracked5pider/Ekko
