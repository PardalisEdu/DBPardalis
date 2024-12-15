DELIMITER //

CREATE TRIGGER tr_nuevo_usuario_personalizacion 
AFTER INSERT ON pardalis_db.usuarios
FOR EACH ROW
BEGIN
    INSERT INTO pardalis_db.personalizacion (apodo, descripcion)
    VALUES (NEW.apodo, 'Hola, soy nuevo en Pardalis');
END //

DELIMITER ;
