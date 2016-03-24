desc "Refresh Kanye tweets every hour"
task :batch_update => :environment do
  puts "Batch updating signers in google sheets"
  Signer.batch_update
  puts "done."
end