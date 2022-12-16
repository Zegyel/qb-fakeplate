local Translations = {
        plate_changed = "Placa cambiada!",
        plate_removed = "¡Placa eliminada!",
        removing_fake_plate = "Eliminando placa falsa!",
        putting_fake_plate = "Colocando placa falso!",
        you_are_not_near_the_vehicle = "¡No estás cerca del vehículo!",
        ops_something_went_wrong = "Ops, algo deu errado!",
        plate_not_cloned = "¡Huy! Algo salió mal!",
        fake_plate_broker = "¡Se rompió el placa falso!",
        need_tool_kit = "¡Necesitas un juego de herramientas!"
}

if GetConvar('qb_locale', 'en') == 'es' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
