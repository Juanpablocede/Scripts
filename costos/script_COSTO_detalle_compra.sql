SELECT

	soc_dt_bienes.numordcom,
	soc_dt_bienes.estcondat,
	soc_dt_bienes.codart,
	siv_articulo.denart,
	soc_dt_bienes.canart,
	soc_dt_bienes.preuniart,
	soc_dt_bienes.montotart,
	soc_dt_bienes.codestpro1,
	soc_dt_bienes.codestpro2,
	soc_dt_bienes.codestpro3,
	soc_dt_bienes.codestpro4,
	soc_dt_bienes.codestpro5
	
FROM
	soc_dt_bienes,
	siv_articulo
WHERE
	soc_dt_bienes.codart=siv_articulo.codart AND
	estcondat='S'
ORDER BY
	soc_dt_bienes.numordcom

