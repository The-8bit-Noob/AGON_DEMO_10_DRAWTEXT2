   10 REM ******************************
   20 REM *        AGON LIGHT 2        *
   30 REM *      BBC BASIC MODE 8      *
   40 REM *          DEMO 10           *
   50 REM *         320 X 240          *
   60 REM *     DRAW & SCALE TEXT2     *
   70 REM *  A HUGE THANKS TO MILTONW  *
   80 REM *  FOR THE CODE IT's All HIS *
   90 REM ******************************
   95 :
  100 VDU 22,8            : REM SET SCREEN MODE.
  110 VDU 23,1,0          : REM DISABLE CURSOR.
  120 VDU 12              : REM SAME AS CLS (clear text from screen).
  130 VDU 16              : REM SAME AS CLG (clear graphics from screen).
  140 VDU 18,0,10          : REM SAME AS GCOL (set colour of graphics).
  150 SW% = 1280          : REM SCREEN WIDTH IN GRAPHICAL UNITS.
  160 SH% = 1024          : REM SCREEN HEIGHT IN GRAPHICAL UNITS.
  170 SC = 7.0            : REM ASSIGN FLOAT FOR SCALE (PLAY WITH THIS #).
  180 DX% = SW%/2-(32*SC) : REM DEFAULT X START COORDS (center of screen -400).
  190 DY% = SH%/2-(8*SC)  : REM DEFAULT Y START COORDS (center of screen -50).
  200 :
  210 PROC_DRAW           : REM CALL THE DRAW PROCESS.
  220 :
  230 END                 : REM **** END OF PROGRAM ****
  240 :
 1000 REM **** DRAW AGON ****
 1010 DEF PROC_DRAW       : REM DRAW PROCESS.
 1020 DIM XY% (1024)      : REM ARRY BIG ENOUGH NUMBER TO HOLD ALL DATA.
 1030 :
 1040 REPEAT              : REM START OF LOOP.
 1050     READ X%,Y%            : REM GET DATA FOR X & Y.
 1060     IF X% >= 0 GOTO 1140  : REM IF X% IS 0 OR ABOVE DRAW.
 1070         REM SPECIAL VALUES, EITHER MOVE OR END.
 1080         IF X% = -12345 GOTO 1150                : REM IF X IS END MARKER.
 1090           X% = ABS(X%)                          : REM IF X IS A MINUS # MOVE (NOT DRAW), ABS CONVERTS TO POSITIVE #.
 1100           Y% = ABS(Y%)                          : REM IF X IS A MINUS # MOVE (NOT DRAW), ABS CONVERTS TO POSITIVE #.
 1110           MOVE DX% + (X% * SC), DY% + (Y% * SC) : REM **** MOVE ****
 1120           GOTO 1150
 1130     REM ELSE
 1140           DRAW DX% + (X% * SC), DY% + (Y% * SC) : REM **** DRAW ****
 1150     REM ENDIF
 1160 UNTIL X% = -12345 AND Y% = -12345               : REM LOOP UNTIL END MARKERS ARE READ.
 1170 :
 1180 ENDPROC                                         : REM END DRAW PROCESS.
 1200 :
 1210 REM A
 1220 DATA -1,-2
 1230 DATA 1,6,3,6,3,8,5,8,5,10,7,10,7,12,9,12
 1240 DATA 9,14,11,14,11,16,15,16,15,0,13,0,13,2,11,2,11,8
 1250 DATA 9,8,9,6,7,6,7,4,5,4,5,2,1,2
 1260 REM G
 1270 DATA -17,-2
 1280 DATA 17,16,31,16,31,13,20,13,20,5,27,5,27,9,29,9
 1290 DATA 29,11,31,11,31,2,29,2,29,0,27,0,27,2,17,2
 1300 REM O
 1310 DATA -33,-2
 1320 DATA 33,16,47,16,47,2,33,2
 1330 DATA -36,-5
 1340 DATA 36,13,44,13,44,5,36,5
 1350 REM N
 1360 DATA -49,-2
 1370 DATA 49,16,51,16,51,15,53,15,53,13,55,13,55,11,57,11
 1380 DATA 57,9,60,9,60,16,63,16,63,0,61,0,61,1,59,1
 1390 DATA 59,3,57,3,57,5,55,5,55,7,52,7,52,2,49,2
 1400 :
 1410 DATA -12345, -12345                             : REM END MARKERS.
 1420 :
