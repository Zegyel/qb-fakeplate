local Translations = {
        plate_changed = "Plate changed!",
        plate_removed = "Plate removed!",
        removing_fake_plate = "Removing fake plate",
        putting_fake_plate = "Putting fake plate",
        you_are_not_near_the_vehicle = "You are not near the vehicle!",
        ops_something_went_wrong = "Ops, Something went wrong!",
        plate_not_cloned = "The plate is not cloned!",
        fake_plate_broker = "Fake plate broke!",
        need_tool_kit = "You need a Tool Kit!"
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
