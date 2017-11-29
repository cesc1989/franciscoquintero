var path = require('path');
var ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
    context: __dirname,
    entry: {
        main: './src/stylesheets/main.scss'
    },
    output: {
        filename: '[name].css',
        path: path.resolve(__dirname, 'public/stylesheets/')
    },
    module: {
        loaders: [{
            test: /\.scss$/,
            use: ExtractTextPlugin.extract({
                fallback: 'style-loader',
                use: ['css-loader', 'sass-loader']
            })
        }]
    },
    plugins: [
        new ExtractTextPlugin('[name].css')
    ]
};
