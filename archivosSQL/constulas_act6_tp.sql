-- ejercicio 6a)
SELECT
    Reclamo.nro_reclamo,
    Material.cod_material,
    utiliza.cantidad
FROM
    Reclamo
LEFT JOIN
    utiliza ON Reclamo.nro_reclamo = utiliza.nro_reclamo
LEFT JOIN
    Material ON utiliza.cod_material = Material.cod_material
ORDER BY
    Reclamo.nro_reclamo;

    
-- ejercicio 6b)
SELECT DISTINCT
    R1.id_usuario
FROM
    Reclamo R1
JOIN
    Reclamo R2 ON R1.id_usuario = R2.id_usuario 
WHERE
    R1.nro_reclamo <> R2.nro_reclamo;   

    
-- ejercicio6c)
SELECT DISTINCT
    M1.nro_reclamo 
FROM
    mantenimiento M1
JOIN
    mantenimiento M2 
    ON M1.nro_reclamo = M2.nro_reclamo 
WHERE
    M1.id_usuario <> M2.id_usuario;     
    