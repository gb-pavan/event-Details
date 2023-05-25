/*CREATE TABLE eventdetails (
  type VARCHAR(255),
  uid INT,
  name VARCHAR(255),
  tagline VARCHAR(255),
  schedule DATETIME,
  description TEXT,
  files BLOB,
  moderator VARCHAR(255),
  category VARCHAR(255),
  sub_category VARCHAR(255),
  rigor_type INT,
  attendees JSON
);
*/

/*INSERT INTO eventdetails (type, uid, name, tagline, schedule, description, files, moderator, category, sub_category, rigor_type, attendees)
VALUES
  ('Conference', 1, 'AI Summit', 'Exploring the Future of Artificial Intelligence', '2023-06-15 09:00:00', 'Join us for a day of insightful discussions on AI advancements.', 'image1.jpg', 'John Doe', 'Technology', 'Artificial Intelligence', 1, '[{"name": "Alice", "email": "alice@example.com"}, {"name": "Bob", "email": "bob@example.com"}]'),
  ('Workshop', 2, 'Data Science Bootcamp', 'Master the Skills of Data Science', '2023-07-10 14:30:00', 'Learn the fundamentals of data science and apply them in real-world scenarios.', 'image2.jpg', 'Jane Smith', 'Technology', 'Data Science', 2, '[{"name": "Eve", "email": "eve@example.com"}, {"name": "Charlie", "email": "charlie@example.com"}]');*/


SELECT * FROM eventdetails
/*SELECT * FROM eventdetails WHERE uid = '3';*/
/*DELETE FROM eventdetails WHERE uid = '7';*/

/*INSERT INTO eventdetails (type, uid, name, tagline, schedule, description, files, moderator, category, sub_category, rigor_type, attendees)
VALUES
  
  ('Webinar', 3, 'Digital Marketing Strategies', 'Unlocking the Potential of Online Marketing', '2023-08-20 17:00:00', 'Discover the latest trends and techniques in digital marketing.', 'image3.jpg', 'Sarah Johnson', 'Marketing', 'Digital Marketing', 1, '[{"name": "Dave", "email": "dave@example.com"}, {"name": "Emma", "email": "emma@example.com"}]'),
  
  ('Conference', 4, 'Leadership Summit', 'Empowering Leaders for Success', '2023-09-12 10:00:00', 'Join us for a gathering of influential leaders and gain valuable insights.', 'image4.jpg', 'Michael Brown', 'Business', 'Leadership', 2, '[{"name": "Grace", "email": "grace@example.com"}, {"name": "Henry", "email": "henry@example.com"}]'),
  ('Workshop', 5, 'UX Design Workshop', 'Crafting Engaging User Experiences', '2023-10-05 13:30:00', 'Learn the principles and techniques of user experience design.', 'image5.jpg', 'Emily Wilson', 'Design', 'UX Design', 1, '[{"name": "Oliver", "email": "oliver@example.com"}, {"name": "Sophia", "email": "sophia@example.com"}]'),
 
  ('Conference', 6, 'Startup Summit', 'Nurturing Innovation and Entrepreneurship', '2024-03-10 09:00:00', 'Join us for a conference focused on startups and entrepreneurial success.', 'image19.jpg', 'Daniel Lee', 'Business', 'Startups', 2, '[{"name": "Lucas", "email": "lucas@example.com"}, {"name": "Mia", "email": "mia@example.com"}]'),
  ('Workshop', 7, 'Photography Masterclass', 'Capturing Moments through the Lens', '2023-12-05 15:30:00', 'Learn the art and techniques of photography from industry professionals.', 'image7.jpg', 'David Wilson', 'Art', 'Photography', 1, '[{"name": "Benjamin", "email": "benjamin@example.com"}, {"name": "Charlotte", "email": "charlotte@example.com"}]')*/
