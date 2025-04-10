/* ------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--                                                                               --
--                              QUERIES TABLE                                    --
--                                                                               --
-----------------------------------------------------------------------------------
---------------------------------------------------------------------------------*/

-- QUERY CLASE 1
SELECT
  persona_id,
  nombre_completo,
  email,
  clase_id,
  promocion,
  campus,
  vertical,
  modalidad,
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_HLF') AS "Proyecto_HLF",
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_EDA') AS "Proyecto_EDA",
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_BBDD') AS "Proyecto_BBDD",
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_ML') AS "Proyecto_ML",
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_Deployment') AS "Proyecto_Deployment"  
FROM 
	(select 
		t1.persona_id, 
		t2.nombre_completo, 
		t2.email, 
		t6.clase_id,
		t7.nombre as promocion, 
		t8.nombre as campus, 
		t9.nombre as vertical, 
		t10.nombre as modalidad,
		t4.nombre as proyecto,
		t1.nota
	from 
		calificaciones t1
	JOIN personas t2 ON t1.persona_id = t2.persona_id
	JOIN clase_proyectos t3 ON t1.proyectoclase_id = t3.proyectoclase_id
	JOIN proyectos t4 ON t4.proyecto_id = t3.proyecto_id
	JOIN clase_personas t5 ON t5.persona_id = t2.persona_id
	JOIN clases t6 ON t6.clase_id = t5.clase_id
	JOIN promocion t7 ON t7.promocion_id = t6.promocion_id
	JOIN campus t8 ON t8.campus_id = t6.campus_id
	JOIN vertical t9 ON t9.vertical_id = t6.vertical_id
	JOIN modalidad t10 ON t10.modalidad_id = t6.modalidad_id
	WHERE t5.clase_id = 1) notas_clase1
GROUP BY persona_id, nombre_completo, email, clase_id, promocion, campus, vertical, modalidad
ORDER BY persona_id;

-- QUERY CLASE 2
SELECT
  persona_id,
  nombre_completo,
  email,
  clase_id,
  promocion,
  campus,
  vertical,
  modalidad,
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_HLF') AS "Proyecto_HLF",
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_EDA') AS "Proyecto_EDA",
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_BBDD') AS "Proyecto_BBDD",
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_ML') AS "Proyecto_ML",
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_Deployment') AS "Proyecto_Deployment"  
FROM 
	(select 
		t1.persona_id, 
		t2.nombre_completo, 
		t2.email, 
		t6.clase_id,
		t7.nombre as promocion, 
		t8.nombre as campus, 
		t9.nombre as vertical, 
		t10.nombre as modalidad,
		t4.nombre as proyecto,
		t1.nota
	from 
		calificaciones t1
	JOIN personas t2 ON t1.persona_id = t2.persona_id
	JOIN clase_proyectos t3 ON t1.proyectoclase_id = t3.proyectoclase_id
	JOIN proyectos t4 ON t4.proyecto_id = t3.proyecto_id
	JOIN clase_personas t5 ON t5.persona_id = t2.persona_id
	JOIN clases t6 ON t6.clase_id = t5.clase_id
	JOIN promocion t7 ON t7.promocion_id = t6.promocion_id
	JOIN campus t8 ON t8.campus_id = t6.campus_id
	JOIN vertical t9 ON t9.vertical_id = t6.vertical_id
	JOIN modalidad t10 ON t10.modalidad_id = t6.modalidad_id
	WHERE t5.clase_id = 2) notas_clase2
GROUP BY persona_id, nombre_completo, email, clase_id, promocion, campus, vertical, modalidad
ORDER BY persona_id;

-- QUERY CLASE 3
SELECT
  persona_id,
  nombre_completo,
  email,
  clase_id,
  promocion,
  campus,
  vertical,
  modalidad,
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_WebDev') AS "Proyecto_WebDev",
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_FrontEnd') AS "Proyecto_FrontEnd",
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_Backend') AS "Proyecto_Backend",
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_React') AS "Proyecto_React",
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_FullSatck') AS "Proyecto_FullSatck"  
FROM 
	(select 
		t1.persona_id, 
		t2.nombre_completo, 
		t2.email, 
		t6.clase_id,
		t7.nombre as promocion, 
		t8.nombre as campus, 
		t9.nombre as vertical, 
		t10.nombre as modalidad,
		t4.nombre as proyecto,
		t1.nota
	from 
		calificaciones t1
	JOIN personas t2 ON t1.persona_id = t2.persona_id
	JOIN clase_proyectos t3 ON t1.proyectoclase_id = t3.proyectoclase_id
	JOIN proyectos t4 ON t4.proyecto_id = t3.proyecto_id
	JOIN clase_personas t5 ON t5.persona_id = t2.persona_id
	JOIN clases t6 ON t6.clase_id = t5.clase_id
	JOIN promocion t7 ON t7.promocion_id = t6.promocion_id
	JOIN campus t8 ON t8.campus_id = t6.campus_id
	JOIN vertical t9 ON t9.vertical_id = t6.vertical_id
	JOIN modalidad t10 ON t10.modalidad_id = t6.modalidad_id
	WHERE t5.clase_id = 3) notas_clase3
GROUP BY persona_id, nombre_completo, email, clase_id, promocion, campus, vertical, modalidad
ORDER BY persona_id;

