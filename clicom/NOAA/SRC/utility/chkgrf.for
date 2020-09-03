$STORAGE:2

      SUBROUTINE CHKGRF(INCHAR)
C
C   ROUTINE TO CONVERT SHIFTED FUNCTION KEYS TO STANDARD GRAPHICS 
C   CHARACTERS.
C
C   THE SHIFTED FUNCTION KEYS ARE CONVERTED ACCORDING TO THE FOLLWOING:
C
C          F1 �    F2 �
C          F3 �    F4 �
C          F5 �    F6 �
C          F7 �    F8 �
C          F9 �    F10 �
C
      CHARACTER*2 INCHAR
C
      IF (INCHAR.EQ.'1S') THEN
         INCHAR = '� '
      ELSE IF (INCHAR.EQ.'2S') THEN
         INCHAR = '�'
      ELSE IF (INCHAR.EQ.'3S') THEN
         INCHAR = '�'
      ELSE IF (INCHAR.EQ.'4S') THEN
         INCHAR = '�'
      ELSE IF (INCHAR.EQ.'5S') THEN
         INCHAR = '�'
      ELSE IF (INCHAR.EQ.'6S') THEN
         INCHAR = '�'
      ELSE IF (INCHAR.EQ.'7S') THEN
         INCHAR = '�'
      ELSE IF (INCHAR.EQ.'8S') THEN
         INCHAR = '�'
      ELSE IF (INCHAR.EQ.'9S') THEN
         INCHAR = '�'
      ELSE IF (INCHAR.EQ.'0S') THEN
         INCHAR = '�'
      END IF
      RETURN
      END
