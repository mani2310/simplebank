-- name: CreateAccountAndReturnId :one
INSERT INTO account (
  owner, balance,currency
) VALUES (
  $1, $2, $3
)
RETURNING *;

-- name: GetAccount :one
SELECT * FROM account
WHERE id = $1;

-- name: GetAccounts :many
SELECT * FROM account
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: UpdateAccount :exec
UPDATE account SET balance = $2 
where id = $1;


-- name: DeleteAccount :exec
DELETE FROM account WHERE id = $1;
