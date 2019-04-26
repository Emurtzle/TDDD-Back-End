require 'faker'
count = 50
i = 0

for i in 0..count do
    # Get data from Faker

    Faker::Config.locale = "en-US"

    firstName = Faker::Name.first_name
    lastName = Faker::Name.last_name
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
        phone: phone,
        email: email,
        fax: fax,
        dob: dob,
        occupation: occupation,
        ssn: ssn,
        status: status
        )
end