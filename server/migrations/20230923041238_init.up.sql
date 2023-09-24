CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS users (
    "id" uuid PRIMARY KEY NOT NULL DEFAULT (uuid_generate_v4()),
    "name" varchar NOT NULL,
    "email" varchar UNIQUE NOT NULL,
    "password" varchar NOT NULL,
    "role" varchar NOT NULL,
    "url_avatar" varchar NOT NULL
);

CREATE TABLE IF NOT EXISTS transactions (
    "id" uuid PRIMARY KEY NOT NULL DEFAULT (uuid_generate_v4()), 
    "category" varchar NOT NULL,
    "purpose" varchar NOT NULL,
    "amount" numeric(10, 2) NOT NULL,
    "type_of" varchar NOT NULL,
    "notes" varchar NOT NULL,
    "created_at" TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    "fk_user" uuid REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS category (
    "id" uuid PRIMARY KEY NOT NULL DEFAULT (uuid_generate_v4()),
    "category_name" varchar NOT NULL,
    "category_description" varchar NOT NULL, 
    "fk_user" uuid REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS goals (
    "id" uuid PRIMARY KEY NOT NULL DEFAULT (uuid_generate_v4()),
    "goal_name" varchar NOT NULL,
    "goal_description" varchar NOT NULL,
    "desired_amount" numeric(10,2) NOT NULL,
    "current_amount" numeric(10,2) NOT NULL,
    "progress" numeric(10,2) NOT NULL,
    "due_to" DATE NOT NULL, 
    "fk_user" uuid REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Insert default user 

INSERT INTO users("name", "email", "password", "role", "url_avatar") VALUES ('diegob', 'diego@gmail.com', 'password123','admin', 'url_avatar');
