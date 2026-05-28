import { int, real, sqliteTable, text } from 'drizzle-orm/sqlite-core'

import { location } from './location'
import timestamps from './timestamps'

export const location_log = sqliteTable('location_log', {
	id: int().primaryKey({ autoIncrement: true }),
	name: text().notNull(),
	description: text(),
	started_at: int().notNull(),
	ended_at: int().notNull(),
	lat: real(),
	long: real(),
	location_id: int().notNull().references(() => location.id),
	...timestamps,
})
