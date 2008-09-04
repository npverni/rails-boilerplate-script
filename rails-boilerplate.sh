 #!/bin/bash
#restful-authentication
./script/plugin install git://github.com/technoweenie/restful-authentication.git
./script/generate authenticated user sessions

#jRails
./script/plugin install git://github.com/aaronchi/jrails.git  

#rspec
cd vendor/plugins
git clone git://github.com/dchelimsky/rspec.git
git clone git://github.com/dchelimsky/rspec-rails.git
cd rspec
git checkout 1.1.4
cd ../rspec-rails
git checkout 1.1.4
cd ..
rm -rf rspec/.git
rm -rf rspec-rails/.git
cd ../../

#create the databases
rake db:create:all
rake db:migrate

#remove the index.html, create a default home controller, create placeholder application.html.erb layout and stylesheets
mv public/index.html public/info.html
script/generate rspec_controller welcome index
touch app/views/layouts/application.html.erb
touch public/stylesheets/screen.css
touch public/stylesheets/reset.css
echo "<%= yield %>" > app/views/layouts/application.html.erb 

#uncomment the default route
sed -e 's/#\( map.root :controller => \"welcome\".*\)/\1/' config/routes.rb > config/routes.new;
mv config/routes.rb config/routes.old;
mv config/routes.new config/routes.rb;
rm config/routes.old;





