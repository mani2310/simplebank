-- name: CreateAccount :one
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

-- name: ListAccounts :many
SELECT * FROM account
WHERE owner = $1
ORDER BY id
LIMIT $2
OFFSET $3;

-- name: AddAccountBalance :one
UPDATE account
SET balance = balance + sqlc.arg(amount)
WHERE id = sqlc.arg(id)
RETURNING *;

-- name: UpdateAccount :exec
UPDATE account SET balance = $2 
where id = $1;


-- name: DeleteAccount :exec
DELETE FROM account WHERE id = $1;
