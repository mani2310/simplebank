package main

import (
	"database/sql"
	"log"

	"github.com/go_udemy/api"
	db "github.com/go_udemy/db/sqlc"
	"github.com/go_udemy/util"
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
