DLOOP_5 = 0
DLOOP_4 = 0
DLOOP_3 = 0
DLOOP_2 = 0
DLOOP_TOP = 0

    MACRO DLOOP_PUSH arg
DLOOP_5 = DLOOP_4
DLOOP_4 = DLOOP_3
DLOOP_3 = DLOOP_2
DLOOP_2 = DLOOP_TOP
DLOOP_TOP = arg
    ENDM

    MACRO DLOOP_POP

DLOOP_TOP = DLOOP_2
DLOOP_2 = DLOOP_3
DLOOP_3 = DLOOP_4
DLOOP_4 = DLOOP_5
DLOOP_5 =  0

    ENDM

    MACRO _do
        DLOOP_PUSH $

    ENDM

    MACRO _while flag

        jr flag, DLOOP_TOP
        DLOOP_POP
    ENDM

    MACRO _while_true

        jr DLOOP_TOP
        DLOOP_POP
    ENDM


    MACRO _djnz

        djnz DLOOP_TOP
        DLOOP_POP
    ENDM


