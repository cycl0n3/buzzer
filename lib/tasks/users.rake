namespace :users do

  desc 'Create folder for all users'
  task create_folder: :environment do
    User.all.each do |user|
      dir = "#{Rails.root}/public/#{user.uuid}"
      FileUtils.makedirs(dir) unless File.exist?(dir)
    end
  end

end
