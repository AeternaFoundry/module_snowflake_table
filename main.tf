resource "snowflake_table" "tables" {
  for_each = var.tables

  database                    = each.value.database
  name                        = each.value.name
  schema                      = each.value.schema
  change_tracking             = each.value.change_tracking
  cluster_by                  = each.value.cluster_by
  comment                     = each.value.comment
  data_retention_time_in_days = each.value.data_retention_time_in_days

  dynamic "column" {
    for_each = each.value.column
    content {
      collate = column.value.collate
      comment = column.value.comment
      dynamic "default" {
        for_each = column.value.default != null ? [column.value.default] : []
        content {
          constant   = default.value.constant
          expression = default.value.expression
          sequence   = default.value.sequence
        }
      }
      dynamic "identity" {
        for_each = column.value.identity != null ? [column.value.identity] : []
        content {
          start_num = identity.value.start_num
          step_num  = identity.value.step_num
        }
      }
      masking_policy = column.value.masking_policy
      name           = column.value.name
      nullable       = column.value.nullable
      type           = column.value.type
    }
  }

  dynamic "primary_key" {
    for_each = each.value.primary_key != null ? [each.value.primary_key] : []
    content {
      keys = primary_key.value.keys
      name = primary_key.value.name
    }
  }

  dynamic "tag" {
    for_each = each.value.tag != null ? each.value.tag : []
    content {
      database = tag.value.database
      name     = tag.value.name
      schema   = tag.value.schema
      value    = tag.value.value
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

