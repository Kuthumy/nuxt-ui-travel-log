import { drizzle } from 'drizzle-orm/node-sqlite'

import env from '../env.ts'

const db = drizzle({
	connection: env.DB_FILE_NAME,
	casing: 'snake_case',
})

export default db
