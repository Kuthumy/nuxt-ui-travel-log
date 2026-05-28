import { int, sqliteTable, text } from 'drizzle-orm/sqlite-core'

import { location_log } from './location-log.ts'
import timestamps from './timestamps'

export const location_log_image = sqliteTable('location_log_image', {
	id: int().primaryKey({ autoIncrement: true }),
	key: text().notNull(),
	location_log_id: int().references(() => location_log.id),
	...timestamps,
})
