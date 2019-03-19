# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
ServiceProvider.destroy_all
RegistrationRequest.destroy_all
ServiceResponse.destroy_all
ServiceRequest.destroy_all
Expertise.destroy_all

expertises = ["Reparation & Bricolage", "Services & Loisirs", "Transport & Déménagement"]
expertises.each do |expertise|
  Expertise.create!(description: expertise)
end

def new_service
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.create!(email: "#{first_name}.#{last_name}@mail.com",
                      first_name:first_name,
                      last_name: last_name,
                      password: "#{first_name}.#{last_name}",
                      password_confirmation: "#{first_name}.#{last_name}",
                      phone: Faker::PhoneNumber.phone_number,
                      )
  new_request = ServiceRequest.create!(user_id: user.id,
                  expertise_id: Expertise.all.sample.id,
                  location: Faker::Address.full_address,
                  description: Faker::Lorem.paragraph,
                  price: rand(20..100),
                  )
  number = rand(1..3)
  if number == 2
    new_request.update!(online_payment: true)
  else
    new_request.update!(online_payment: false)
  end

  number = rand(1..3)

  if number == 1
    new_request.update!(answered: true,
      completed:true,
      paid:true)
    service_provider = ServiceProvider.create(email: "#{first_name}.#{last_name}.#{rand(1..1000)}.#{rand(1..1000)}@mail.com",
                      first_name:Faker::Name.first_name,
                      last_name:Faker::Name.last_name,
                      password: "#{first_name}.#{last_name}",
                      password_confirmation: "#{first_name}.#{last_name}",
                      expertise_id: new_request.expertise_id,
                      status: "active",
                      )
    new_response = ServiceResponse.create!(service_provider_id: service_provider.id,
      service_request_id: new_request.id,
      accepted: true,
      completed:true)

    Review.create!(service_response_id: new_response.id,
      rating: rand(2..5),
      comment: Faker::Lorem.paragraph)

  elsif number == 2
    new_request.update!(answered: true, completed: false)
    3.times do
      service_provider = ServiceProvider.create!(email: "#{first_name}.#{last_name}..#{rand(1..1000)}.#{rand(1..1000)}@mail.com",
                      first_name:Faker::Name.first_name,
                      last_name:Faker::Name.last_name,
                      password: "#{first_name}.#{last_name}",
                      password_confirmation: "#{first_name}.#{last_name}",
                      expertise_id: new_request.expertise_id,
                      status: "active",
                      phone: Faker::PhoneNumber.phone_number,
                      )
      new_response = ServiceResponse.create!(service_provider_id: service_provider.id,
        service_request_id: new_request.id,
        accepted: false,
        completed:false)
    end
  else
    new_request.update!(answered:false, completed: false)
  end
end

100.times do
  number = rand(1..10)
  if number == 1
    RegistrationRequest.create!(first_name: Faker::Name.first_name,
                        last_name: Faker::Name.last_name,
                        phone: Faker::PhoneNumber.phone_number,
                        status: "accepted")
  elsif number == 2
    RegistrationRequest.create!(first_name: Faker::Name.first_name,
                        last_name: Faker::Name.last_name,
                        phone: Faker::PhoneNumber.phone_number,
                        status: "pending")
  else
    RegistrationRequest.create!(first_name: Faker::Name.first_name,
                        last_name: Faker::Name.last_name,
                        phone: Faker::PhoneNumber.phone_number,
                        status: "rejected")
  end
end

100.times do
  new_service
end
