-- 코드를 입력하세요
SELECT ANIMAL_ID, 
        NAME, 
        # SEX_UPON_INTAKE
        CASE 
            WHEN SEX_UPON_INTAKE LIKE 'Neutered%' OR SEX_UPON_INTAKE LIKE 'Spayed%' THEN 'O'
            ELSE 'X'
        END
        AS '중성화'

FROM ANIMAL_INS
ORDER BY ANIMAL_ID ASC