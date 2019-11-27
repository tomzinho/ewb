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


# users ----------------------------------------------------------------
puts "Creating new Users"
  10.times do
  User.create!(
    email:        Faker::Internet.email,
    password:     "supersenha",
    password_confirmation: "supersenha",
    # first_name:   Faker::Name.name,
    # last_name:    Faker::Name.unique.name,
    # phonenumber:  Faker::PhoneNumber.phone_number
    )
  end

# roles -----------------------------------------------------------------
puts "Assigning roles"
candidates = User.first(5)
companies = User.last(5)

candidates.each do |candidate|
  candidate.role = 0
  candidate.save
end

companies.each do |company|
  company.role = 1
  company.save
end


# candidates ------------------------------------------------------------
w_auths = %w(br us can eu)

puts "Describing the candidates"

candidates.each do |candidate|
  candidate.small_desc:   Faker::Lorem.paragraph(sentence_count: 20)
  candidate.github_link:  "github.com/#{Faker::Internet.username}"
  candidate.address:      Faker::Address.street_address
  candidate.work_auth:    w_auths.sample
  candidate.save!
end


# campanies -----------------------------------------------------------
puts "Describing the Companies"

companies.eachs do |company|
  name = Faker::Company.name
  company.website:       Faker::Internet.url,
  company.facebook_link: "www.facebook.com/#{name}"
  company.twitter_link:  "https://twitter.com//#{name}"
  company.cnpj:          Faker::Number.number(digits: 14)
  company.address:       Faker::Address.street_address
  # company.logo:        # cloudinary?
  # company.banner:      # cloudinary?
  company.term_of_use:   true
  company.source:        ["friends", "Google", "Linkedin", "Facebook"].sample
  company.save!
end

# jobs -----------------------------------------------------------
puts "Creating new Jobs"

10.times do
  company_job =      companies.sample
  Job.create!(
  company_id:    company_job.id
  title:         Faker::Lorem.sentence(word_count: 3)
  description:   Faker::Lorem.sentence(word_count: 20)
  location:      company_job.address
  status:        true
  )
end


# resumes -----------------------------------------------------------
puts "Creating new Resumes"

candidate.each do |candidate|
  Resume.create!(
    candidate_id:    candidate.id
    resume_language: "english"
    description:     Faker::Lorem.sentence(word_count: 20)
    education:       Faker::University.name
    skills:          "Communication, Teamwork, Problem solving, Initiative and enterprise, Planning and organising, Self-management, Learning"
    experience:      Faker::Lorem.sentence(word_count: 10)
    # video:         # cloudinary?
  )
end

puts 'Finished!'


