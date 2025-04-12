--consultas join
CREATE TABLE EstatusAsistencia (
    EstatusAsistenciaId INTEGER PRIMARY KEY AUTO_INCREMENT,
    NombreEstatus VARCHAR(50) NOT NULL
);

CREATE TABLE Rol (
    RolId INTEGER PRIMARY KEY AUTO_INCREMENT,
    NombreRol VARCHAR(50) NOT NULL,
    Activo BOOLEAN NOT NULL
);

CREATE TABLE Empleado (
    EmpleadoId INTEGER PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    APaterno VARCHAR(50) NOT NULL,
    AMaterno VARCHAR(50),
    FechaContratacion DATE NOT NULL,
    Activo BOOLEAN NOT NULL,
    RolId INTEGER NOT NULL,
    FOREIGN KEY (RolId) REFERENCES Rol(RolId)
);

CREATE TABLE Asistencia (
    AsistenciaId INTEGER PRIMARY KEY AUTO_INCREMENT,
    EstatusAsistenciaId INTEGER NOT NULL,
    EmpleadoId INTEGER NOT NULL,
    FOREIGN KEY (EstatusAsistenciaId) REFERENCES EstatusAsistencia(EstatusAsistenciaId),
    FOREIGN KEY (EmpleadoId) REFERENCES Empleado(EmpleadoId)
);

CREATE TABLE EstatusProyecto (
    EstatusProyectoId INTEGER PRIMARY KEY AUTO_INCREMENT,
    NombreEstatus VARCHAR(50) NOT NULL
);

CREATE TABLE Proyecto (
    ProyectoId INTEGER PRIMARY KEY AUTO_INCREMENT,
    NombreProyecto VARCHAR(50) NOT NULL,
    FechaLanzamiento DATE NOT NULL,
    EstatusProyectoId INTEGER NOT NULL,
    Activo BOOLEAN NOT NULL,
    FechaCierre DATE,
    FOREIGN KEY (EstatusProyectoId) REFERENCES EstatusProyecto(EstatusProyectoId)
);

CREATE TABLE Modulos (
    ModuloId INTEGER PRIMARY KEY AUTO_INCREMENT,
    NombreModulo VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(100),
    ProyectoId INTEGER NOT NULL,
    FOREIGN KEY (ProyectoId) REFERENCES Proyecto(ProyectoId)
);

CREATE TABLE Iteracion (
    IteracionId INTEGER PRIMARY KEY AUTO_INCREMENT,
    DescripcionEntregable TEXT NOT NULL,
    EstimacionHoras INTEGER NOT NULL,
    ProyectoId INTEGER NOT NULL,
    FOREIGN KEY (ProyectoId) REFERENCES Proyecto(ProyectoId)
);

CREATE TABLE InformacionProyecto (
    InformacionProyectoId INTEGER PRIMARY KEY AUTO_INCREMENT,
    DuracionMeses INTEGER NOT NULL,
    Responsable VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(700) NOT NULL,
    ProyectoId INTEGER NOT NULL,
    CostoEstimado DECIMAL(5,4) NOT NULL,
    CostoVenta DECIMAL(5,4) NOT NULL,
    FOREIGN KEY (ProyectoId) REFERENCES Proyecto(ProyectoId)
);

CREATE TABLE ProyectoEmpleado (
    ProyectoEmpleadoId INTEGER PRIMARY KEY AUTO_INCREMENT,
    ProyectoId INTEGER NOT NULL,
    EmpleadoId INTEGER NOT NULL,
    FOREIGN KEY (ProyectoId) REFERENCES Proyecto(ProyectoId),
    FOREIGN KEY (EmpleadoId) REFERENCES Empleado(EmpleadoId)
);


--Insertar EstatusAsistencia
INSERT INTO EstatusAsistencia (NombreEstatus) VALUES
('Asistencia'),
('Falta'),
('Retardo'),
('Permiso con goce de sueldo'),
('Permiso sin goce de sueldo'),
('Incapacidad médica'),
('Día festivo'),
('Vacaciones'),
('Suspensión'),
('Home Office');

--Insertar Rol
INSERT INTO Rol (NombreRol, Activo) VALUES
('Administrador', TRUE),
('Gerente', TRUE),
('Supervisor', TRUE),
('Empleado', TRUE),
('Recursos Humanos', TRUE),
('Contador', TRUE),
('Soporte Técnico', TRUE),
('Seguridad', TRUE),
('Limpieza', TRUE),
('Interno', FALSE);