-- QUERY CLASE 4
SELECT
  persona_id,
  nombre_completo,
  email,
  clase_id,
  promocion,
  campus,
  vertical,
  modalidad,
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_WebDev') AS "Proyecto_WebDev",
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_FrontEnd') AS "Proyecto_FrontEnd",
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_Backend') AS "Proyecto_Backend",
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_React') AS "Proyecto_React",
  MAX(nota) FILTER (WHERE proyecto = 'Proyecto_FullSatck') AS "Proyecto_FullSatck"  
FROM 
	(select 
		t1.persona_id, 
		t2.nombre_completo, 
		t2.email, 
		t6.clase_id,
		t7.nombre as promocion, 
		t8.nombre as campus, 
		t9.nombre as vertical, 
		t10.nombre as modalidad,
		t4.nombre as proyecto,
		t1.nota
	from 
		calificaciones t1
	JOIN personas t2 ON t1.persona_id = t2.persona_id
	JOIN clase_proyectos t3 ON t1.proyectoclase_id = t3.proyectoclase_id
	JOIN proyectos t4 ON t4.proyecto_id = t3.proyecto_id
	JOIN clase_personas t5 ON t5.persona_id = t2.persona_id
	JOIN clases t6 ON t6.clase_id = t5.clase_id
	JOIN promocion t7 ON t7.promocion_id = t6.promocion_id
	JOIN campus t8 ON t8.campus_id = t6.campus_id
	JOIN vertical t9 ON t9.vertical_id = t6.vertical_id
	JOIN modalidad t10 ON t10.modalidad_id = t6.modalidad_id
	WHERE t5.clase_id = 5) notas_clase4
GROUP BY persona_id, nombre_completo, email, clase_id, promocion, campus, vertical, modalidad
ORDER BY persona_id;

--Query 5 Detectar la promoción con menos alumnos, la vertical con menos alumnos de ésta, extraer el teléfono de cada uno de sus profesores
SELECT DISTINCT 
personas.nombre_completo, 
personas.telefono, 
clases.vertical_id
FROM 
	clase_personas
JOIN clases ON clase_personas.clase_id = clases.clase_id
JOIN personas ON clase_personas.persona_id = personas.persona_id
WHERE 
clase_personas.rol_id = (SELECT rol_id FROM rol WHERE nombre = 'ASISTENTE PROFESOR')
AND 
clases.promocion_id = (SELECT promocion_id FROM (
						SELECT clases.promocion_id, 
						COUNT(DISTINCT clase_personas.persona_id) AS total_alumnos
						FROM clase_personas
						JOIN clases ON clase_personas.clase_id = clases.clase_id
						WHERE clase_personas.rol_id = (SELECT rol_id FROM rol WHERE nombre = 'ESTUDIANTE') -- rol alumno
						GROUP BY clases.promocion_id
						ORDER BY total_alumnos ASC
						LIMIT 1));

--Query 6
SELECT t1.nombre_completo, COUNT(t2.persona_id) FROM profesores t1
LEFT JOIN alumnos t2
on t1.clase_id = t2.clase_id
--where rol <> 'PROFESOR'
GROUP BY t1.nombre_completo

--Query 7
SELECT prof.nombre_completo, COUNT(DISTINCT alum.persona_id) AS total_aprobados
FROM clase_personas as cp_prof
JOIN Clases c ON cp_prof.clase_id = c.clase_id
JOIN clase_personas cp_alum ON cp_alum.clase_id = c.clase_id
JOIN clase_proyectos cp ON cp.clase_id = c.clase_id
JOIN CALIFICACIONES cal ON cal.proyectoclase_id = cp.proyectoclase_id AND cal.persona_id = cp_alum.persona_id
JOIN PERSONAS prof ON cp_prof.persona_id = prof.persona_id
JOIN PERSONAS alum ON cp_alum.persona_id = alum.persona_id
WHERE cp_prof.rol_id IN (SELECT rol_id FROM ROL WHERE nombre IN ('PROFESOR', 'ASISTENTE PROFESOR'))
AND cp_alum.rol_id = (SELECT rol_id FROM ROL WHERE nombre = 'ESTUDIANTE')
AND cal.nota = 'Apto'
GROUP BY prof.persona_id
HAVING 	COUNT(DISTINCT alum.persona_id) = (SELECT  MAX(CD) FROM (SELECT COUNT(DISTINCT alum.persona_id) CD
FROM clase_personas as cp_prof
JOIN Clases c ON cp_prof.clase_id = c.clase_id
JOIN clase_personas cp_alum ON cp_alum.clase_id = c.clase_id
JOIN clase_proyectos cp ON cp.clase_id = c.clase_id
JOIN CALIFICACIONES cal ON cal.proyectoclase_id = cp.proyectoclase_id AND cal.persona_id = cp_alum.persona_id
JOIN PERSONAS prof ON cp_prof.persona_id = prof.persona_id
JOIN PERSONAS alum ON cp_alum.persona_id = alum.persona_id
WHERE cp_prof.rol_id IN (SELECT rol_id FROM ROL WHERE nombre IN ('PROFESOR', 'ASISTENTE PROFESOR'))
AND cp_alum.rol_id = (SELECT rol_id FROM ROL WHERE nombre = 'ESTUDIANTE')
AND cal.nota = 'Apto'
GROUP BY prof.persona_id) AA
)









