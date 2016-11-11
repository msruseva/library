jQuery ->
	$("#search").autocomplete
		source: $("#search").data("autocomplete-source")