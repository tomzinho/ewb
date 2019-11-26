require 'faker'

puts "Removing applies..."
  Apply.destroy_all
puts "Removing resumes database..."
  Resume.destroy_all
puts "Removing candidates database..."
  Candidate.destroy_all
​puts "Removing jobs database..."
  Job.destroy_all
puts "Removing companies database..."
  Company.destroy_all
puts "Removing users database..."
  User.destroy_all


# users -----------------------------------------------------------
puts "Creating new Users"
  10.times do
  User.create!(
    email:        Faker::Internet.email,
    password:     "supersenha",
    password_confirmation: "supersenha",
    first_name:   Faker::Name.name,
    last_name:    Faker::Name.unique.name,
    phonenumber:  Faker::PhoneNumber.phone_number
    )
  User.save!
  end


# candidates -----------------------------------------------------------
puts "Creating new Candidates"
10.times do
  candidate = Candidate.new(
    small_desc:   Faker::Lorem.paragraph_by_chars(number: 30..240, supplemental: false),
    github_link:  Faker::Internet.domain_name(subdomain: true, domain: "github"),
    address:      "#{Faker::Address.street_address}, #{Faker::Address.city}",
    # latitude:   # ?
    # longitude:  # ?
    work_auth:    Faker::Lorem.sentence(word_count: 5),
    # photo:      # cloudinary?
  )
  Candidate.save!
end


# campanies -----------------------------------------------------------
puts "Creating new Companies"
10.times do
  company = Company.new(
    website:       Faker::Internet.url,
    facebook_link: Faker::Internet.domain_name(subdomain: true, domain: "facebook"),
    twitter_link:  Faker::Internet.domain_name(subdomain: true, domain: "twitter"),
    # logo:        # cloudinary?
    # banner:      # cloudinary?
    cnpj:          Faker::Number.number(digits: 14)
    address:       "#{Faker::Address.street_address}, #{Faker::Address.city}",
    # latitude:    # ?
    # longitude:   # ?
    term_of_use:   Faker::Boolean.boolean(true_ratio: 0.2),
    # source:      # ?
    )
    Company.save!
end

# jobs -----------------------------------------------------------
puts "Creating new Jobs"
10.times do
  job = Job.new(
    # company_id:  # ?
    title:         Faker::Lorem.sentence(word_count: 3),
    description:   Faker::Lorem.sentence(word_count: 20),
    location:      "#{Faker::Address.street_address}, #{Faker::Address.city}",
    # latitude:    # ?
    # longitude:   # ?
    availability:  Faker::Boolean.boolean(true_ratio: 0.2)
  )
  Job.save!
end


# resumes -----------------------------------------------------------
puts "Creating new Resumes"
10.times do
  resume = Resume.new(
    # candidate_id:  #?
    resume_language: Faker::Educator.campus,
    description:     Faker::Lorem.sentence(word_count: 20),
    education:       Faker::University.name,
    skills:          Faker::Lorem.sentence(word_count: 10),
    experience:      Faker::Lorem.sentence(word_count: 10),
    # video:         # cloudinary?
  )
  Resume.save!
end

puts 'Finished!'

