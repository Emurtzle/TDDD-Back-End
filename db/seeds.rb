require 'faker'
clientCount = 50
dueDateCount = 5
i = 0

dueDateNames = [
    "1040",
    "1120S",
    "1065",
    "1041",
    "990",
    "Engagement Letter",
    "8879"
]

for i in 0..clientCount do
    # Get data from Faker

    Faker::Config.locale = "en-US"

    firstName = Faker::Name.first_name
    lastName = Faker::Name.last_name
    address = Faker::Address.full_address
    phone = Faker::PhoneNumber.cell_phone
    email = Faker::Internet.email(firstName)
    fax = "#{Faker::Number.number(3)}-#{Faker::Number.number(3)}-#{Faker::Number.number(3)}"
    dob = Faker::Date.birthday
    occupation = Faker::Job.title
    ssn = Faker::IDNumber.valid
    status = ""

    if (Random.rand(5) > 3)
        status = "complete"
    else
        status="incomplete"
    end

    # create the clients
    client = Client.create(
        firstName: firstName,
        lastName: lastName,
        address: address,
        phone: phone,
        email: email,
        fax: fax,
        dob: dob,
        occupation: occupation,
        ssn: ssn,
        status: status
    )

    # Create due dates for clients
    x = 0

    for name in dueDateNames do

        temp = ""
        if (Random.rand(5) > 3)
            temp = "complete"
        else
            temp="incomplete"
        end

        Duedate.create(
            client_id: client.id,
            name: name,
            description: "The description of the duedate",
            dateDue: "08-11-2019",
            progress: "Due Date Progress",
            status: temp
        )
    end
end