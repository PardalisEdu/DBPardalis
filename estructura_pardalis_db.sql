CREATE DATABASE IF NOT EXISTS pardalis_db;

CREATE TABLE IF NOT EXISTS pardalis_db.usuarios
(
    apodo       VARCHAR(255) PRIMARY KEY,
    nombre      VARCHAR(255)        NOT NULL,
    correo      VARCHAR(255) UNIQUE NOT NULL,
    contrasenna VARCHAR(255)        NOT NULL,
    registro    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ) ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS pardalis_db.personalizacion
(
    apodo               VARCHAR(255)                       NOT NULL,
    descripcion         TEXT                               NOT NULL,
    foto                VARCHAR(255) DEFAULT 'img/profiles/ocelote.svg' NOT NULL,
    fecha_actualizacion TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT personalizacion_pk PRIMARY KEY (apodo),
    CONSTRAINT personalizacion_usuarios_fk
    FOREIGN KEY (apodo) REFERENCES usuarios (apodo)
                                                               ON DELETE CASCADE
                                                               ON UPDATE CASCADE
    ) ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4
    COLLATE = utf8mb4_unicode_ci;

DROP ROLE IF EXISTS 'pardalis_admin';
DROP ROLE IF EXISTS 'pardalis_app';
DROP ROLE IF EXISTS 'pardalis_monitor';

CREATE ROLE 'pardalis_admin';     -- Administrador del sistema
CREATE ROLE 'pardalis_app';       -- Aplicación
CREATE ROLE 'pardalis_monitor';   -- Monitoreo/Reportes

GRANT ALL PRIVILEGES ON pardalis_db.* TO 'pardalis_admin';

GRANT SELECT, INSERT, UPDATE ON pardalis_db.usuarios TO 'pardalis_app';
GRANT SELECT, INSERT, UPDATE ON pardalis_db.personalizacion TO 'pardalis_app';

-- Permisos para monitoreo
GRANT SELECT ON pardalis_db.* TO 'pardalis_monitor';

-- Crear usuarios específicos
-- Administrador
CREATE USER IF NOT EXISTS 'admin_pardalis'
    IDENTIFIED BY 'AdminSecurePass123!';
GRANT 'pardalis_admin' TO 'admin_pardalis';

-- Usuario de aplicación
CREATE USER IF NOT EXISTS 'app_pardalis'
    IDENTIFIED BY 'AppSecurePass123!';
GRANT 'pardalis_app' TO 'app_pardalis';

-- Usuario monitor
CREATE USER IF NOT EXISTS 'monitor_pardalis'
    IDENTIFIED BY 'MonitorSecurePass123!';
GRANT 'pardalis_monitor' TO 'monitor_pardalis';

-- Forzar cambio de contraseña en primer inicio de sesión (excepto para la app)
ALTER USER 'admin_pardalis' PASSWORD EXPIRE;
ALTER USER 'monitor_pardalis' PASSWORD EXPIRE;
