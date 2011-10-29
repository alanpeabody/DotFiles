Rnavcommand factory spec/factories -glob=* -suffix=_factory.rb -default=model()
Rnavcommand scss app/stylesheets -glob=**/* -suffix=.scss
Rnavcommand builder app/builders -glob=* -suffix=_builder.rb -default=model()
Rnavcommand dmigration db/data -glob=* -prefix=  -suffix=.rb
Rnavcommand enum app/enums -glob=* -suffix=.rb
Rnavcommand variable app/models/system_variables/ -glob=* -suffix=.rb
Rnavcommand feature features -glob=**/* -suffix=.feature
Rnavcommand step features/step_definitions -glob=* -suffix=_steps.rb
Rnavcommand Bmodel public/javascripts/application/models -glob=* -suffix=.js
Rnavcommand Bcollection public/javascripts/application/collections -glob=* -suffix=.js
Rnavcommand Brouter public/javascripts/application/routers -glob=* -suffix=.js
Rnavcommand Bview public/javascripts/application/views -glob=**/* -suffix=.js
Rnavcommand jasmine spec/javascripts -glob=**/* -suffix=_spec.js
Rnavcommand Bunittest spec/javascripts/models spec/javascripts/collections -glob=* -suffix=_spec.js
Rnavcommand Bfunctionaltest spec/javascripts/routers/ -glob=* -suffix=_spec.js
