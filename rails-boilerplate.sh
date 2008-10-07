#!/bin/bash
# Rails Boilerplate Script
# author: nathan verni
# instructions:  drop into the root of a new rails project and run 'sh rails-boilerplate.sh;rm rails boilerplate.sh'






#restful-authentication
./script/plugin install git://github.com/technoweenie/restful-authentication.git
./script/generate authenticated user sessions
 
#jRails
./script/plugin install git://github.com/aaronchi/jrails.git
 
#install shoulda, thanks thoughtbot
script/plugin install git://github.com/thoughtbot/shoulda.git
 
 
#uncomment for rspecrspec
#cd vendor/plugins
#git clone git://github.com/dchelimsky/rspec.git
#git clone git://github.com/dchelimsky/rspec-rails.git
#cd rspec
#git checkout 1.1.4
#cd ../rspec-rails
#git checkout 1.1.4
#cd ..
#rm -rf rspec/.git
#rm -rf rspec-rails/.git
#cd ../../
 
#create the databases
rake db:create:all
rake db:migrate
 
#remove the index.html, create a default home controller, create placeholder application.html.erb layout and stylesheets
mv public/index.html public/info.html
script/generate controller welcome index
touch app/views/layouts/application.html.erb
touch public/stylesheets/screen.css
touch public/stylesheets/reset.css
echo "<%= yield %>" > app/views/layouts/application.html.erb
 
#uncomment the default route
sed -e 's/#\( map.root :controller => \"welcome\".*\)/\1/' config/routes.rb > config/routes.new;
mv config/routes.rb config/routes.old;
mv config/routes.new config/routes.rb;
rm config/routes.old;
 
 
