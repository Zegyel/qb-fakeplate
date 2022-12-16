local Translations = {
        plate_changed = "A placa mudou!",
        plate_removed = "Placa Removida!",
        removing_fake_plate = "Remover placa falsa!",
        putting_fake_plate = "Colocando um sinal falso!",
        you_are_not_near_the_vehicle = "Não está perto do veículo!",
        ops_something_went_wrong = "Oops, alguma coisa correu mal!",
        plate_not_cloned = "A placa não é clonada.",
        fake_plate_broker = "A placa falso partiu-se!",
        need_tool_kit = "Precisa de um kit de ferramentas!"
}

if GetConvar('qb_locale', 'en') == 'pt' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
