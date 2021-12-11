/mob/living/simple_mob/glitch_boss
	name = "CLICK ME!!!"
	desc = "WELCOME TO %location_data% THIS IS YOUR HOME NOW PLEASE INPUT CREDIT CARD CREDENTIALS BELOW"
	tt_desc = "BEST TOOLBAR PROVIDER SINCE 2098"
	icon = 'icons/mob/vore32x64.dmi'
	vis_height = 64
	icon_state = "placeholder"
	icon_living = "placeholder"
	icon_dead = "placeholder_dead"

	maxHealth = 800
	health = 800

	melee_damage_lower = 25
	melee_damage_upper = 40
	attack_armor_pen = 15

	projectiletype = /obj/item/projectile/energy/slow_orb
	projectilesound = 'sound/weapons/pierce.ogg'

	special_attack_min_range = 0
	special_attack_max_range = 10
	special_attack_cooldown = 6 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/ranged

	loot_list = list(/obj/item/royal_spider_egg = 100)

/obj/item/projectile/energy/slow_orb
	name = "TROJAN"
	icon_state = "neurotoxin"
	damage = 50
	speed = 3
	damage_type = ELECTROCUTE
	agony = 15
	check_armour = "energy"
	armor_penetration = 40

	combustion = TRUE
/*
/mob/living/simple_mob/animal/giant_spider/broodmother/death(gibbed, deathmessage="falls over and makes its last twitches as its birthing sack bursts!")
	var/count = 0
	while(count < death_brood)
		var/broodling_type = pick(possible_death_brood_types)
		var/mob/living/simple_mob/animal/giant_spider/broodling = new broodling_type(src.loc)
		broodling.faction = faction
		step_away(broodling, src)
		count++

	return ..()

/mob/living/simple_mob/animal/giant_spider/broodmother/proc/spawn_brood(atom/A)
	set waitfor = FALSE

	var/count = 0
	while(count < brood_per_spawn)
		var/broodling_type = pick(possible_brood_types)
		var/mob/living/simple_mob/animal/giant_spider/broodling = new broodling_type(src.loc)
		broodling.faction = faction
		step_away(broodling, src)
		count++

	visible_message(span("danger", "\The [src] releases brood from its birthing sack!"))

/mob/living/simple_mob/animal/giant_spider/broodmother/proc/launch_brood(atom/A)
	set waitfor = FALSE

	var/count = 0
	while(count < brood_per_launch)
		var/broodling_type = pick(possible_brood_types)
		var/mob/living/simple_mob/animal/giant_spider/broodling = new broodling_type(src.loc)
		broodling.faction = faction
		step_away(broodling, src)
		broodling.throw_at(A, 10)
		count++

	visible_message(span("danger", "\The [src] launches brood from the distance!"))

/mob/living/simple_mob/animal/giant_spider/broodmother/proc/can_spawn_brood()
	var/brood_amount = 0
	for(var/mob/living/simple_mob/mob in view(7, src))
		if(mob.type in possible_brood_types)
			brood_amount++
	if(brood_amount >= max_brood)
		return FALSE
	return TRUE

/mob/living/simple_mob/animal/giant_spider/broodmother/should_special_attack(atom/A)
	if(!can_spawn_brood())
		return FALSE
	return TRUE

/mob/living/simple_mob/animal/giant_spider/broodmother/do_special_attack(atom/A)
	. = TRUE
	switch(a_intent)
		if(I_DISARM)
			spawn_brood(A)
		if(I_HURT)
			launch_brood(A)

/datum/ai_holder/simple_mob/intentional/giant_spider_broodmother
	wander = TRUE
	intelligence_level = AI_SMART
	pointblank = FALSE
	firing_lanes = TRUE
	vision_range = 8

/datum/ai_holder/simple_mob/intentional/giant_spider_broodmother/pre_special_attack(atom/A)
	if(isliving(A))
		var/mob/living/target = A

		var/tally = 0
		var/list/potential_targets = list_targets() // Returns list of mobs and certain objects like mechs and turrets.
		for(var/atom/movable/AM in potential_targets)
			if(get_dist(holder, AM) > 4)
				continue
			if(!can_attack(AM))
				continue
			tally++
		if(tally > 1)
			holder.a_intent = I_DISARM
		else if(get_dist(holder, target) > 4)
			holder.a_intent = I_HURT
		else
			holder.a_intent = I_DISARM

	else
		holder.a_intent = I_DISARM
*/