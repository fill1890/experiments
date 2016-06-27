; Ensures jump to kernel entry function main()
[bits 32]
[extern main]

call main
jmp $
