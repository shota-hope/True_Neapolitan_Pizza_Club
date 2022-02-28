const { environment } = require("@rails/webpacker");
const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    })
)
// const eslint = require("./loaders/eslint");

// environment.loaders.append("eslint", eslint);
module.exports = environment;
