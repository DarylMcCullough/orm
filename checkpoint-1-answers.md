# Some functionality we'd like from our ORM

## remove duplicates in a query response

| My pseudo-code               | Equivalent SQL                |
|------------------------------|-------------------------------|
| `posts = Post.all.distinct`  |`SELECT DISTINCT * FROM post;` |



## filter records using inequalities, pattern matching, ranges, and boolean logic

| My pseudo-code                                                                            | Equivalent SQL                                                                          |
|-------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| `posts = Post.where(:create_date >= '2017-10-01')`                                        |`SELECT * FROM post WHERE create_date >= '2017-10';`                                     |
| `posts = Post.where(matches(:title, '%Harry Potter%') )`                                  | `SELECT * FROM post WHERE title LIKE '%HarryPotter%';`                                  |
| `posts = Post.where(between(:create_date, '2017-10-01', '2017-10-31') )`                  | `SELECT * FROM post WHERE create_date BETWEEN '2017-10-01' AND '2017-10-31';`           |
| `posts = Post.where(:create_date >= '2017-10-01' and matches(:title, '%Harry Potter%'))`  | `SELECT * FROM post WHERE create_date >= '2017-10-01' AND title LIKE '%HarryPotter%';`  |

## sort records in a particular order
| My pseudo-code                                | Equivalent SQL                              |
|-----------------------------------------------|---------------------------------------------|
| `posts = Post.all.order(:create_date)`        | `SELECT * FROM post ORDER BY create_date;`  |

## limit the number of records returned

| My pseudo-code                  | Equivalent SQL                  |
|---------------------------------|---------------------------------|
| `posts = Post.limit(10)`        | `SELECT * FROM post LIMIT 10;`  |

## group records into sections

| My pseudo-code                            | Equivalent SQL                          |
|-------------------------------------------|-----------------------------------------|
| `posts = Post.all.group(:user_id)`        | `SELECT * FROM post GROUP BY user_id;`  |


## perform calculations using aggregate functions

| My pseudo-code                                | Equivalent SQL                          |
|-----------------------------------------------|-----------------------------------------|
| `num_posts = Post.count`                      | `SELECT COUNT(id) FROM post ;`          |
| `avg_comments = Post.average(:num_comments)`  | `SELECT AVG(num_comments) FROM post;`   |
| `all_comments = Post.sum(:num_comments)`      | `SELECT SUM(num_comments) FROM post;`   |

## join tables using cross join, inner join, and outer join

| My pseudo-code                                                        | Equivalent SQL                                                    |
|-----------------------------------------------------------------------|-------------------------------------------------------------------|
| `posts_and_users = Post.cross_join(User)`                             | `SELECT * FROM post CROSS JOIN user;`                             |
| `posts_and_users = Post.inner_join(User, Post.user_id = User.id)`     | `SELECT * FROM post INNER JOIN user ON post.user_id = user.id;`   |
| `posts_and_users = Post.outer_join(User, Post.user_id = User.id)`     | `SELECT * FROM post OUTER JOIN user ON post.user_id = user.id;`   |