# 🗃️ Pardalis Database

Base de datos para Pardalis, una plataforma educativa diseñada para hacer el aprendizaje del inglés accesible y divertido para estudiantes de primaria.

## 📋 Estructura

La base de datos está diseñada con las siguientes tablas principales:

- `usuarios`: Almacena la información de los usuarios
- `personalizacion`: Guarda las personalizaciones del perfil de usuario

## 🚀 Inicio Rápido

### Prerrequisitos

- MySQL 8.0 o superior
- Privilegios de administrador en la base de datos

### Instalación

1. Clona este repositorio:
```bash
git clone https://gitlab.com/pardalis/db-pardalis.git
```

2. Ejecuta los scripts SQL en el siguiente orden:
```bash
mysql -u root -p pardalis_db < estructura_pardalis_db.sql
mysql -u root -p pardalis_db < triggers.sql
```

## 🔐 Roles y Usuarios

El sistema implementa tres roles principales:

- `pardalis_admin`: Acceso completo al sistema
- `pardalis_app`: Permisos para operaciones de la aplicación
- `pardalis_monitor`: Permisos de solo lectura para monitoreo

### Usuarios por defecto:

- `admin_pardalis`: Administrador del sistema
- `app_pardalis`: Usuario de la aplicación
- `monitor_pardalis`: Usuario de monitoreo

⚠️ **Importante**: Cambia las contraseñas por defecto después de la instalación.

## 📊 Modelo de Datos

### usuarios
| Campo       | Tipo         | Descripción            |
|------------|--------------|------------------------|
| apodo      | VARCHAR(255) | Primary Key           |
| nombre     | VARCHAR(255) | Nombre del usuario    |
| correo     | VARCHAR(255) | Email único           |
| contrasenna| VARCHAR(255) | Contraseña hasheada   |
| registro   | TIMESTAMP    | Fecha de registro     |

### personalizacion
| Campo               | Tipo         | Descripción                |
|--------------------|--------------|----------------------------|
| apodo              | VARCHAR(255) | Primary Key/Foreign Key   |
| descripcion        | TEXT         | Bio del usuario           |
| foto               | VARCHAR(255) | Ruta de la foto           |
| fecha_actualizacion| TIMESTAMP    | Última actualización      |

## 🛡️ Seguridad

- Todas las contraseñas deben ser hasheadas antes de almacenarse
- Las conexiones deben usar SSL/TLS en producción
- Los usuarios admin y monitor deben cambiar sus contraseñas en el primer inicio de sesión

## 🤝 Contribuir

1. Haz fork del repositorio
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'feat: Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia GPL-3.0. Ver el archivo `LICENSE` para más detalles.

---
Made with 💛 by the Ponchoides Team
