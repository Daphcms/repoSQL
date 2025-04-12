consulta join funcional

SELECT Carrera.Nombre,Profesor.Nombre
FROM Carrera
JOIN Profesor
 ON Profesor.ProfesorId = Carrera.CarreraId;
