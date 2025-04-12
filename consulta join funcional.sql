consulta join funcional

SELECT Carrera.Nombre,Profesor.Nombre
FROM Carrera
JOIN Profesor
 ON Profesor.ProfesorId = Carrera.CarreraId;

CREATE TABLE Profesor(
    ProfesorId INT AUTO_INCREMENT,
    Nombre VARCHAR (50),
    PRIMARY KEY (ProfesorId)
);