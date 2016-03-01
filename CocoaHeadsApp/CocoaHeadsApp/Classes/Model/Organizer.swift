struct Organizer {

    let name: String
    let email: String
    let phone: String?

    init(
        name: String,
        email: String,
        phone: String? = nil
        ) {
            self.name = name
            self.email = email
            self.phone = phone
    }
}

