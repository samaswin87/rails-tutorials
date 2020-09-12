# 1 - Rails Project

## Create a rails Project

`rails new app_name`

## Create landing controller
`rails g controller home index`

## Change the default URL in
`root 'home#index'`

# 2 - WebPacker

## Install Packages

`yarn add bootstrap jquery popper.js`

## Environment changes
*Configure the Jquery and Popper aliases in the config/webpack/environment.js file.*
```
const {environment} = require('@rails/webpacker')
const webpack = require('webpack')
environment.plugins.append('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        Popper: ['popper.js', 'default']
    })
)

module.exports = environment
```

## Webpacker config
*Add the following to the config/webpacker.yml file.*
`resolved_paths: ['app/assets']`

# 3 - Application config
*Import bootstrap into the app/javascript/packs/application.js file.*

`import 'bootstrap';`

*Create the directory app/javascript/stylesheets/*
`mkdir app/javascript/stylesheets`

*Create the app/javascript/stylesheets/application.scss file*
`touch app/javascript/stylesheets/application.scss`

*Import CSS file into the app/javascript/packs/application.js file*
`import '../stylesheets/application'`

*Import bootstrap into the app/javascript/stylesheets/application.scss file.*
@import 'bootstrap'

*For AdminLTE 3, import fontawesome scripts into app/javascript/packs/application.js*
`import "@fortawesome/fontawesome-free/js/all";`

# 4 - Admin LTE template
`yarn add admin-lte@^3.0`

*Import the AdminLTE scripts into the app/javascript/packs/application.js file.*
`require('admin-lte');`

## We also need to install font-awesome.
`yarn add @fortawesome/fontawesome-free`

*Import fontawesome styles into app/javascript/stylesheets/application.scss*
*@import '@fortawesome/fontawesome-free';*

# 5 - Start rails server


