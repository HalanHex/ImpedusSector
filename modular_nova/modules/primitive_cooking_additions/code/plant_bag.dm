/datum/atom_skin/plant_bag
	abstract_type = /datum/atom_skin/plant_bag

/datum/atom_skin/plant_bag/original
	preview_name = "Original"
	new_icon = 'icons/obj/service/hydroponics/equipment.dmi'
	new_icon_state = "plantbag"
	new_worn_icon = 'icons/mob/clothing/belt.dmi'

/datum/atom_skin/plant_bag/linen
	preview_name = "Linen"
	new_icon = 'modular_nova/modules/primitive_cooking_additions/icons/plant_bag.dmi'
	new_icon_state = "plantbag_primitive"
	new_worn_icon = 'modular_nova/modules/primitive_cooking_additions/icons/plant_bag_worn.dmi'

/obj/item/storage/bag/plants

/obj/item/storage/bag/plants/setup_reskins()
	AddComponent(/datum/component/reskinable_item, /datum/atom_skin/plant_bag)

/// Simple helper to reskin this item into its primitive variant.
/obj/item/storage/bag/plants/proc/make_primitive()
	AddComponent(/datum/component/reskinable_item, /datum/atom_skin/plant_bag, initial_skin = "Linen", blacklisted_subtypes = list(/datum/atom_skin/plant_bag/original))

/// A helper for the primitive variant, for mappers.
/obj/item/storage/bag/plants/primitive
	icon = 'modular_nova/modules/primitive_cooking_additions/icons/plant_bag.dmi'
	icon_state = "plantbag_primitive"
	worn_icon = 'modular_nova/modules/primitive_cooking_additions/icons/plant_bag_worn.dmi'
	worn_icon_state = "plantbag_primitive"


/obj/item/stack/sheet/cloth/on_item_crafted(mob/builder, atom/created)
	if(!istype(created, /obj/item/storage/bag/plants))
		return

	if(!isprimitivedemihuman(builder) && !isashwalker(builder))
		return

	var/obj/item/storage/bag/plants/bag = created

	bag.make_primitive()

/obj/item/storage/bag/plants/primitive/setup_reskins()
	make_primitive()

/obj/item/storage/bag/plants/portaseeder

/obj/item/storage/bag/plants/portaseeder/setup_reskins()
	return

