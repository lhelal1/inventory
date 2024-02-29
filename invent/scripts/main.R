source("dbConnect.R")
source("addItem.R")
source("saveInventory.R")
source("generateReport.R")

# example
con <- connectToDB()

# add items
addItem(con, "Caneta Azul", "Uma caneta azul", 10)
addItem(con, "Caderno 100 folhas", "Caderno universitário", 5)

generateReport(con, "inventory_report.txt")
saveInventoryToFile(con, "inventory.csv")

dbDisconnect(con)
