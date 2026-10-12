output "tables_id" {
  description = "Map of id values across all tables, keyed the same as var.tables except keys with no id are omitted"
  value       = { for k, v in snowflake_table.tables : k => v.id if v.id != null && length(v.id) > 0 }
}
output "tables_change_tracking" {
  description = "Map of change_tracking values across all tables, keyed the same as var.tables except keys with no change_tracking are omitted"
  value       = { for k, v in snowflake_table.tables : k => v.change_tracking if v.change_tracking != null }
}
output "tables_cluster_by" {
  description = "Map of cluster_by values across all tables, keyed the same as var.tables except keys with no cluster_by are omitted"
  value       = { for k, v in snowflake_table.tables : k => v.cluster_by if v.cluster_by != null && length(v.cluster_by) > 0 }
}
output "tables_column" {
  description = "Map of column values across all tables, keyed the same as var.tables except keys with no column are omitted"
  value       = { for k, v in snowflake_table.tables : k => v.column if v.column != null && length(v.column) > 0 }
}
output "tables_comment" {
  description = "Map of comment values across all tables, keyed the same as var.tables except keys with no comment are omitted"
  value       = { for k, v in snowflake_table.tables : k => v.comment if v.comment != null && length(v.comment) > 0 }
}
output "tables_data_retention_time_in_days" {
  description = "Map of data_retention_time_in_days values across all tables, keyed the same as var.tables except keys with no data_retention_time_in_days are omitted"
  value       = { for k, v in snowflake_table.tables : k => v.data_retention_time_in_days if v.data_retention_time_in_days != null }
}
output "tables_database" {
  description = "Map of database values across all tables, keyed the same as var.tables except keys with no database are omitted"
  value       = { for k, v in snowflake_table.tables : k => v.database if v.database != null && length(v.database) > 0 }
}
output "tables_fully_qualified_name" {
  description = "Map of fully_qualified_name values across all tables, keyed the same as var.tables except keys with no fully_qualified_name are omitted"
  value       = { for k, v in snowflake_table.tables : k => v.fully_qualified_name if v.fully_qualified_name != null && length(v.fully_qualified_name) > 0 }
}
output "tables_name" {
  description = "Map of name values across all tables, keyed the same as var.tables except keys with no name are omitted"
  value       = { for k, v in snowflake_table.tables : k => v.name if v.name != null && length(v.name) > 0 }
}
output "tables_owner" {
  description = "Map of owner values across all tables, keyed the same as var.tables except keys with no owner are omitted"
  value       = { for k, v in snowflake_table.tables : k => v.owner if v.owner != null && length(v.owner) > 0 }
}
output "tables_primary_key" {
  description = "Map of primary_key values across all tables, keyed the same as var.tables except keys with no primary_key are omitted"
  value       = { for k, v in snowflake_table.tables : k => one(v.primary_key) if v.primary_key != null && length(v.primary_key) > 0 }
}
output "tables_schema" {
  description = "Map of schema values across all tables, keyed the same as var.tables except keys with no schema are omitted"
  value       = { for k, v in snowflake_table.tables : k => v.schema if v.schema != null && length(v.schema) > 0 }
}
output "tables_tag" {
  description = "Map of tag values across all tables, keyed the same as var.tables except keys with no tag are omitted"
  value       = { for k, v in snowflake_table.tables : k => v.tag if v.tag != null && length(v.tag) > 0 }
}

