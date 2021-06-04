/datum/transformation_datum
	var/species = "Human"
	var/custom_species_name

	var/gender_physical = "male"
	var/gender_identity = "male"

	var/list/markings = list()

	var/body_color = "#FFFFFF"
	var/skin_tone = 30
	var/eye_color = "#000000"

	var/hair_style = "Bald"
	var/hair_color = "#222222"

	var/gradient_style = "None"
	var/gradient_color = "#222222"

	var/facial_hair_style = "Shaved"
	var/facial_hair_color = "#222222"

	var/ears_style
	var/ears_color_primary = "#222222"
	var/ears_color_secondary = "#222222"
	var/ears_color_tertiary = "#222222"

	var/tail_style
	var/tail_color_primary = "#222222"
	var/tail_color_secondary = "#222222"
	var/tail_color_tertiary = "#222222"

	var/wing_style
	var/wing_color_primary = "#222222"
	var/wing_color_secondary = "#222222"
	var/wing_color_tertiary = "#222222"

	var/scale = 100

/datum/transformation_datum/proc/apply_transformation(var/mob/living/carbon/human/victim)

	victim.set_species(species)

	victim.custom_species = custom_species_name

	victim.gender = gender_physical
	victim.identifying_gender = gender_identity


	for(var/obj/item/organ/external/O in victim.organs_by_name)
		if(istype(O))
			O.markings.Cut()
	for(var/M in markings)
		var/datum/sprite_accessory/marking/mark_datum = body_marking_styles_list[M]
		var/mark_color = "[markings[M]]"

		for(var/BP in mark_datum.body_parts)
			var/obj/item/organ/external/O = victim.organs_by_name[BP]
			if(O)
				O.markings[M] = list("color" = mark_color, "datum" = mark_datum)

	victim.r_skin = hex2num(copytext(body_color, 2, 4))
	victim.g_skin = hex2num(copytext(body_color, 4, 6))
	victim.b_skin = hex2num(copytext(body_color, 6, 8))

	victim.s_tone = skin_tone

	victim.r_eyes = hex2num(copytext(eye_color, 2, 4))
	victim.g_eyes = hex2num(copytext(eye_color, 4, 6))
	victim.b_eyes = hex2num(copytext(eye_color, 6, 8))

	victim.h_style = hair_style
	victim.r_hair = hex2num(copytext(hair_color, 2, 4))
	victim.g_hair = hex2num(copytext(hair_color, 4, 6))
	victim.b_hair = hex2num(copytext(hair_color, 6, 8))

	victim.grad_style = gradient_style
	victim.r_grad = hex2num(copytext(gradient_color, 2, 4))
	victim.g_grad = hex2num(copytext(gradient_color, 4, 6))
	victim.b_grad = hex2num(copytext(gradient_color, 6, 8))

	victim.f_style = facial_hair_style
	victim.r_facial = hex2num(copytext(facial_hair_color, 2, 4))
	victim.g_facial = hex2num(copytext(facial_hair_color, 4, 6))
	victim.b_facial = hex2num(copytext(facial_hair_color, 6, 8))

	victim.ear_style = ear_styles_list[ears_style]
	victim.r_ears = hex2num(copytext(ears_color_primary, 2, 4))
	victim.g_ears = hex2num(copytext(ears_color_primary, 4, 6))
	victim.b_ears = hex2num(copytext(ears_color_primary, 6, 8))
	victim.r_ears2 = hex2num(copytext(ears_color_secondary, 2, 4))
	victim.g_ears2 = hex2num(copytext(ears_color_secondary, 4, 6))
	victim.b_ears2 = hex2num(copytext(ears_color_secondary, 6, 8))
	victim.r_ears3 = hex2num(copytext(ears_color_tertiary, 2, 4))
	victim.g_ears3 = hex2num(copytext(ears_color_tertiary, 4, 6))
	victim.b_ears3 = hex2num(copytext(ears_color_tertiary, 6, 8))

	victim.tail_style = tail_styles_list[tail_style]
	victim.r_tail = hex2num(copytext(tail_color_primary, 2, 4))
	victim.g_tail = hex2num(copytext(tail_color_primary, 4, 6))
	victim.b_tail = hex2num(copytext(tail_color_primary, 6, 8))
	victim.r_tail2 = hex2num(copytext(tail_color_secondary, 2, 4))
	victim.g_tail2 = hex2num(copytext(tail_color_secondary, 4, 6))
	victim.b_tail2 = hex2num(copytext(tail_color_secondary, 6, 8))
	victim.r_tail3 = hex2num(copytext(tail_color_tertiary, 2, 4))
	victim.g_tail3 = hex2num(copytext(tail_color_tertiary, 4, 6))
	victim.b_tail3 = hex2num(copytext(tail_color_tertiary, 6, 8))

	victim.wing_style = wing_styles_list[wing_style]
	victim.r_wing = hex2num(copytext(wing_color_primary, 2, 4))
	victim.g_wing = hex2num(copytext(wing_color_primary, 4, 6))
	victim.b_wing = hex2num(copytext(wing_color_primary, 6, 8))
	victim.r_wing2 = hex2num(copytext(wing_color_secondary, 2, 4))
	victim.g_wing2 = hex2num(copytext(wing_color_secondary, 4, 6))
	victim.b_wing2 = hex2num(copytext(wing_color_secondary, 6, 8))
	victim.r_wing3 = hex2num(copytext(wing_color_tertiary, 2, 4))
	victim.g_wing3 = hex2num(copytext(wing_color_tertiary, 4, 6))
	victim.b_wing3 = hex2num(copytext(wing_color_tertiary, 6, 8))

	victim.resize(scale, animate = FALSE)

	victim.force_update_limbs()
	victim.update_icons_body()
	victim.update_hair()
	victim.update_eyes()
	victim.update_dna()
	victim.update_icon()

