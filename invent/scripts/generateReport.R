# generate report
generateReport <- function() {
  con <- connectToDatabase()
  inventory <- dbReadTable(con, "inventory")
  dbDisconnect(con)
  
  report <- apply(inventory, 1, function(item) {
    paste("Name:", item["name"], "\nDescription:", item["description"], "\nQuantity:", item["quantity"], "\n")
  })
  
  writeLines(report, "report.txt")
  print("Report generated.")
}
