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



;;;;;;;;;;;;;;;;;;;;;;;;;; 
; IF 
;;;;;;;;;;;;;;;;;;;;;;;;;;


IF_COUNT = 0;


    MACRO IF_PUSH 
IF_COUNT = IF_COUNT +1 
    ENDM

    MACRO IF_POP
IF_COUNT = IF_COUNT - 1 
    ENDM
 

    MACRO _if_not arg

    IF_PUSH 

    IF IF_COUNT = 1 
        jr arg, 1F
    ENDIF

    IF IF_COUNT = 2
        jr arg, 2F
    ENDIF

    IF IF_COUNT = 3
        jr arg, 3F
    ENDIF

    IF IF_COUNT = 4
        jr arg, 4F
    ENDIF

    IF IF_COUNT = 5 
        jr arg, 5F
    ENDIF




    ENDM

    MACRO _end_if


 

    IF IF_COUNT = 1 
1
    ENDIF

    IF IF_COUNT = 2
2
    ENDIF

    IF IF_COUNT = 3
3
    ENDIF

    IF IF_COUNT = 4
4
    ENDIF

    IF IF_COUNT = 5 
5
    ENDIF





        IF_POP
    ENDM



