enum State: String {
    case AC = "Acre"
    case AL = "Alagoas"
    case AP = "Amapá"
    case AM = "Amazonas"
    case BA = "Bahia"
    case CE = "Ceará"
    case DF = "Distrito Federal"
    case ES = "Espírito Santo"
    case GO = "Goiás"
    case MA = "Maranhão"
    case MT = "Mato Grosso"
    case MS = "Mato Grosso do Sul"
    case MG = "Minas Gerais"
    case PA = "Pará"
    case PB = "Paraíba"
    case PR = "Paraná"
    case PE = "Pernambuco"
    case PI = "Piauí"
    case RJ = "Rio de Janeiro"
    case RN = "Rio Grande do Norte"
    case RS = "Rio Grande do Sul"
    case RO = "Rondônia"
    case RR = "Roraima"
    case SC = "Santa Catarina"
    case SP = "São Paulo"
    case SE = "Sergipe"
    case TO = "Tocantins"

    var name: String {
        return self.rawValue
    }
}
