addItem <- function(con, name, description, quantity) {
  dbExecute(con, "INSERT INTO inventory (name, description, quantity) VALUES (?, ?, ?)", 
            params = list(name, description, quantity))
  # last ID item
  id <- dbGetQuery(con, "SELECT last_insert_rowid() AS lastId")
  # SKU and time stamp
  sku <- paste0("SKU", format(Sys.time(), "%Y%m%d%H%M%S"), id$lastId)
  # update with SKUßß
  dbExecute(con, "UPDATE inventory SET sku = ? WHERE id = ?", params = list(sku, id$lastId))
  cat("Item added successfully with SKU: ", sku, "\n\n")
}
