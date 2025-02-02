# Instagram Data Model & Analytics Using PostgreSQL

🚀 **Instagram Data Model & Analytics Project** 🚀

## Overview
This project is a relational database model designed to simulate Instagram's core functionalities. It focuses on data modeling, advanced SQL querying, and real-world analytics to gain insights into user interactions.

## 📌 Features
- **Data Modeling**: Designed a robust relational database schema with tables for Users, Posts, Comments, Likes, and Followers, ensuring data integrity and scalability.
- **SQL Queries**: Complex queries to analyze user interactions, such as post rankings, like counts, and follower relationships.
- **Advanced SQL Techniques**: Utilized CTEs, window functions, and date manipulation to derive meaningful insights.
- **Real-World Insights**: Simulated scenarios such as user engagement, post popularity, and follower analytics.

## 🛠 Database Schema
The database schema includes the following tables:

### Users Table
| Column Name | Data Type | Description |
|------------|-----------|-------------|
| user_id    | INT (PK)  | Unique user identifier |
| username   | VARCHAR   | User’s username |
| email      | VARCHAR   | User’s email address |
| full_name  | VARCHAR   | User’s full name |
| created_at | TIMESTAMP | Account creation date |

### Posts Table
| Column Name | Data Type | Description |
|------------|-----------|-------------|
| post_id    | INT (PK)  | Unique post identifier |
| user_id    | INT (FK)  | User who created the post |
| caption    | TEXT      | Post caption |
| image_url  | VARCHAR   | URL of the post image |
| created_at | TIMESTAMP | Post creation date |

### Comments Table
| Column Name | Data Type | Description |
|------------|-----------|-------------|
| comment_id  | INT (PK)  | Unique comment identifier |
| post_id     | INT (FK)  | Post being commented on |
| user_id     | INT (FK)  | User who made the comment |
| comment_text| TEXT      | Comment content |
| created_at  | TIMESTAMP | Comment creation date |

### Likes Table
| Column Name | Data Type | Description |
|------------|-----------|-------------|
| like_id    | INT (PK)  | Unique like identifier |
| post_id    | INT (FK)  | Liked post |
| user_id    | INT (FK)  | User who liked the post |
| created_at | TIMESTAMP | Like timestamp |

### Followers Table
| Column Name | Data Type | Description |
|------------|-----------|-------------|
| follower_id | INT (FK)  | User following another user |
| followee_id | INT (FK)  | User being followed |
| created_at  | TIMESTAMP | Follow timestamp |

## 📊 Sample Insights Generated
- **Top 5 most liked posts**
- **Users who liked their own posts**
- **Follower counts and engagement metrics**

## 🔧 Setup Instructions
1. Install PostgreSQL and create a database.
2. Clone the repository:
   ```bash
   git clone https://github.com/Indir07/Instagram-Data-Model-Analytics-Using-PostgreSQL.git
   ```
3. Navigate to the project directory:
   ```bash
   cd Instagram-Data-Model-Analytics-Using-PostgreSQL
   ```
4. Run the SQL scripts to create tables and insert sample data:
   ```sql
   psql -U your_username -d your_database -f schema.sql
   ```
5. Execute the queries to generate insights.

## 🤝 Contributions
Feel free to fork the repository, submit issues, or contribute enhancements!

## 🔗 Connect with Me
If you found this project useful or have feedback, let’s connect on LinkedIn!

**GitHub Repository:** [GitHub Link](https://github.com/Indir07/Instagram-Data-Model-Analytics-Using-PostgreSQL)

Happy coding! 🚀

