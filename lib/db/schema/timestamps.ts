import { int } from 'drizzle-orm/sqlite-core'

export default {
	created_at: int().notNull().$default(() => Date.now()),
	updated_at: int().notNull().$default(() => Date.now()),
}
