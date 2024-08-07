CREATE OR REPLACE
PROCEDURE SP_POPULATE_REGION(
    P_USER_ID IN VARCHAR2)
IS
  V_ID VARCHAR2(36);
  CURSOR REGION_CURSOR
  IS
    SELECT REGION_NAME FROM SRC_REGION;
BEGIN
  FOR REGION_REC IN REGION_CURSOR
  LOOP
    V_ID := SYS_GUID();
    INSERT
    INTO TAR_REGION
      (
        ID,
        NAME,
        DESCRIPTION,
        CREATED_BY,
        UPDATED_BY
      )
      VALUES
      (
        V_ID,
        REGION_REC.REGION_NAME,
        REGION_REC.REGION_NAME,
        P_USER_ID,
        P_USER_ID
      );
  END LOOP;
END;
/

DECLARE
BEGIN
  SP_POPULATE_REGION('NIMISH');
END;
/