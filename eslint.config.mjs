// @ts-check
import antfu from '@antfu/eslint-config'

import withNuxt from './.nuxt/eslint.config.mjs'

export default withNuxt(antfu(
	{
		type: 'app',
		typescript: true,
		formatters: true,
		pnpm: true,
		stylistic: {
			indent: 'tab',
			semi: false,
			quotes: 'single',
		},
	},
	{
		rules: {
			'ts/no-redeclare': 'off',
			'ts/consistent-type-definitions': ['error', 'type'],
			'no-console': ['warn'],
			'antfu/no-top-level-await': ['off'],
			'node/prefer-global/process': ['off'],
			'node/no-process-env': ['error'],
			'perfectionist/sort-imports': ['error', {
				tsconfig: {
					rootDir: '.',
				},
			}],
			'unicorn/filename-case': ['error', {
				case: 'kebabCase',
				ignore: ['README.md'],
			}],
		},
	},
))
