if Rails.env.production?
  puts "start running Carrier wave init............................................................"
    CarrierWave.configure do |config|
        config.fog_credentials = {
        # Configuration for Amazon S3
        #user name: railsbaseimagehandler
          :provider              => 'AWS',
          :aws_access_key_id     => 'AKIAIFGNK4GWMQBYVZUA',
          :aws_secret_access_key => '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'
        }
        config.fog_directory     =  "railsbaseimagesdev"
    end
  puts "END running Carrier wave init............................................................"
end