-- Insertar Empleado
INSERT INTO Empleado (Nombre, APaterno, AMaterno, FechaContratacion, Activo, RolId) VALUES
('Juan', 'Pérez', 'Gómez', '2022-01-15', TRUE, 1),
('María', 'López', 'Fernández', '2021-06-10', TRUE, 2),
('Carlos', 'Ramírez', 'Torres', '2023-03-20', FALSE, 3),
('Ana', 'González', 'Martínez', '2020-11-05', TRUE, 2),
('Luis', 'Hernández', 'Sánchez', '2019-09-30', TRUE, 1),
('Elena', 'Díaz', 'Morales', '2022-07-18', FALSE, 3),
('Pedro', 'Ortega', 'Vargas', '2023-02-25', TRUE, 1),
('Lucía', 'Mendoza', 'Castro', '2021-08-12', TRUE, 2),
('Javier', 'Silva', 'Rojas', '2018-05-22', FALSE, 3),
('Sofía', 'Cruz', 'Paredes', '2020-12-17', TRUE, 1);

--insertar Asistencia
INSERT INTO Asistencia (EstatusAsistenciaId, EmpleadoId) VALUES
(1, 1),  -- Asistencia para el empleado 1
(2, 2),  -- Falta para el empleado 2
(3, 3),  -- Retardo para el empleado 3
(1, 4),  -- Asistencia para el empleado 4
(4, 5),  -- Permiso con goce de sueldo para el empleado 5
(5, 6),  -- Permiso sin goce de sueldo para el empleado 6
(6, 7),  -- Incapacidad médica para el empleado 7
(7, 8),  -- Día festivo para el empleado 8
(8, 9),  -- Vacaciones para el empleado 9
(1, 10); -- Asistencia para el empleado 10

--Insertar EstatusProyecto
INSERT INTO EstatusProyecto (NombreEstatus) VALUES
('Planeación'),
('En desarrollo'),
('En pruebas'),
('En revisión'),
('Aprobado'),
('En espera'),
('Cancelado'),
('Finalizado'),
('Mantenimiento'),
('Suspendido');

-- Insertar proyectos
INSERT INTO Proyecto (NombreProyecto, FechaLanzamiento, EstatusProyectoId, Activo, FechaCierre) VALUES
('Sistema de Ventas', '2023-01-15', 1, TRUE, NULL),
('Aplicación Móvil', '2022-06-10', 2, TRUE, NULL),
('Plataforma E-learning', '2023-03-20', 3, TRUE, NULL),
('Rediseño Web', '2021-11-05', 4, TRUE, NULL),
('Software Contable', '2020-09-30', 5, TRUE, '2023-12-01'),
('Automatización de Reportes', '2022-07-18', 6, FALSE, NULL),
('Implementación de ERP', '2023-02-25', 7, FALSE, '2023-09-30'),
('Sistema de Recursos Humanos', '2021-08-12', 8, TRUE, NULL),
('Integración de API', '2019-05-22', 9, TRUE, '2024-02-15'),
('Plataforma de Marketing', '2020-12-17', 10, FALSE, '2022-06-01');

-- Insertar módulos
INSERT INTO Modulos (NombreModulo, Descripcion, ProyectoId) VALUES
('Login', 'Módulo de autenticación de usuarios', 1),
('Dashboard', 'Panel principal con métricas y reportes', 1),
('Gestión de Usuarios', 'Administración de roles y permisos', 2),
('Catálogo de Productos', 'Gestión de productos y categorías', 3),
('Carrito de Compras', 'Funcionalidad para agregar productos al carrito', 3),
('Procesamiento de Pagos', 'Integración con pasarelas de pago', 4),
('Reportes Financieros', 'Generación de informes contables', 5),
('Gestión de Empleados', 'Administración de personal y asistencia', 6),
('Notificaciones', 'Envío de alertas por email y SMS', 7),
('API de Integración', 'Conexión con servicios externos', 8);

-- Insertar iteraciones
INSERT INTO Iteracion (DescripcionEntregable, EstimacionHoras, ProyectoId) VALUES
('Prototipo inicial con diseño UI/UX', 40, 1),
('Implementación del módulo de autenticación', 50, 1),
('Desarrollo del sistema de reportes', 60, 2),
('Optimización de base de datos y consultas', 35, 3),
('Integración con pasarelas de pago', 45, 4),
('Pruebas de carga y rendimiento', 30, 5),
('Desarrollo de API para integración externa', 55, 6),
('Automatización de procesos internos', 70, 7),
('Seguridad y encriptación de datos', 40, 8),
('Entrega final y documentación', 80, 9);

