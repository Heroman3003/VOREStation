//Virgo 3b

//Atmosphere properties
#define VIRGO3B_ONE_ATMOSPHERE	82.4 //kPa
#define VIRGO3B_AVG_TEMP	234 //kelvin

#define VIRGO3B_PER_N2		0.16 //percent
#define VIRGO3B_PER_O2		0.00
#define VIRGO3B_PER_N2O		0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define VIRGO3B_PER_CO2		0.12
#define VIRGO3B_PER_PHORON	0.72

//Math only beyond this point
#define VIRGO3B_MOL_PER_TURF	(VIRGO3B_ONE_ATMOSPHERE*CELL_VOLUME/(VIRGO3B_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define VIRGO3B_MOL_N2			(VIRGO3B_MOL_PER_TURF * VIRGO3B_PER_N2)
#define VIRGO3B_MOL_O2			(VIRGO3B_MOL_PER_TURF * VIRGO3B_PER_O2)
#define VIRGO3B_MOL_N2O			(VIRGO3B_MOL_PER_TURF * VIRGO3B_PER_N2O)
#define VIRGO3B_MOL_CO2			(VIRGO3B_MOL_PER_TURF * VIRGO3B_PER_CO2)
#define VIRGO3B_MOL_PHORON		(VIRGO3B_MOL_PER_TURF * VIRGO3B_PER_PHORON)

//Turfmakers
#define VIRGO3B_SET_ATMOS	nitrogen=VIRGO3B_MOL_N2;oxygen=VIRGO3B_MOL_O2;carbon_dioxide=VIRGO3B_MOL_CO2;phoron=VIRGO3B_MOL_PHORON;temperature=VIRGO3B_AVG_TEMP
#define VIRGO3B_TURF_CREATE(x)	x/virgo3b/nitrogen=VIRGO3B_MOL_N2;x/virgo3b/oxygen=VIRGO3B_MOL_O2;x/virgo3b/carbon_dioxide=VIRGO3B_MOL_CO2;x/virgo3b/phoron=VIRGO3B_MOL_PHORON;x/virgo3b/temperature=VIRGO3B_AVG_TEMP;x/virgo3b/outdoors=TRUE;x/virgo3b/update_graphic(list/graphic_add = null, list/graphic_remove = null) return 0
#define VIRGO3B_TURF_CREATE_UN(x)	x/virgo3b/nitrogen=VIRGO3B_MOL_N2;x/virgo3b/oxygen=VIRGO3B_MOL_O2;x/virgo3b/carbon_dioxide=VIRGO3B_MOL_CO2;x/virgo3b/phoron=VIRGO3B_MOL_PHORON;x/virgo3b/temperature=VIRGO3B_AVG_TEMP

// This is a wall you surround the area of your "planet" with, that makes the atmosphere inside stay within bounds, even if canisters
// are opened or other strange things occur.
/turf/unsimulated/wall/planetary/virgo3b
	name = "facility wall"
	desc = "An eight-meter tall carbyne wall. For when the wildlife on your planet is mostly militant megacorps."
	alpha = 0xFF
	VIRGO3B_SET_ATMOS

//Virgo 5

//Atmosphere properties
#define VIRGO5_ONE_ATMOSPHERE	112.7 //kPa
#define VIRGO5_AVG_TEMP	223 //kelvin

#define VIRGO5_PER_N2		0.57 //percent
#define VIRGO5_PER_O2		0.14
#define VIRGO5_PER_N2O		0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define VIRGO5_PER_CO2		0.29
#define VIRGO5_PER_PHORON	0.00

//Math only beyond this point
#define VIRGO5_MOL_PER_TURF	(VIRGO5_ONE_ATMOSPHERE*CELL_VOLUME/(VIRGO5_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define VIRGO5_MOL_N2			(VIRGO5_MOL_PER_TURF * VIRGO5_PER_N2)
#define VIRGO5_MOL_O2			(VIRGO5_MOL_PER_TURF * VIRGO5_PER_O2)
#define VIRGO5_MOL_N2O			(VIRGO5_MOL_PER_TURF * VIRGO5_PER_N2O)
#define VIRGO5_MOL_CO2			(VIRGO5_MOL_PER_TURF * VIRGO5_PER_CO2)
#define VIRGO5_MOL_PHORON		(VIRGO5_MOL_PER_TURF * VIRGO5_PER_PHORON)

//Turfmakers
#define VIRGO5_SET_ATMOS	nitrogen=VIRGO5_MOL_N2;oxygen=VIRGO5_MOL_O2;carbon_dioxide=VIRGO5_MOL_CO2;phoron=VIRGO5_MOL_PHORON;temperature=VIRGO5_AVG_TEMP
#define VIRGO5_TURF_CREATE(x)	x/virgo5/nitrogen=VIRGO5_MOL_N2;x/virgo5/oxygen=VIRGO5_MOL_O2;x/virgo5/carbon_dioxide=VIRGO5_MOL_CO2;x/virgo5/phoron=VIRGO5_MOL_PHORON;x/virgo5/temperature=VIRGO5_AVG_TEMP;x/virgo5/outdoors=TRUE
#define VIRGO5_TURF_CREATE_UN(x)	x/virgo5/nitrogen=VIRGO5_MOL_N2;x/virgo5/oxygen=VIRGO5_MOL_O2;x/virgo5/carbon_dioxide=VIRGO5_MOL_CO2;x/virgo5/phoron=VIRGO5_MOL_PHORON;x/virgo5/temperature=VIRGO5_AVG_TEMP

/turf/unsimulated/wall/planetary/virgo5
	name = "facility wall"
	desc = "An eight-meter tall carbyne wall. For when the wildlife on your planet is mostly militant megacorps."
	alpha = 0xFF
	VIRGO5_SET_ATMOS