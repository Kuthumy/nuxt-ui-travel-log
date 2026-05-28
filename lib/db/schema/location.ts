import { int, real, sqliteTable, text } from 'drizzle-orm/sqlite-core'

import timestamps from './timestamps'

export const location = sqliteTable('location', {
	id: int().primaryKey({ autoIncrement: true }),
	name: text().notNull(),
	slug: text().notNull().unique(),
	description: text(),
	lat: real().notNull(),
	long: real().notNull(),
	...timestamps,
})
