Rnavcommand factory spec/factories -glob=* -suffix=_factory.rb -default=model()
Rnavcommand scss app/stylesheets -glob=**/* -suffix=.scss
Rnavcommand builder app/builders -glob=* -suffix=_builder.rb -default=model()
Rnavcommand dmigration db/data -glob=* -prefix=  -suffix=.rb
Rnavcommand enum app/enums -glob=* -suffix=.rb
Rnavcommand variable app/models/system_variables/ -glob=* -suffix=.rb