--insertar InformacionProyecto
INSERT INTO InformacionProyecto 
    (DuracionMeses, Responsable, Descripcion, ProyectoId, CostoEstimado, CostoVenta) 
VALUES
    (12, 'Juan Pérez', 'Desarrollo de una aplicación web para gestión de inventarios.', 1, 1500.1234, 2000.5678),
    (8, 'María Gómez', 'Implementación de un sistema de control de acceso.', 2, 1200.5678, 1800.4321),
    (10, 'Carlos López', 'Desarrollo de software de contabilidad para pequeñas empresas.', 3, 1800.3456, 2500.7890),
    (6, 'Ana Torres', 'Modernización del sistema de ventas en línea.', 4, 900.6789, 1500.1234),
    (14, 'Pedro Ramírez', 'Desarrollo de una plataforma de educación en línea.', 5, 2500.9876, 3200.5432),
    (9, 'Laura Fernández', 'Optimización del sistema de gestión de recursos humanos.', 6, 1300.2345, 1900.8765),
    (7, 'José Martínez', 'Desarrollo de una aplicación móvil para reservas de hotel.', 7, 1100.7654, 1700.2345),
    (11, 'Andrea Silva', 'Automatización del proceso de facturación.', 8, 1600.5432, 2200.6789),
    (13, 'Fernando Rojas', 'Creación de un sistema de gestión de almacenes.', 9, 2000.8765, 2700.9876),
    (5, 'Gabriela Castro', 'Mejora del sistema de atención al cliente con IA.', 10, 800.4321, 1400.6543);

--insertar ProyectoEmpleado
INSERT INTO ProyectoEmpleado (ProyectoId, EmpleadoId) 
VALUES
    (1, 101),
    (2, 102),
    (3, 103),
    (4, 104),
    (5, 105),
    (6, 106),
    (7, 107),
    (8, 108),
    (9, 109),
    (10, 110);

--consultas join

--a)	Lista de proyectos con el nombre del proyecto, Fecha de lanzamiento, Duracion en meses del proyecto y el costo de venta.
SELECT 
  p.NombreProyecto, 
  p.FechaLanzamiento, 
  ip.DuracionMeses, 
  ip.CostoVenta
FROM 
  Proyecto p
  JOIN InformacionProyecto ip ON p.ProyectoId = ip.ProyectoId;

--b)	La lista de proyectos con los modulos.
SELECT 
  p.NombreProyecto, 
  p.FechaLanzamiento, 
  m.NombreModulo, 
  m.Descripcion
FROM 
  Proyecto p
  JOIN Modulos m ON p.ProyectoId = m.ProyectoId;

--c)	Lista de proyectos con los empleados asignados.
SELECT 
  p.NombreProyecto, 
  e.Nombre, 
  e.APaterno, 
  e.AMaterno
FROM 
  Proyecto p
  JOIN ProyectoEmpleado pe ON p.ProyectoId = pe.ProyectoId
  JOIN Empleado e ON pe.EmpleadoId = e.EmpleadoId;


--d)	La lista de empleados con el rol que tiene.

SELECT 
  e.Nombre, 
  e.APaterno, 
  e.AMaterno, 
  r.NombreRol
FROM 
  Empleado e
  JOIN Rol r ON e.RolId = r.RolId;

--e)	La lista de empleados con su asistencia.

SELECT 
  e.Nombre, 
  e.APaterno, 
  e.AMaterno, 
  ea.NombreEstatus
FROM 
  Empleado e
  JOIN Asistencia a ON e.EmpleadoId = a.EmpleadoId
  JOIN EstatusAsistencia ea ON a.EstatusAsistenciaId = ea.EstatusAsistenciaId;

--f)	La lista de proyectos con sus iteraciones.

SELECT 
  p.NombreProyecto, 
  i.DescripcionEntregable, 
  i.EstimacionHoras
FROM 
  Proyecto p
  JOIN Iteracion i ON p.ProyectoId = i.ProyectoId;

--g)	Lista de empleados, con los nombres de los proyectos que tiene asignados, y la información del proyecto.

SELECT 
  e.Nombre, 
  e.APaterno, 
  e.AMaterno, 
  p.NombreProyecto, 
  p.FechaLanzamiento, 
  ip.DuracionMeses, 
  ip.CostoVenta
FROM 
  Empleado e
  JOIN ProyectoEmpleado pe ON e.EmpleadoId = pe.EmpleadoId
  JOIN Proyecto p ON pe.ProyectoId = p.ProyectoId
  JOIN InformacionProyecto ip ON p.ProyectoId = ip.ProyectoId;


