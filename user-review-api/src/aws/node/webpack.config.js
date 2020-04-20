const slsw = require('serverless-webpack');
const TerserPlugin = require('terser-webpack-plugin');

module.exports = {
    target: 'node',
    devtool: 'nosources-source-map',
    mode: slsw.lib.webpack.isLocal ? 'development' : 'production',
    entry: slsw.lib.entries,
    module: {
        rules: [
            {
                test: /\.js$/,
                loader: 'babel-loader',
                exclude: /node_modules/
            }
        ]
    },
    optimization: {
        minimize: slsw.lib.webpack.isLocal ? false : true,
        minimizer: [
          new TerserPlugin({
            terserOptions: {
              keep_fnames: true
            }
          })
        ]
    },
};