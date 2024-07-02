package database

import (
	"fmt"
	"log"
	"os"

	"github.com/wiratR/go-orm-jwt/config"
	"github.com/wiratR/go-orm-jwt/models"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

var DB *gorm.DB //database

func ConnectDB(config *config.Config) {

	fmt.Printf("Database hostname = %s\n", config.DBHost)

	var err error
	// dsn := fmt.Sprintf("host=%s user=%s password=%s dbname=%s port=%d sslmode=disable TimeZone=Asia/Bangkok",
	// 	config.DBHost,
	// 	config.DBUserName,
	// 	config.DBUserPassword,
	// 	config.DBName,
	// 	config.DBPort)

	// Build connection string
	dsn := "host=" + os.Getenv("DB_HOST") +
		" user=" + os.Getenv("DB_USER") +
		" password=" + os.Getenv("DB_PASSWORD") +
		" dbname=" + os.Getenv("DB_NAME") +
		" port=" + os.Getenv("DB_PORT") +
		" sslmode=disable TimeZone=Asia/Bangkok"

	// Connect to PostgreSQL
	DB, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		log.Fatalf("failed to connect to the database: %v", err)
	}

	DB.Exec("CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\"")
	DB.Logger = logger.Default.LogMode(logger.Info)

	log.Println("Running Migrations")
	err = DB.AutoMigrate(&models.User{})
	if err != nil {
		log.Fatal("Migration Failed:  \n", err.Error())
		os.Exit(1)
	}

	log.Println("🚀 Connected Successfully to the Database")

}
