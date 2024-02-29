# save to .csv
saveInventory <- function() {
  con <- connectToDatabase()
  inventory <- dbReadTable(con, "inventory")
  dbDisconnect(con)
  
  write.csv(inventory, "inventory.csv", row.names = FALSE)
  print("Inventory saved to file.")
}
