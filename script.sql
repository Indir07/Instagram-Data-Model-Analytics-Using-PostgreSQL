CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    full_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Posts (
    post_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    caption TEXT,
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Comments (
    comment_id SERIAL PRIMARY KEY,
    post_id INT REFERENCES Posts(post_id) ON DELETE CASCADE,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Likes (
    like_id SERIAL PRIMARY KEY,
    post_id INT REFERENCES Posts(post_id) ON DELETE CASCADE,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Followers (
    follower_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    followee_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (follower_id, followee_id)
);


INSERT INTO Users (username, email, full_name) VALUES
('john_doe', 'john@example.com', 'John Doe'),
('jane_smith', 'jane@example.com', 'Jane Smith'),
('alice_wang', 'alice@example.com', 'Alice Wang'),
('bob_jones', 'bob@example.com', 'Bob Jones'),
('emily_davis', 'emily@example.com', 'Emily Davis'),
('michael_brown', 'michael@example.com', 'Michael Brown'),
('sarah_lee', 'sarah@example.com', 'Sarah Lee'),
('david_wilson', 'david@example.com', 'David Wilson'),
('lisa_taylor', 'lisa@example.com', 'Lisa Taylor'),
('kevin_martin', 'kevin@example.com', 'Kevin Martin');


INSERT INTO Posts (user_id, caption, image_url) VALUES
(1, 'Beautiful sunset!', 'https://example.com/sunset.jpg'),
(2, 'Morning coffee vibes ☕', 'https://example.com/coffee.jpg'),
(3, 'Exploring new places 🌍', 'https://example.com/travel.jpg'),
(4, 'Weekend workout 💪', 'https://example.com/workout.jpg'),
(5, 'Delicious dinner 🍝', 'https://example.com/dinner.jpg'),
(6, 'Throwback to last summer 🌞', 'https://example.com/summer.jpg'),
(7, 'New book recommendation 📚', 'https://example.com/book.jpg'),
(8, 'Art project in progress 🎨', 'https://example.com/art.jpg'),
(9, 'Puppy love 🐶', 'https://example.com/puppy.jpg'),
(10, 'City lights at night 🌃', 'https://example.com/city.jpg');


INSERT INTO Comments (post_id, user_id, comment_text) VALUES
(1, 2, 'Amazing shot!'),
(1, 3, 'Where was this taken?'),
(2, 1, 'Coffee is life!'),
(3, 4, 'Wish I could travel too!'),
(4, 5, 'Keep up the good work!'),
(5, 6, 'That looks delicious!'),
(6, 7, 'Summer vibes are the best!'),
(7, 8, 'What book are you reading?'),
(8, 9, 'Love your art style!'),
(9, 10, 'Cute puppy!');

INSERT INTO Likes (post_id, user_id) VALUES
(1, 2),
(1, 3),
(2, 1),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10);


INSERT INTO Followers (follower_id, followee_id) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);


SELECT * FROM Users;
SELECT * FROM Posts;
SELECT * FROM Comments;
SELECT * FROM Followers;
SELECT * FROM Likes;




-- Get all posts by a specific user:

SELECT p.post_id, p.caption, p.created_at
FROM Posts p
JOIN Users u ON p.user_id = u.user_id
WHERE u.username = 'john_doe';


-- Count the number of likes for each post:

SELECT p.post_id, COUNT(l.like_id) AS like_count
FROM Posts p
LEFT JOIN Likes l ON p.post_id = l.post_id
GROUP BY p.post_id
ORDER BY like_count DESC;


-- Get the top 5 most liked posts:

SELECT p.post_id, COUNT(l.like_id) AS like_count
FROM Posts p
LEFT JOIN Likes l ON p.post_id = l.post_id
GROUP BY p.post_id
ORDER BY like_count DESC
LIMIT 5;

 -- Get all comments for a specific post

SELECT c.comment_id, u.username, c.comment_text, c.created_at
FROM Comments c
JOIN Users u ON c.user_id = u.user_id
WHERE c.post_id = 1;


-- Get the number of followers for each user:

SELECT u.user_id, u.username, COUNT(f.follower_id) AS follower_count
FROM Users u
LEFT JOIN Followers f ON u.user_id = f.followee_id
GROUP BY u.user_id
ORDER BY follower_count DESC;


-- Use a CTE to find users who have liked their own posts

WITH UserLikes AS (
    SELECT l.user_id, l.post_id
    FROM Likes l
    JOIN Posts p ON l.post_id = p.post_id
    WHERE l.user_id = p.user_id
)
SELECT u.username, ul.post_id
FROM UserLikes ul
JOIN Users u ON ul.user_id = u.user_id;


-- Use a window function to rank posts by like count

SELECT p.post_id, p.caption, COUNT(l.like_id) AS like_count,
       RANK() OVER (ORDER BY COUNT(l.like_id) DESC) AS post_rank
FROM Posts p
LEFT JOIN Likes l ON p.post_id = l.post_id
GROUP BY p.post_id;

-- Use date manipulation to find posts created in the last 7 days

SELECT p.post_id, p.caption, p.created_at
FROM Posts p
WHERE p.created_at >= NOW() - INTERVAL '7 days';


