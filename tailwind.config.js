module.exports = {
  content: [
    './node_modules/flowbite/**/*.js',
    './app/views/**/*.html.erb',
    './app/components/**/*.html.erb',
    './app/components/**/*.rb',
    './app/pages/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [require('flowbite/plugin')],
  theme: {
    extend: {
      screens: { xs: '480px' },
      fontFamily: {
        primary: ['JetBrains Mono', 'monospace']
      },
      keyframes: {
        'fade-in-up': {
          '0%': {
            opacity: '0',
            transform: 'translateY(0)'
          },
          '20%': {
            opacity: '1',
            transform: 'translateY(-100px)'
          },
          '80%': {
            opacity: '1',
            transform: 'translateY(-100px)'
          },
          '99%': {
            opacity: '0',
            transform: 'translateY(-100px)'
          },
          '100%': {
            opacity: '0',
            transform: 'translateY(0)'
          }
        }
      },
      animation: {
        'fade-in-up': 'fade-in-up 3500ms cubic-bezier(0,1.46,.5,.92) forwards'
      }
    }
  }
}
