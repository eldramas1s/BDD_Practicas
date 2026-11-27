CREATE OR REPLACE TRIGGER Trabajar_Before 
BEFORE UPDATE ON Trabajar
FOR EACH ROW 
BEGIN
    IF :NEW.salario < :OLD.salario THEN
        RAISE_APPLICATION_ERROR(-20101, 'El salario del empleado no puede disminuir');
    END IF;
END;

