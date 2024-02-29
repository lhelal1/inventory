library(DBI)
library(RSQLite)

# connect to SQLite
connectToDatabase <- function() {
  con <- dbConnect(RSQLite::SQLite(), dbname = "inventory.db")
  return(con)
}

# init database
initializeDatabase <- function() {
  con <- connectToDatabase()
  dbExecute(con, "CREATE TABLE IF NOT EXISTS inventory (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT NOT NULL,
                description TEXT,
                quantity INTEGER)")
  dbDisconnect(con)
}

# or

connectToDB <- function() {
  con <- dbConnect(RSQLite::SQLite(), dbname = "workbench_inventory.db")
  
  # checks out
  dbExecute(con, "CREATE TABLE IF NOT EXISTS inventory (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    quantity INTEGER NOT NULL,
    sku TEXT)")
  
  return(con)
}

# init
initializeDatabase()
