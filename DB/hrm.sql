SET SESSION AUTHORIZATION 'postgres';

CREATE TABLE IF NOT EXISTS admins (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  modified_at TIMESTAMP DEFAULT NULL,
  deleted_at TIMESTAMP
);

INSERT INTO admins (name, password, created_at, modified_at, deleted_at)
VALUES ('razu', '123', '2017-05-24 04:44:03', NULL, NULL);

CREATE TABLE IF NOT EXISTS attendances (
  id SERIAL PRIMARY KEY,
  employee_id INT NOT NULL,
  date DATE NOT NULL,
  clock_in TIME NOT NULL,
  clock_out TIME NOT NULL,
  total_work FLOAT NOT NULL,
  status INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  modified_at TIMESTAMP DEFAULT NULL,
  deleted_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS departments (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  status INT NOT NULL DEFAULT 1,
  create_by VARCHAR(30),
  create_date TIMESTAMP,
  modified_by VARCHAR(30),
  modified_date TIMESTAMP
);

INSERT INTO departments (name, status, create_by, create_date, modified_by, modified_date)
VALUES
('IT', 1, 'Admin', '2017-05-24 06:37:11', NULL, '2017-05-05 18:00:00'),
('Coaching', 1, 'Admin', '2017-05-24 06:37:29', NULL, NULL);

CREATE TABLE IF NOT EXISTS employees (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  user_name VARCHAR(30) NOT NULL,
  password VARCHAR(20) NOT NULL,
  gender CHAR(6) NOT NULL,
  email VARCHAR(30) NOT NULL,
  department_id INT NOT NULL,
  designation_id INT NOT NULL,
  mobile_no VARCHAR(15) NOT NULL,
  status INT NOT NULL DEFAULT 1,
  create_by VARCHAR(30),
  created_date TIMESTAMP,
  modified_by VARCHAR(30),
  modified_date TIMESTAMP
);

CREATE TABLE IF NOT EXISTS employee_designations (
  id SERIAL PRIMARY KEY,
  title VARCHAR(30) NOT NULL,
  status INT NOT NULL DEFAULT 1,
  created_by VARCHAR(30),
  create_date TIMESTAMP,
  modified_by VARCHAR(30),
  modified_date TIMESTAMP
);

INSERT INTO employee_designations (title, status, created_by, create_date, modified_by, modified_date)
VALUES
('Teacher', 1, 'Admin', '2017-05-24 06:36:17', NULL, NULL),
('Programmer', 1, 'Admin', '2017-05-03 18:00:00', NULL, NULL);

CREATE TABLE IF NOT EXISTS employee_leavs (
  id SERIAL PRIMARY KEY,
  leave_id INT NOT NULL,
  total_leave_yarly INT NOT NULL,
  deducated_leav INT NOT NULL,
  remaining_leav INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  modfied_at TIMESTAMP DEFAULT NULL,
  deleted_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS expenses (
  id SERIAL PRIMARY KEY,
  employee_id INT NOT NULL,
  item VARCHAR(30) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  modified_at TIMESTAMP DEFAULT NULL,
  deleted_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS holiday_informations (
  id SERIAL PRIMARY KEY,
  holiday_id INT NOT NULL,
  name VARCHAR(30) NOT NULL,
  types VARCHAR(30) NOT NULL,
  status INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  modfied_at TIMESTAMP DEFAULT NULL,
  deleted_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS holydays (
  id SERIAL PRIMARY KEY,
  attendace_id INT NOT NULL,
  month DATE NOT NULL,
  day DATE NOT NULL,
  year DATE NOT NULL,
  description VARCHAR(155) NOT NULL,
  status INT NOT NULL,
  crated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  modified_at TIMESTAMP DEFAULT NULL,
  deleted_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS leaves (
  id SERIAL PRIMARY KEY,
  employee_id INT NOT NULL,
  type VARCHAR(30) NOT NULL,
  leav_to DATE NOT NULL,
  leav_from DATE NOT NULL,
  total_leav INT NOT NULL,
  staus INT NOT NULL,
  created_at TIMESTAMP,
  modified_at TIMESTAMP,
  deleted_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS live_events (
  id SERIAL PRIMARY KEY,
  subject VARCHAR(30) NOT NULL,
  event_date DATE NOT NULL,
  event_time TIME NOT NULL,
  description TEXT NOT NULL,
  status INT NOT NULL DEFAULT 1,
  insert_by VARCHAR(30) NOT NULL,
  insert_date TIMESTAMP,
  update_by VARCHAR(30) NOT NULL,
  update_date TIMESTAMP
);

INSERT INTO live_events (subject, event_date, event_time, description, status, insert_by, insert_date, update_by, update_date)
VALUES
('Event', '2017-05-03', '00:17:00', 'sdfsdfsdf', 1, 'sxssdsa', '2017-05-29 18:00:00', NULL, NULL),
('Live Event', '2017-05-06', '12:59:00', 'dfgfgfg', 0, 'admin', '2017-05-23 15:03:11', NULL, NULL),
('Mitting', '2017-05-13', '12:59:00', 'xcvzxcvc', 1, 'admin', '2017-05-23 15:04:01', NULL, NULL),
('Outgoing', '2017-05-25', '12:59:00', 'gjhygjhjhhgjhjh', 1, 'admin', '2017-05-24 04:04:43', NULL, NULL);

CREATE TABLE IF NOT EXISTS notices (
  id SERIAL PRIMARY KEY,
  subject VARCHAR(30) NOT NULL,
  notice_date DATE NOT NULL,
  notice_time TIME NOT NULL,
  description TEXT NOT NULL,
  status INT NOT NULL DEFAULT 1,
  insert_by VARCHAR(30) NOT NULL,
  insert_date TIMESTAMP,
  update_by VARCHAR(30) NOT NULL,
  update_date TIMESTAMP
);

INSERT INTO notices (subject, notice_date, notice_time, description, status, insert_by, insert_date, update_by, update_date)
VALUES
('Board Mitting', '2017-05-22', '10:01:00', 'fh htyt rtyt t rt', 1, 'admin', '2017-05-21 20:00:50', NULL, NULL),
('', NULL, NULL, '', 1, 'admin', '2017-05-23 14:57:17', NULL, NULL);

CREATE INDEX IF NOT EXISTS idx_admins_id ON admins (id);
CREATE INDEX IF NOT EXISTS idx_attendances_id ON attendances (id);
CREATE INDEX IF NOT EXISTS idx_departments_id ON departments (id);
CREATE INDEX IF NOT EXISTS idx_employees_id ON employees (id);
CREATE INDEX IF NOT EXISTS idx_employee_designations_id ON employee_designations (id);
CREATE INDEX IF NOT EXISTS idx_employee_leavs_id ON employee_leavs (id);
CREATE INDEX IF NOT EXISTS idx_expenses_id ON expenses (id);
CREATE INDEX IF NOT EXISTS idx_holiday_informations_id ON holiday_informations (id);
CREATE INDEX IF NOT EXISTS idx_holydays_id ON holydays (id);
CREATE INDEX IF NOT EXISTS idx_leaves_id ON leaves (id);
CREATE INDEX IF NOT EXISTS idx_live_events_id ON live_events (id);
CREATE INDEX IF NOT EXISTS idx_notices_id ON notices (id);
