if Rails.env.production?
  puts "start running Carrier wave init............................................................"
    CarrierWave.configure do |config|
        config.fog_credentials = {
        # Configuration for Amazon S3
        #user name: railsbaseimagehandler
          :provider              => 'AWS',
          :aws_access_key_id     => ENV['S3_KEY'],
          :aws_secret_access_key => ENV['S3_SECRET'],
          :region                => ENV['REGION']                
        }
        config.fog_directory     =  ENV['S3_BUCKET']
    end
  puts "END running Carrier wave init............................................................"
end


