local Translations = {
        plate_changed = "Placa trocada!",
        plate_removed = "Placa Removida!",
        removing_fake_plate = "Removendo placa falsa!",
        putting_fake_plate = "Colocando placa falsa!",
        you_are_not_near_the_vehicle = "Você não está perto do veículo!",
        ops_something_went_wrong = "Ops, algo deu errado!",
        plate_not_cloned = "A placa está clonada!",
        fake_plate_broker = "A placa falsa quebrou!",
        need_tool_kit = "Você precisa de um kit de ferramentas!"
}

if GetConvar('qb_locale', 'en') == 'pt-br' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
