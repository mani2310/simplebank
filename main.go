package main

import (
	"database/sql"
	"log"

	"github.com/simplebank/api"
	db "github.com/simplebank/db/sqlc"
	"github.com/simplebank/util"
)

func main() {
	config, err := util.LoadConfig(".") // current folder
	if err != nil {
		log.Fatal("cannot load config:", err)
	}

	conn, err := sql.Open(config.DBDriver, config.DBSource)
	if err != nil {
		log.Fatal("Cannot connect to db:", err)
	}

	store := db.NewStore(conn)
	server := api.NewServer(store)

	err = server.Start(config.ServerAddress)
	if err != nil {
		log.Fatal("cannot start server")
	}
}
