#define GA_ADS 0
#define GA_CALLDOWN 1
#define GA_MATH 2
#define GA_ILLUSION 3
#define GA_BULLETHELL 4
#define GA_LINES 5

/mob/living/simple_mob/glitch_boss
	name = "CLICK ME!!!"
	desc = "WELCOME TO %location_data% THIS IS YOUR HOME NOW PLEASE INPUT CREDIT CARD CREDENTIALS BELOW"
	tt_desc = "BEST TOOLBAR PROVIDER SINCE 2098"
	icon = 'icons/mob/vore32x64.dmi'
	vis_height = 64
	icon_state = "placeholder"
	icon_living = "placeholder"
	icon_dead = "placeholder_dead"

	faction = "MATH"

	maxHealth = 2000
	health = 2000

	melee_damage_lower = 20
	melee_damage_upper = 40
	attack_armor_pen = 20

	base_attack_cooldown = 2.5 SECONDS

	projectiletype = /obj/item/projectile/energy/slow_orb
	projectilesound = 'sound/weapons/pierce.ogg'

	special_attack_min_range = 0
	special_attack_max_range = 10
	special_attack_cooldown = 20 SECONDS
	ai_holder_type = /datum/ai_holder/simple_mob/ranged/bossmob_special

	var/next_special_attack = GA_ADS
	var/recently_used_attack = GA_MATH
	var/all_special_attacks = list(GA_ADS, /*GA_CALLDOWN, GA_LINES,*/ GA_BULLETHELL)

	//loot_list = list(/obj/item/royal_spider_egg = 100)

/obj/item/projectile/energy/slow_orb
	name = "TROJAN"
	icon_state = "meme"
	damage = 50
	speed = 6
	damage_type = ELECTROCUTE
	agony = 15
	check_armour = "energy"
	armor_penetration = 40

	combustion = TRUE

/mob/living/simple_mob/glitch_boss/proc/make_ads(atom/A)
	var/list/potential_targets = list()
	for(var/mob/living/mob in view(7, src))
		if(mob.client)
			potential_targets += mob
	if(potential_targets.len)
		var/iteration = clamp(potential_targets.len, 1, 4)
		for(var/i = 0, i < iteration, i++)
			if(!(potential_targets.len))
				break
			var/mob/target = pick(potential_targets)
			potential_targets -= target
			if(target.client)
				target.client.create_fake_ad_popup_multiple(/obj/screen/popup/test, 3)

/mob/living/simple_mob/glitch_boss/proc/bombardment(atom/A)
	var/list/potential_targets = ai_holder.list_targets()
	if(potential_targets.len)
		var/iteration = clamp(potential_targets.len, 1, 3)
		for(var/i = 0, i < iteration, i++)
			if(!(potential_targets.len))
				break
			var/mob/target = pick(potential_targets)
			potential_targets -= target
			spawn_bombardments(target)

/mob/living/simple_mob/glitch_boss/proc/spawn_bombardments(atom/target)
	var/list/bomb_range = block(locate(target.x-1, target.y-1, target.z), locate(target.x+1, target.y+1, target.z))
	new /obj/effect/calldown_attack(get_turf(target))
	bomb_range -= get_turf(target)
	for(var/i = 0, i < 4, i++)
		var/turf/T = pick(bomb_range)
		new /obj/effect/calldown_attack(T)
		bomb_range -= T

/mob/living/simple_mob/glitch_boss/proc/bomb_lines(atom/A)
	var/list/potential_targets = ai_holder.list_targets()
	if(potential_targets.len)
		var/iteration = clamp(potential_targets.len, 1, 3)
		for(var/i = 0, i < iteration, i++)
			if(!(potential_targets.len))
				break
			var/mob/target = pick(potential_targets)
			potential_targets -= target
			spawn_lines(target)

/mob/living/simple_mob/glitch_boss/proc/spawn_lines(atom/target)
	var/alignment = rand(1,2)	// 1 for vertical, 2 for horizontal
	var/list/line_range = list()
	var/turf/T = get_turf(target)
	line_range += T
	for(var/i = 1, i <= 7, i++)
		switch(alignment)
			if(1)
				if(T.x-i > 0)
					line_range += locate(T.x-i, T.y, T.z)
				if(T.x+i <= world.maxx)
					line_range += locate(T.x+i, T.y, T.z)
			if(2)
				if(T.y-i > 0)
					line_range += locate(T.x, T.y-i, T.z)
				if(T.y+i <= world.maxy)
					line_range += locate(T.x, T.y+i, T.z)
	for(var/turf/dropspot in line_range)
		new /obj/effect/calldown_attack(dropspot)

/mob/living/simple_mob/glitch_boss/proc/bullethell(atom/A)
	set waitfor = FALSE

	var/sd = dir2angle(dir)
	var/list/offsets = list(45, 45, 20, 10)

	for(var/i = 0, i<4, i++)
		for(var/j = 0, j <4, j++)
			var/obj/item/projectile/energy/slow_orb/shot = new(get_turf(src))
			shot.firer = src
			shot.fire(sd)
			sd += 90
		sd += pick(offsets)
		sleep(20)


/*
/mob/living/simple_mob/glitch_boss/proc/spawn_brood(atom/A)
	set waitfor = FALSE

	var/count = 0
	while(count < brood_per_spawn)
		var/broodling_type = pick(possible_brood_types)
		var/mob/living/simple_mob/animal/giant_spider/broodling = new broodling_type(src.loc)
		broodling.faction = faction
		step_away(broodling, src)
		count++

	visible_message(span("danger", "\The [src] releases brood from its birthing sack!"))

/mob/living/simple_mob/glitch_boss/proc/launch_brood(atom/A)
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

/mob/living/simple_mob/glitch_boss/proc/can_spawn_brood()
	var/brood_amount = 0
	for(var/mob/living/simple_mob/mob in view(7, src))
		if(mob.type in possible_brood_types)
			brood_amount++
	if(brood_amount >= max_brood)
		return FALSE
	return TRUE

/mob/living/simple_mob/glitch_boss/should_special_attack(atom/A)
	if(!can_spawn_brood())
		return FALSE
	return TRUE
*/
/mob/living/simple_mob/glitch_boss/do_special_attack(atom/A)
	. = TRUE
	recently_used_attack = next_special_attack
	switch(next_special_attack)
		if(GA_ADS)
			make_ads(A)
		if(GA_CALLDOWN)
			bombardment(A)
		if(GA_LINES)
			bomb_lines(A)
		if(GA_BULLETHELL)
			bullethell(A)

/datum/ai_holder/simple_mob/ranged/bossmob_special
	wander = FALSE
	pointblank = TRUE
	intelligence_level = AI_SMART
	vision_range = 9

/datum/ai_holder/simple_mob/ranged/bossmob_special/pre_special_attack(atom/A)
	var/mob/living/simple_mob/glitch_boss/GB
	if(istype(holder, /mob/living/simple_mob/glitch_boss))
		GB = holder
	if(GB)
		if(isliving(A) || ismecha(A))
			var/list/possible_attacks = list()
			possible_attacks += GB.all_special_attacks - GB.recently_used_attack
			if(!(possible_attacks.len))
				GB.next_special_attack = GA_BULLETHELL
			else
				GB.next_special_attack = pick(possible_attacks)
		else
			GB.next_special_attack = GA_BULLETHELL