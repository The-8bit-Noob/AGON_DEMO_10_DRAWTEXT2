   10 REM ******************************
   20 REM *        AGON LIGHT 2        *
   30 REM *      BBC BASIC MODE 8      *
   40 REM *            DEMO            *
   50 REM *         640 X 480          *
   60 REM *          DRAWING           *
   70 REM *          FERRARI           *
   80 REM *      BY STEVE LOVEJOY      *
   90 REM ******************************
  100 :
  110 REM START OF MAIN PROGRAM.
  120 :
  130 PROC_INIT            : REM CALL INIT PROCESS.
  140 RESTORE 6010
  150 PROC_DRAW_CAR
  160 RESTORE 6300
  170 PROC_DRAW_WHEELS
  180 :
 1000 END                 : REM **** END OF MAIN PROGRAM ****
 1010 :
 3090 REM PROCESS DEFINES.
 4000 DEF PROC_INIT       : REM DEFINE INITIAL PROCESS.
 4010 VDU 22,0            : REM SET SCREEN MODE.
 4020 VDU 23,1,0          : REM DISABLE CURSOR.
 4030 VDU 12              : REM SAME AS CLS (clear text from screen).
 4040 VDU 16              : REM SAME AS CLG (clear graphics from screen).
 4050 REM VARS.
 4050 SW% = 1279          : REM SCREEN WIDTH IN GRAPHICAL UNITS.
 4060 SH% = 1023          : REM SCREEN HEIGHT IN GRAPHICAL UNITS.
 4070 SC = 5.0            : REM FLOAT FOR SCALE (PLAY WITH THIS #).
 4080 DX% = SW%/2-400     : REM DEFAULT X START COORDS (center of screen -400).
 4090 DY% = SH%/2-50      : REM DEFAULT Y START COORDS (center of screen -50).
 4100 VDU 18,0,9          : REM SET COLOUR OF GRAPHICS.
 4200 ENDPROC             : REM END INIT PROCESS.
 4500 :
 4510 DEF PROC_DRAW_CAR   : REM DEFINE DRAW PROCESS.
 4520 DIM CXY% (1024)     : REM CAR ARRAY BIG ENOUGH NUMBER TO HOLD ALL DATA.
 4530 :
 4540 REPEAT                    : REM START OF CAR LOOP.
 4550     READ CX%,CY%            : REM GET DATA FOR CX & CY.
 4560     IF CX% >= 0 GOTO 4640  : REM IF CX% IS 0 OR ABOVE DRAW.
 4570         REM SPECIAL VALUES, EITHER MOVE OR END.
 4580         IF CX% = -12345 GOTO 4650                 : REM IF CX IS END MARKER.
 4590           CX% = ABS(CX%)                          : REM IF CX IS A MINUS # MOVE (NOT DRAW), ABS CONVERTS TO POSITIVE #.
 4600           CY% = ABS(CY%)                          : REM IF CX IS A MINUS # MOVE (NOT DRAW), ABS CONVERTS TO POSITIVE #.
 4610           MOVE DX% + (CX% * SC), DY% + (CY% * SC) : REM **** MOVE CAR ****
 4620           GOTO 4650
 4630     REM ELSE
 4640           DRAW DX% + (CX% * SC), DY% + (CY% * SC) : REM **** DRAW CAR ****
 4650     REM ENDIF
 4660 UNTIL CX% = -12345 AND CY% = -12345               : REM LOOP UNTIL END MARKERS ARE READ.
 4670 :
 4680 ENDPROC                                         : REM END DRAW CAR PROCESS.
 5500 :
 5510 DEF PROC_DRAW_WHEELS       : REM DEFINE DRAW WHEELS PROCESS.
 5520 REM DIM WXY% (1024)        : REM WHEELS ARRAY BIG ENOUGH NUMBER TO HOLD ALL DATA.
 5530 :
 5540 REPEAT                     : REM START OF WHEELS LOOP.
 5550     READ WX%,WY%           : REM GET DATA FOR WX & WY.
 5560     IF WX% >= 0 GOTO 5640  : REM IF WX% IS 0 OR ABOVE = WHEEL RADIUS.
 5570         REM SPECIAL VALUES, EITHER MOVE OR END.
 5580         IF WX% = -12345 GOTO 5650                 : REM IF WX IS END MARKER.
 5590           WX% = ABS(WX%)                          : REM IF WX IS A MINUS # MOVE (NOT DRAW), ABS CONVERTS TO POSITIVE #.
 5600           WY% = ABS(WY%)                          : REM IF WX IS A MINUS # MOVE (NOT DRAW), ABS CONVERTS TO POSITIVE #.
 5610           MOVE DX% + (WX% * SC), DY% + (WY% * SC) : REM **** MOVE WHEELS ****
 5620           GOTO 5650
 5630     REM ELSE
 5640           PLOT 145,WX%*SC,0 : REM **** DRAW WHEELS ****
 5650     REM ENDIF
 5660 UNTIL WX% = -12345 AND WY% = -12345               : REM LOOP UNTIL WHEELS END MARKERS ARE READ.
 5670 :
 5680 ENDPROC                                           : REM END DRAW WHEELS PROCESS.
 6000 :
 6010 DATA -5,-11,7,14,1,21,18,27,11,30,11,26,-18,-27,43,33
 6020 DATA 55,35,-49,-34,60,32,-55,-35,60,33,-55,-35,53,26,53,22
 6030 DATA 54,16,55,11,49,11,47,19,43,22,39,24,36,24,35,24
 6040 DATA 30,22,27,19,23,11,5,11,-15,-21,19,21,19,23,15,23
 6050 DATA 15,21,-3,-19,25,19,-55,-11,97,11,99,15,100,19,101,24
 6060 DATA 101,29,100,33,60,33,86,44,85,46,54,35,-47,-19,52,19
 6070 DATA 100,19,-74,-28,111,22,112,24,112,27,111,30,74,28,-75,-33
 6080 DATA 83,41,-101,-33,136,33,113,45,104,47,101,33,-104,-47,125,37
 6090 DATA 124,33,-122,-33,123,38,-119,-33,120,37,-117,-33,118,36,-115,-33
 6100 DATA 116,37,-111,-33,114,39,-109,-33,111,40,-107,-33,109,41,-105,-33
 6110 DATA 107,42,-103,-33,105,43,-136,-33,159,35,113,45,-159,-35,162,37
 6120 DATA 162,24,160,21,157,16,146,12,142,19,158,19,-157,-22,157,24
 6130 DATA 153,24,153,22,157,22,-142,-19,138,23,134,24,131,24,128,24
 6140 DATA 123,23,119,21,117,19,114,11,49,11,-117,-19,100,19,-110,-17
 6150 DATA 103,17,102,15,110,15,110,17,-95,-33,96,35,97,36,98,36
 6160 DATA 99,35,100,33
 6200 DATA -12345,-12345 : REM END DRAW CAR MARKERS.
 6300 DATA -37,-15,9,9,-37,-15,7,7,-37,-15,2,2
 6310 DATA -130,-15,9,9,-130,-15,7,7,-130,-15,2,2
 6500 DATA -12345,-12345 : REM END DRAW WHEELS MARKERS.
