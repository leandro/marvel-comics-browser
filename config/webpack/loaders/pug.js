module.exports = {
  test: /\.pug$/,
  oneOf: [
    {
      resourceQuery: /^\?vue/,
      use: ['pug-plain-loader']
    },
    {
      use: ['raw-loader', 'pug-plain-loader']
    }
  ]
};
