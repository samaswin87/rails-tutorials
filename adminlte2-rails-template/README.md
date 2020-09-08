# 1 - Rails Project

## Create a rails Project

`rails new app_name`

## Create landing controller
`rails g controller home index`

## Change the default URL in
`root 'home#index'`

# 2 - WebPacker

## Install Packages

`yarn add bootstrap@^3.3.7 jquery@^3.2 popper.js@^1.16.1`

## Environment changes
*Configure the Jquery and Popper aliases in the config/webpack/environment.js file.*
*I faced an issue like Error with Webpack Can't resolve '../fonts/glyphicons*
*I resolved by following the link [Webpacker URL Loader](https://github.com/rails/webpacker/blob/master/docs/css.md#resolve-url-loader)*
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

// resolve-url-loader must be used before sass-loader
environment.loaders.get('sass').use.splice(-1, 0, {
  loader: 'resolve-url-loader'
});

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
@import 'bootstrap/dist/css/bootstrap'
@import 'bootstrap/dist/css/bootstrap-theme'

# 4 - Admin LTE template
`yarn add admin-lte@^2.4.18`

*Import the AdminLTE scripts into the app/javascript/packs/application.js file.*
`require('admin-lte');`

*Import the AdminLTE stylesheets into the app/javascript/stylesheets/application.scss file.*
*@import "admin-lte/dist/css/AdminLTE";*
*@import "admin-lte/dist/css/skins/_all-skins";*

* Have to give the css file otherwise webpacker will throw error on reading JS files*

## We also need to install font-awesome.
`yarn add font-awesome@4.7.0`

*Import fontawesome styles into app/javascript/stylesheets/application.scss*
*@import "font-awesome/css/font-awesome.css";*

# 5 - Start rails server


