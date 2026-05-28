// https://nuxt.com/docs/api/configuration/nuxt-config
import './lib/env'

export default defineNuxtConfig({

	modules: ['@nuxt/eslint', '@nuxt/ui'],

	devtools: { enabled: true },

	css: ['~/assets/css/main.css'],

	compatibilityDate: '2025-07-15',

	vite: {
		optimizeDeps: {
			include: [
				'@vue/devtools-core',
				'@vue/devtools-kit',
			],
		},
	},

	eslint: {
		config: {
			nuxt: {
				sortConfigKeys: true,
			},
			standalone: false,
		},
	},
})