/datum/transformation_datum/preset
	species = "Skrell"
	custom_species_name = "Frogg-o"

	gender_physical = "female"
	gender_identity = "plural"

	markings = list("Belly and butt" = "#FF00FF")

	body_color = "#00EEFF"
	skin_tone = 255
	eye_color = "#FF00FF"

	hair_style = "Crescent-Moon"
	hair_color = "#FFAAAA"

	facial_hair_style = "Shaved"

	wing_style = /datum/sprite_accessory/wing/featheredlarge
	wing_color_primary = "#FFFF99"

	scale = 1.5

/datum/transformation_datum/proc/import_pref_settings(var/datum/preferences/prefs)
	if(!prefs)
		return

	species = prefs.species
	custom_species_name = prefs.custom_species

	gender_physical = prefs.biological_gender
	gender_identity = prefs.identifying_gender

	markings = Copy(prefs.body_markings)

	body_color = "#[num2hex(prefs.r_skin)][num2hex(prefs.g_skin)][num2hex(prefs.b_skin)]"
	skin_tone = prefs.s_tone
	eye_color = "#[num2hex(prefs.r_eyes)][num2hex(prefs.g_eyes)][num2hex(prefs.b_eyes)]"

	hair_style = prefs.h_style
	hair_color = "#[num2hex(prefs.r_hair)][num2hex(prefs.g_hair)][num2hex(prefs.b_hair)]"

	var/gradient_style = "None"
	var/gradient_color = "#222222"

	var/facial_hair_style = "Shaved"
	var/facial_hair_color = "#222222"

	var/ears_style
	var/ears_color_primary = "#222222"
	var/ears_color_secondary = "#222222"
	var/ears_color_tertiary = "#222222"

	var/tail_style
	var/tail_color_primary = "#222222"
	var/tail_color_secondary = "#222222"
	var/tail_color_tertiary = "#222222"

	var/wing_style
	var/wing_color_primary = "#222222"
	var/wing_color_secondary = "#222222"
	var/wing_color_tertiary = "#222222"