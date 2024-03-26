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

    MACRO _continue_if flag

        jr flag,  DLOOP_TOP
    ENDM


    MACRO _djnz

        djnz DLOOP_TOP
        DLOOP_POP
    ENDM




;;;;;;;;;;;;;;;;;;;;;;;;;; 
; IF 
;;;;;;;;;;;;;;;;;;;;;;;;;;

IF_7 = 0
IF_6 = 0
IF_5 = 0
IF_4 =  0
IF_3 =  0
IF_2 =  0
IF_TOP = 0


ELSE_USED_7 = 0
ELSE_USED_6 = 0
ELSE_USED_5 = 0
ELSE_USED_4 =  0
ELSE_USED_3 =  0
ELSE_USED_2 =  0
ELSE_USED_TOP = 0




    MACRO IF_PUSH 

IF_7 = IF_6
IF_6 = IF_5
IF_5 = IF_4
IF_4 = IF_3
IF_3 = IF_2
IF_2 = IF_TOP
IF_TOP = IF_2 + 2


ELSE_USED_7 = ELSE_USED_6
ELSE_USED_6 = ELSE_USED_5
ELSE_USED_5 = ELSE_USED_4
ELSE_USED_4 = ELSE_USED_3
ELSE_USED_3 = ELSE_USED_2
ELSE_USED_2 = ELSE_USED_TOP
ELSE_USED_TOP = 0

    ENDM

    MACRO IF_POP

IF_TOP = IF_2
IF_2 = IF_3
IF_3 = IF_4
IF_4 = IF_5
IF_5 = IF_6
IF_6 = IF_7
IF_7 = 0


ELSE_USED_TOP = ELSE_USED_2
ELSE_USED_2 = ELSE_USED_3
ELSE_USED_3 = ELSE_USED_4
ELSE_USED_4 = ELSE_USED_5
ELSE_USED_5 = ELSE_USED_6
ELSE_USED_6 = ELSE_USED_7
ELSE_USED_7 = 0

    ENDM



 
 

    MACRO _if_not arg

    IF_PUSH 

    IF IF_TOP = 2 
        jr arg, 2F
    ENDIF

    IF IF_TOP = 4
        jr arg, 4F
    ENDIF

    IF IF_TOP = 6
        jr arg, 6F
    ENDIF

    IF IF_TOP = 8
        jr arg, 8F
    ENDIF

    IF IF_TOP = 10 
        jr arg, 10F
    ENDIF

    IF IF_TOP = 12 
        jr arg, 12F
    ENDIF

    IF IF_TOP = 14
        jr arg, 14F
    ENDIF


    ENDM





    MACRO _else
   
ELSE_USED_TOP = 1


    IF IF_TOP = 2 
        jr  3F
2        
    ENDIF

    IF IF_TOP = 4
        jr  5F
4
    ENDIF

    IF IF_TOP = 6
        jr  7F
6
    ENDIF

    IF IF_TOP = 8
        jr  9F
8        
    ENDIF

    IF IF_TOP = 10 
        jr  11F
10        
    ENDIF

    IF IF_TOP = 12 

        jr  13F
12        
    ENDIF

    IF IF_TOP = 14
        jr  15F
14        
    ENDIF


    ENDM






    MACRO _end_if

    IF ELSE_USED_TOP = 1

        IF IF_TOP = 2 
3
        ENDIF
        

        IF IF_TOP = 4
5
        ENDIF

        IF IF_TOP = 6
7
        ENDIF

        IF IF_TOP = 8
9
        ENDIF

        IF IF_TOP = 10
11
        ENDIF

    ENDIF

    IF ELSE_USED_TOP = 0

        IF IF_TOP = 2 
2
        ENDIF

        IF IF_TOP = 4
4
        ENDIF
        IF IF_TOP = 6
6
        ENDIF

        IF IF_TOP = 8
8
        ENDIF

        IF IF_TOP = 10
10
        ENDIF

 

    ENDIF

        IF_POP
    ENDM


