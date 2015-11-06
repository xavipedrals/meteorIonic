Translator = ($translateProvider) ->
    CA_TRANSLATION_INDEX = 0
    ES_TRANSLATION_INDEX = 1
    EN_TRANSLATION_INDEX = 2

    tO = {}

    globalTranslations = {}

    for elem in (value for attr, value of tO)
        for key, v of elem
            globalTranslations[key] = v

    caTranslations = {}
    esTranslations = {}
    enTranslations = {}

    for attr, value of globalTranslations
        if Array.isArray value
            caTranslations[attr] = value[CA_TRANSLATION_INDEX]
            esTranslations[attr] = value[ES_TRANSLATION_INDEX]
            enTranslations[attr] = value[EN_TRANSLATION_INDEX]
        else
            caTranslations[attr] = esTranslations[attr] = enTranslations[attr] = value

    $translateProvider.translations('ca', caTranslations)

    $translateProvider.translations('es', esTranslations)

    $translateProvider.translations('en', enTranslations)

    $translateProvider.preferredLanguage('ca')

    $translateProvider.useSanitizeValueStrategy('sanitize')

    $translateProvider.usePostCompiling(true)

app.config(['$translateProvider', Translator])
