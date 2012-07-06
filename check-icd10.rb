#!/home/admin/.rvm/rubies/ruby-1.8.7-p358/bin/ruby

count = %x! ps ax | grep 3002 | grep -v grep | wc -l !

if (count.to_i == 0 )
  cmd = 'cd /rails/icd10-bootstrap'
  chdir = system(cmd)
  cmd = 'rails s -p 3002 -d'
  start_server = system(cmd)
end

