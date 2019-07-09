-module(persist).

-export([init_db/1]).

init_db(Pool) ->
    pgapp:squery(Pool, "
        DROP TABLE IF EXISTS users;
        CREATE TABLE users (
            id serial NOT NULL PRIMARY KEY,
            email varchar(256) NOT NULL,
            pass varchar(64) NOT NULL,
            fname varchar(256),
            lname varchar(256),
            active boolean NOT NULL DEFAULT FALSE,
            created_at timestamp DEFAULT current_timestamp,
            updated_at timestamp DEFAULT NULL,
            deleted_at timestamp DEFAULT NULL
        );
        CREATE INDEX users_email_active_idx ON users(email, active);
        CREATE INDEX users_email_pass_active_idx ON users(email, pass, active);
    ").